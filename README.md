# Mestrado realizado no IFUSP, finalizado em 2016

 - Versão em PDF publicada pela USP: http://www.teses.usp.br/teses/disponiveis/43/43134/tde-20072016-161023/
 - Repositório original: https://git.uspdigital.usp.br/5385361/mestrado_ifusp

# Configurando ambiente para deploy (testado em debian 8):


Adicionando locale em en_US.UTF-8:

    sudo locale-gen en_US.UTF-8
    sudo update-locale 
    dpkg-reconfigure locales

Inserir repositório rstudio para usar a última versão do R:

    # /etc/apt/sources.list
    deb http://cran.rstudio.com/bin/linux/debian jessie-cran3/
    apt-key adv --keyserver keys.gnupg.net --recv-key 381BA480
    apt-get update

Instalação de pacotes no debian:

    apt-get update
    apt-get install r-base 
    apt-get install texlive-full

Dependências para compilação de algumas bibliotecas:

    apt-get install curl git libssl1.0.0

Bibliotecas R que deverão ser instaladas antes da compilação
(talvez o install_third_libraries.R possa ajudar):

    # Primeiramente, instale via apt-get install r-cran-NOME_DA_LIB, 
    (ou apt-get install r-cran-*):
    lattice
    MASS
    ggplot2
    stringr
    rcpp
    
    # via R, install.packages('NOME_DA_LIB')
    GPArotation
    lubridate
    psych
    xtable
    ggmap
    corrplot
    plotrix
    fBasics
    polynom
    Hmisc
    dplyr
    devtools
   
Instalar pacotes do github:

    library("devtools")
    install_github('davidcarslaw/openair')

Clone o repositório e rode o deploy:

    git clone https://github.com/thiagogomesverissimo/mestrado_ifusp.git
    cd mestrado_ifusp
    ./deploy

# resumo em pt-br

Cidades dos países da África Subsariana (SSA) têm passado por um 
intenso processo de urbanização, implicando em crescimento das atividades 
econômicas em geral e industriais em particular, assim como, o aumento do 
tráfego de veículos e da produção de lixo, dentre outras mudanças que 
afetam diretamente o meio ambiente e a saúde dos habitantes. 
Neste cenário, a identificação de fontes poluidoras do ar é essencial 
para a fundamentação de políticas públicas que visam assegurar o direito 
a uma boa qualidade de vida para a população.

Esta pesquisa de Mestrado esteve integrada a um projeto 
internacional denominado Energy, air pollution, and health 
in developing countries, coordenado pelo Dr. Majid Ezzati, 
à época professor da Harvard School of Public Health, e integrando 
também pesquisadores da Universidade de Gana. 
Este projeto tinha por objetivo fazer avaliações dos níveis de 
poluição do ar em algumas cidades de países em desenvolvimento, 
voltando-se, neste caso particular para Acra (capital de Gana e 
maior cidade da SSA), e duas outras cidades de Gambia, 
onde até então inexistiam estudos mais substantivos, 
relacionando-os com as condições socioeconômicas específicas 
das diferentes áreas estudadas.

Contribuímos com as análises de Fluorescência de Raios X (XRF) e de Black Carbon(BC), com as discussões e interpretações dos dados meteorológicos e no emprego dos modelos receptores. Mas do ponto de vista do aprofundamento de estudos da qualidade do ar e do impacto de fontes, este trabalho concentrou-se na região de Nima, bairro da capital de Gana, Acra. 
A partir da caracterização do aerossol atmosférico local, empregou-se modelos 
receptores para identificar o perfil e contribuição de fontes 
majoritárias do Material Particulado Atmosférico Fino 
e Grosso. 

Foram coletadas 791 amostras (de 48 horas) entre novembro de 2006 e 
agosto de 2008 em dois locais, na principal avenida do bairro, Nima Road, e na área 
residencial, Sam Road, distantes 250 metros entre si. 

A concentração anual média em 2007 para fino encontrada na avenida 
foi de 61,6 (1,0) ug/m3 e 44,9 (1,1) ug/m3 na área residencial, 
superando a diretriz de padrão anual máximo de 10 ug/m3 recomendada pela 
Organização Mundial de Saúde (OMS). A porcentagem de ultrapassagem 
do padrão diário (OMS) de 25 ug/m3 foi de 66,5% e 92% para a 
área residencial e avenida, respectivamente, durante todo experimento. 

As concentrações químicas elementares foram obtidas por XRF e o BC por 
refletância intercalibrada por Thermal Optical Transmitance (TOT). 

Neste trabalho desenvolvemos uma metodologia de calibração do XRF 
e de intercalibração entre refletância e TOT, 
baseada em Mínimos Quadrados Matricial, o que nos forneceu 
incerteza dos dados ajustados e boa precisão nos valores 
absolutos de concentrações medidos.

Análise de Fatores (AF) e Positive Matrix Factorization (PMF) foram utilizadas
para associação entre fonte e fator, bem como para estimar o perfil destas fontes. 
A avaliação de parâmetros meteorológicos locais, como direção e intensidade 
dos ventos e posicionamento de fontes significativas de emissão de MP 
auxiliaram no processo de associação dos fatores obtidos por esses modelos e 
fontes reais. 

No período do inverno em Gana, um vento  
provindo do deserto do Saara, que está localizado ao nordeste do país, denominado Harmatão, 
passa por Acra, aumentando de um fator 10 a concentração dos poluentes 
relacionados à poeira de solo. Assim, as amostras dos dias de ocorrências 
do Harmatão foram analisadas separadamente, pois dificultavam a 
identificação de outras fontes por PMF e AF.

As fontes majoritárias indicadas por esses dois métodos (AF e PMF), 
mostraram-se concordantes: Mar (Na, Cl), solo (Fe, Ti, Mn, 
Si, Al, Ca, Mg), emissões veiculares (BC, Pb, Zn, K), queima de 
biomassa (K, P, S, BC) e queima de lixo sólido e outros materiais a céu aberto (Br, Pb) . 

A redução da poluição do ar em cidades da SSA, caso de Acra, 
requer políticas públicas relacionadas ao uso de energia, saúde, 
transporte e planejamento urbano, com devida atenção 
aos impactos nas comunidades pobres. 
Medidas como pavimentação das vias, cobertura do solo com vegetação, 
incentivo ao uso de gás de cozinha e incentivo ao transporte público, 
ajudariam a diminuir os altos índices de poluição do ar ambiental nessas cidades.
