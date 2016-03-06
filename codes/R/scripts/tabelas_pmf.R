rm(list=ls())
source("myfunctions/load.R")

system('sh ../../codes/shellscript/sed_pmf.sh')

# cores
poeira = "#EECFA1"
biomassa = "#006400"
veiculo = "#CDCDC1"
lixo_solido = "#FFD700"
mar = "#87CEFF"
metal = '#9C9C9C'
queimada = '#FFA54F'
industria = '#FF6AA7'

RFsH_cores = c(lixo_solido,biomassa,poeira,mar,veiculo)
TFsH_cores = c(mar,biomassa,poeira,lixo_solido,veiculo)
RGsH_cores = c(poeira,metal,mar,queimada,industria)
TGsH_cores = c(poeira,metal,industria,queimada,mar)

# Contributions
pmf_contributions_latex('../../outputs/pmf/5factors/','RFsH',RFsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','RGsH',RGsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','TFsH',TFsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','TGsH',TGsH_cores,nfactors=5)

pmf_contributions_latex('../../outputs/pmf/4factors/','RFsH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','RGsH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','TFsH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','TGsH',rainbow(4),nfactors=4)


# Profiles
pmf_profiles_latex('../../outputs/pmf/5factors/','RFsH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','RGsH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','TFsH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','TGsH',5)

pmf_profiles_latex('../../outputs/pmf/4factors/','RFsH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','RGsH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','TFsH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','TGsH',4)

