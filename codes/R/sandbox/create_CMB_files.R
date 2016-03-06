#Estrutura do arquivo dos perfis de fontes do CMB:
#PNO SID SIZE elemento1 elemento1C ... 

#No arquivo de componentes absolutos vamos adicionar fontes do speciate EPA: 
#http://cfpub.epa.gov/si/speciate/
#http://cfpub.epa.gov/si/speciate/ehpa_speciate_browse.cfm

#Fontes selecionadas do SPECIATE:
#Navio (92200): http://cfpub.epa.gov/si/speciate/ehpa_speciate_browse_details.cfm?ptype=P&pnumber=92200
#Mar (91176): http://cfpub.epa.gov/si/speciate/ehpa_speciate_browse_details.cfm?ptype=P&pnumber=91176

#lendo fontes do speciate
speciate = read.csv("../../inputs/thirds/speciate.csv")

#lendo os componentes absolutos
componentes.absolutos = read.csv("../../outputs/componetes_absolutos_rio.csv")

#Rio
rio = read.csv("../../inputs/thirds/RioLuis.csv")

#Selecioando colunas desejadas do speciate
speciate = speciate[,c(2,3,7,8,9)]

#substitue incerteza negativas por 10% da concentração
speciate[speciate[,5]<0 , 5] = 0.1*speciate[speciate[,5]<0,4]

#Separa por tipo de fonte: Navio (92200) e Mar (91176)
mar = speciate[speciate[,1]=="91176",]
navio = speciate[speciate[,1]=="92200",]

#Para montar a linha de fonte teremos: 3 colunas para: PNO, SID e SIZE mais as colunas dos elementos e incertezas
colunas = 2*nrow(mar)+3
mar_zerado = matrix(0,1,colunas) 
mar_zerado = as.data.frame(mar_zerado)
 
mar_elementos = mar[,3]
mar_elementos 

componentes.absolutos = t(componentes.absolutos)

row.names(componentes.absolutos)

RC1 = 'ZnCuPbMn'
RC2 = 'MassBCBrK' 
RC3 = 'ClCa'
RC4 = 'TiAlSiFe'
RC5 = 'NiVCrS'