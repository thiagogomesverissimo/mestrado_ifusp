rm(list=ls())
source("myfunctions/load.R")

system('sh ../../codes/shellscript/sed_pmf.sh')

# cores
poeira = "#FF0000FF"
biomassa = "#FFFF00FF"
veiculo = "#00FF00FF"
lixo_solido = "#00FFFFFF"
mar = "#FF00FFFF"
metal = '#3300FFFF'
queimada = '#CC00FFFF'
industria = '#FF0099FF'

RFsH_cores = c(lixo_solido,biomassa,poeira,mar,veiculo)
TFsH_cores = c(mar,biomassa,poeira,lixo_solido,veiculo)
RGsH_cores = c(poeira,metal,mar,queimada,industria)
TGsH_cores = c(poeira,metal,industria,queimada,mar)

# Contributions
pmf_contributions_latex('../../outputs/pmf/5factors/','RFsH',RFsH_cores)
pmf_contributions_latex('../../outputs/pmf/5factors/','RGsH',RGsH_cores)
pmf_contributions_latex('../../outputs/pmf/5factors/','TFsH',TFsH_cores)
pmf_contributions_latex('../../outputs/pmf/5factors/','TGsH',TGsH_cores)


# Profiles
pmf_profiles_latex('../../outputs/pmf/5factors/','RFsH')
pmf_profiles_latex('../../outputs/pmf/5factors/','RGsH')
pmf_profiles_latex('../../outputs/pmf/5factors/','TFsH')
pmf_profiles_latex('../../outputs/pmf/5factors/','TGsH')

