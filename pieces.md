## Trechos que podem ser úteis


%O filtro não é fino! Você analisa o que está depositado sobre ele, que é a poluição do ar! Essa é a matriz. Por isso você coloca a face amostrada do filtro voltada para o feixe e para o detector. Se colocar o filtro voltado para baixo, vai haver absorção de fotons pelo PTFE. Mas ele em si é uma matriz composta por C e F, que absorvem pouco e geram fótons de energia baixa, entrando pouco no detector, pois são barrados pela janela de Be. É a massa de aerossol depositada que representa alvo espesso ou fino. Alvos muito grossos (muita massa) provavelmente pediriam uma correção pequena de matriz, para os elementos leves - baixo Z - cuja energia é menor e são mais absorvidos pela matriz do aerossol amostrado. A tese que coloquei acima, sobre ED-XRF polarizada discute esse problema. 
%Neste caso, não há o que discutir sobre PTFE. Por isso podemos usar filtros de calibração depositados sobre policarbonato ou mylar. Não se deve usar filtro de quartzo no EDX porque tem Si e aí explode as contagens dele, que tem energia dentro da faixa de elementos que medimos - o próprio Si. 



As análises de \textbf{PMF} são ponderadas pelas incertezas, assim 
tentou-se incluir todas fontes possíveis de erro, além do erro instrínseco 
do método analítico.

Um erro percentual fixo de 8\% atribuído ao método 
de amostragem foi incluído 
(erro médio observado em amostragens em paralelo com o amostrador Harvard)
\citep{santos2014}.

Pegue no endereço do site os textos e artigos sobre XRF e BC.
Para o XRF há revisões nos textos gerais, como na tese sobre o Epsilon5.

Lixo doméstico compreende uma mistura de orgânico 
(por exemplo, alimentares e de jardim detritos)
e resíduos não-orgânicos (por exemplo, invólucros plastificados e
outros materiais poliméricos).

Em geral, as irrigações nessas plantações
são feitas por água não tratada, provinda de córregos locais. 
Altos índices de metais pesados (Fe, Mn, Cu, Zn, Pb, Ni, Cr, Cd, Co)
são encontrados nos alimentos produzidos nessas fazendas, pois resíduos
residências são despejados diretamente nesses córregos \citep{lente2014}.

A principal fonte de poluição de automóvel vem de uma estrada pavimentada que 
dá acesso ao centro e o outro ponto um conjunto residencial improvisado.

inspeção visual indica que queimadas a céu aberto ocorrem frequentemente, 
pois moradores queimam galhos, folhas, detritos domésticos e também de plástico 
a partir de fios de cobre. 

com coletadas 879 amostras de  

Concentrações dos poluentes variam ao longo do dia na atmosfera
e quanto menor o tempo de amostragem, se obtém melhor resolução 
para identificação das fontes. Porém, amostras com concentrações menores 
são mais difíceis de se medir devido ao limite de detecção dos equipamentos
\citep{calzolai2015}. Doze ou menos horas de amostragem permitiria melhor captar 
a variabilidade das fontes de Acra (por ser uma região muito poluída).
Mas o tempo de amostragem de 48 horas e foi empregado antes da 
entrada da USP no projeto.

silicon or calcium concentrations are adequate to
capture all the dust events observed in the region.

Na/Cl with chloride depletion indicating
several sources beyond sea salt




O PIXE (Particle Induced X-Ray Emission) é outro método comumente usado 
em análises ambientais e usa feixe de íons (prótons ou alfas) para excitação dos 
átomos das amostras.

\begin{figure}[H]
\begin{center} 
  \includegraphics[width=0.5\textwidth]{../inputs/images/arranjopixe.png}
  \caption{Arranjo experimental básico para análise de método PIXE 
           \citep{tabacniks2000} \label{fig:arranjopixe}}
\end{center}
\end{figure}

Dado o arranjo experimental da figura \ref{fig:arranjopixe} e
considerando a amostra fina (alguns $\mu m$),
\citep{tabacniks2000} chega na equação \ref{eq:npixe} para 
quantidade de raios X $N$ contadas no detector. 

\begin{equation}
  \label{eq:npixe}
  N(Z) = \frac{\Omega}{4\pi} \sigma \zeta T t_z \frac{Q}{qe}
\end{equation}

Sendo $Z$ a espécie química, o número de raios X detectados 
$N(Z)$ é proporcional à densidade (massa ou átomos por área) $t_Z$ 
e a carga coletada $Q$.
$\zeta$ é a eficiência do detector, $\sigma_x$ é a secção de choque, 
$\Omega$ é o ângulo sólido, $T$ é a transmitância para raios-X em 
caso de uso de absorvedores (colocados entre a amostra e o detector), 
$q$ é o estado de carga da partícula incidente e 
$e$ é a carga do elétron \citep{tabacniks1983}.

Para resolver a equação \ref{eq:npixe}, parâmetros do arranjo experimental
($\Omega$, $\sigma$, $\zeta$ e $T$) deveriam ser conhecidos. 

Na prática, é mais comum é irradiar alvos de calibração com $t_z$ conhecidos,
e encontrar uma variável única proporcional aos parâmetros do arranjo experimental.
Da-se o nome de fator de resposta $R(Z)$ a essa variável.


Assim, adaptando a nomenclatura da equação \ref{eq:npixe} para o contexto 
da \textbf{ED-XRF} e incluindo o fator de resposta $R(Z)$ chegamos na equação 
\ref{eq:contagem}.

%PIXE -retirar até aqui



%TODO: incluir discussão sobre incerteza do Otaviano

%Temos duas fontes possíveis de erro.

%1) Erro estatístico. Quando se tem N brancos, a concentração do elemento considerado será a média sobre os N dados. O erro será o desvio padrão (p não é o desvio padrão da média), porque é a chance de termos esse erro em cada filtro analisado e não sobre a média. Para considerar o sentido do desvio padrão (68,3\% de chance de pertencer ao amostral) ainda precisa haver um fator de correção quando N for pequeno. Seria bom corrigir para N<=10. Dai em diante pode usar fator 1, porque a correção seria pequena.

%$\sigma_{pc} = fatorr x \sigma_p$

%\begin{table}[]
%\centering
%\caption{My caption}
%\label{my-label}
%\begin{tabular}{lllllllllll}
%N     & 2    & 3    & 4    & 5    & 6    & 7    & 8    & 9    & 10   & 20   \\
%Fator & 1,84 & 1,32 & 1,20 & 1,14 & 1,12 & 1,11 & 1,09 & 1,08 & 1,06 & 1,03
%\end{tabular}
%\end{table}

%2) Erro da integração do espectro. Esse erro é calculado pelo erro na integração de cada espectro de branco e, obviamente, tem que ser calculado sem branco, só com o fator de resposta (ou seja, a rotina que calcula a concentração - em µg/cm - tem que ser igual para o alvo comum e para o branco; mas o alvo comum tem que ter uma complementação no cálculo para subtrair o branco e adicionar o erro, devido ao branco). Havendo N alvos brancos, com erro  i de integração para cada um deles, o erro transferido para a média deve ser:

%\sigma_e = \sqrt{\frac{\Sigma \sigma_i}{N} }

%3) Erro total no branco. O erro final em cada elemento do branco é obtido considerando que 1 e 2 (acima) são independentes, logo:

%$\sigma_{r} = \sqrt{\sigma_e^2 + \sigma_pc^2} $

