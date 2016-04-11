#rm(list=ls())
source("myfunctions/load.R")

system('sh ../../codes/shellscript/sed_pmf.sh')

# cores
poeira = "#EECFA1"
biomassa = "#006400"
veiculo = "#CDCDC1"
lixo_solido = "#FFD700"
mar = "#87CEFF"
metal = '#9C9C9C'
vegetacao = '#FFA54F'
industria = '#FF6AA7'

RFsH_cores = c(veiculo,lixo_solido,poeira,mar,vegetacao)
TFsH_cores = c(lixo_solido,mar,poeira,veiculo,vegetacao)
RGsH_cores = c(poeira,metal,mar,vegetacao,industria)
TGsH_cores = c(poeira,metal,industria,vegetacao,mar)

# Contributions
pmf_contributions_latex('../../outputs/pmf/6factors/','RFsH',rainbow(6),nfactors=6)
pmf_contributions_latex('../../outputs/pmf/6factors/','RGsH',rainbow(6),nfactors=6)
pmf_contributions_latex('../../outputs/pmf/6factors/','TFsH',rainbow(6),nfactors=6)
pmf_contributions_latex('../../outputs/pmf/6factors/','TGsH',rainbow(6),nfactors=6)

pmf_contributions_latex('../../outputs/pmf/5factors/','RFsH',RFsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','RGsH',RGsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','TFsH',TFsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','TGsH',TGsH_cores,nfactors=5)

pmf_contributions_latex('../../outputs/pmf/4factors/','RFsH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','RGsH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','TFsH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','TGsH',rainbow(4),nfactors=4)

pmf_contributions_latex('../../outputs/pmf/6factors/','RFcH',rainbow(6),nfactors=6)
pmf_contributions_latex('../../outputs/pmf/6factors/','RGcH',rainbow(6),nfactors=6)
pmf_contributions_latex('../../outputs/pmf/6factors/','TFcH',rainbow(6),nfactors=6)
pmf_contributions_latex('../../outputs/pmf/6factors/','TGcH',rainbow(6),nfactors=6)

pmf_contributions_latex('../../outputs/pmf/5factors/','RFcH',RFsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','RGcH',RGsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','TFcH',TFsH_cores,nfactors=5)
pmf_contributions_latex('../../outputs/pmf/5factors/','TGcH',TGsH_cores,nfactors=5)

pmf_contributions_latex('../../outputs/pmf/4factors/','RFcH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','RGcH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','TFcH',rainbow(4),nfactors=4)
pmf_contributions_latex('../../outputs/pmf/4factors/','TGcH',rainbow(4),nfactors=4)

# Profiles
pmf_profiles_latex('../../outputs/pmf/6factors/','RFsH',6)
pmf_profiles_latex('../../outputs/pmf/6factors/','RGsH',6)
pmf_profiles_latex('../../outputs/pmf/6factors/','TFsH',6)
pmf_profiles_latex('../../outputs/pmf/6factors/','TGsH',6)

pmf_profiles_latex('../../outputs/pmf/5factors/','RFsH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','RGsH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','TFsH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','TGsH',5)

pmf_profiles_latex('../../outputs/pmf/4factors/','RFsH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','RGsH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','TFsH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','TGsH',4)

pmf_profiles_latex('../../outputs/pmf/6factors/','RFcH',6)
pmf_profiles_latex('../../outputs/pmf/6factors/','RGcH',6)
pmf_profiles_latex('../../outputs/pmf/6factors/','TFcH',6)
pmf_profiles_latex('../../outputs/pmf/6factors/','TGcH',6)

pmf_profiles_latex('../../outputs/pmf/5factors/','RFcH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','RGcH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','TFcH',5)
pmf_profiles_latex('../../outputs/pmf/5factors/','TGcH',5)

pmf_profiles_latex('../../outputs/pmf/4factors/','RFcH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','RGcH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','TFcH',4)
pmf_profiles_latex('../../outputs/pmf/4factors/','TGcH',4)

