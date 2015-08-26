
# coding: utf-8

# In[1]:

import numpy
from numpy.linalg import solve,inv
import matplotlib.pyplot as plt


# In[4]:

#Carrega arquivo
ponteiro = open("../../inputs/edxCalibration/edx_adjusted/2014/K.csv","r") 
#Lê as linhas para um Array
linhas = ponteiro.readlines()
#Fecha arquivo
ponteiro.close()


# In[5]:

#Número de pontos (desconsiderando o cabeçalho)
len(linhas)-1


# In[6]:

#Transforma o array em numpy.array
linhas = numpy.array(linhas)


# In[7]:

#Criar um numpy.array para cada uma das 3 colunas (Z, fator de respota e erro).
#Pois, isso facilitará as facilitará 
Z = numpy.array([])
Y = numpy.array([])
Yerror = numpy.array([])


# In[8]:

#Desmembra o numpy.array linhas, nos 3 numpy.array criados acima.  
for line in range(1,len(linhas)):
    current_line = linhas[line].split(',')
    Z = numpy.append(Z,float(current_line[0]))
    Y = numpy.append(Y,float(current_line[1]))
    Yerror = numpy.append(Yerror,float(current_line[2]))


# In[9]:

#define o grau do polinômio que ajustaremos
degree = 9


# In[10]:

#Cria uma matriz X da forma que cada linha seja refente ao elemento Z. 
#e cada coluna seja da forma [1 z z^2 z^3 ... z^n],
#onde n é o grau do polinônio desejado.  
X = numpy.vstack([Z**j for j in range(degree)]).T


# In[11]:

#Variância de Y, ou seja, uma matriz zerada, onde somente a diagonal 
# é preenchida com o erro ao quadrado
VY = numpy.zeros((len(Y),len(Y)),float)
numpy.fill_diagonal(VY,Yerror**2)


# In[12]:

# Falta testar: Podemos usar as raizes quadradas da diagonal de VA para 
# comparar com a saida do polyfit com cov=True


# In[13]:

#Variância de A. 
VA = inv(numpy.dot(numpy.dot(X.T,inv(VY)),X)) 

#Coeficientes "medido"
A = numpy.dot(numpy.dot(numpy.dot(VA,X.T),inv(VY)),Y)


# In[14]:

#A raiz quadrada dos elementos da diagonal de VA nos da os erros de A.
numpy.sqrt(numpy.diagonal(VA))


# In[15]:

#Agora que temos os coeficientes A do polinômio, podemos calcular Fatores de Respostas "Ajustados"
#Definição do intervalo de Z que vamos ajustar (na prática todos)
Zadjusted = numpy.array(range(11,43)) 


# In[16]:

#Cria uma matriz Xadjusted da forma que cada linha seja refente ao elemento Z considerados. 
#e cada coluna seja da forma [1 z z^2 z^3 ... z^n],
#onde n é o grau do polinônio desejado.  
Xadjusted = numpy.vstack([Zadjusted**j for j in range(degree)]).T


# In[17]:

#Fatores de Respostas Ajustados: Yadjusted
Yadjusted = numpy.dot(Xadjusted,A)


# In[18]:

#Cálculo dos erros dos fatores de respostas, que é a raiz quadrada dos elementos
#da diagonal da matriz de covariância de Yadjusted (CYadjusted)

#matriz de covariância de Yadjusted (CYadjusted)
CYadjusted = numpy.dot(numpy.dot(Xadjusted,VA),Xadjusted.T)

#Erros dos fatores de respostas ajustados
YadjustedError =  numpy.sqrt(numpy.diagonal(CYadjusted))


# In[19]:

#Salvando os os fatores de resposta ajustado e erro em csv
filecsv = numpy.vstack((Zadjusted.astype(int),Yadjusted,YadjustedError)).T
numpy.savetxt("../../outputs/K2014abril.csv",filecsv,delimiter=",") #\t for tab


# In[20]:

#Calculo do fator de resposta em um espaço com mais pontos, para plotar gráfico
Zplot = numpy.linspace(11.,42.,600) 
Xplot = numpy.vstack([Zplot**j for j in range(degree)]).T
Yplot = numpy.dot(Xplot,A)


# In[24]:

#Plotando gráfico do Ajuste + dados experimentais
#plt.figure(1)

#Limpar workspace
plt.clf()

#Elemento no eixo X
plt.xlim(5,50)

#Colocando Título
plt.title('Linha K')

# Labels
plt.ylabel('Fator de Resposta')
plt.xlabel('Z')

#Limites do eixo Y (eixo do fator de resposta)
plt.ylim(min(Yadjusted)-0.05,max(Yadjusted)+0.05)

#Plot dos pontos experimentais
plt.plot(Z,Y,'bD')
#colocar barras de erros nos pontos experimentais
plt.errorbar(Z,Y,yerr=Yerror,ecolor='b',fmt=None)

#Plot da curva ajustada
plt.plot(Zplot,Yplot,'r-')

#Configurando tamanho
figure = plt.gcf() # get current figure
figure.set_size_inches(8, 6)

#Salvando
plt.savefig("../../outputs/K2014abril.png", dpi = 100)


# In[135]:

#Porcentagem do erro ajustado
(YadjustedError/Yadjusted)*100


# Y and X were measured
# 
# $[X]A=[Y]$
# 
# We will adjust a A for equation above and call it Ã, but before we have to calculate the covariance of the coeficients $V_Ã$:
# 
# $V_Ã = (X^T V_Y^{-1} X)^{-1}$
# 
# and
# 
# $Ã = V_Ã X^T V_Y^{-1} Y$
# 
# Now, we can calculate the new values of Y from $V_Ã$ to all atomic numbers in covered region $X_{adjusted}$:
# 
# $[X_{adjusted}]Ã=[Y_{adjusted}]$
# 
# The error desired is the square roots of diagonal of matrix covariance of Ycalculed $C_{Yadjusted}$.
# 
# $C_{Y_{adjusted}} = X_{adjusted} V_Ã X_{adjusted}^T$
# 
