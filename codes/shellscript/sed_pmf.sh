#!/bin/bash
#
cd $(dirname $0)

# Copia saídas do PMF-EPA 5.0 
if [ -d '../../outputs/pmf' ]; then
  rm -r '../../outputs/pmf'
  cp -r '../../inputs/pmf/' '../../outputs/pmf'
else
  cp -r '../../inputs/pmf/' '../../outputs/pmf'
fi

# RGsH input contribution
FILE='../../outputs/pmf/5factors/RGsH/RGsH_contributions.csv'
#sed -i s/'Factor 1'/'Factor.1 (Poeira)'/g  $FILE
#sed -i s/'Factor 2'/'Factor.2 (Metais)'/g  $FILE
#sed -i s/'Factor 3'/'Factor.3 (Mar)'/g  $FILE
#sed -i s/'Factor 4'/'Factor.4 (Queimada)'/g  $FILE
#sed -i s/'Factor 5'/'Factor.5 (Industria)'/g  $FILE

# RFsH contribution csv
FILE='../../outputs/pmf/5factors/RFsH/RFsH_contributions.csv'
#sed -i s/'Factor 1'/'Factor.1 (Queima de lixo sólido)'/g  $FILE
#sed -i s/'Factor 2'/'Factor.2 (Queima de biomassa)'/g  $FILE
#sed -i s/'Factor 3'/'Factor.3 (Poeira de solo)'/g  $FILE
#sed -i s/'Factor 4'/'Factor.4 (Mar)'/g  $FILE
#sed -i s/'Factor 5'/'Factor.5 (Veículo)'/g  $FILE

# TGsH input contribution
FILE='../../outputs/pmf/5factors/TGsH/TGsH_contributions.csv'
#sed -i s/'Factor 1'/'Factor.1 (Poeira)'/g  $FILE
#sed -i s/'Factor 2'/'Factor.2 (Metais)'/g  $FILE
#sed -i s/'Factor 3'/'Factor.3 (Industria)'/g  $FILE
#sed -i s/'Factor 4'/'Factor.4 (Queimada)'/g  $FILE
#sed -i s/'Factor 5'/'Factor.5 (Mar)'/g  $FILE

# TFsH contribution csv
FILE='../../outputs/pmf/5factors/TFsH/TFsH_contributions.csv'
#sed -i s/'Factor 1'/'Factor.1 (Mar)'/g  $FILE
#sed -i s/'Factor 2'/'Factor.2 (Queima de biomassa)'/g  $FILE
#sed -i s/'Factor 3'/'Factor.3 (Poeira de solo)'/g  $FILE
#sed -i s/'Factor 4'/'Factor.4 (Queima de lixo sólido)'/g  $FILE
#sed -i s/'Factor 5'/'Factor.5 (Veículo)'/g  $FILE


#####################

### RFsH
##FILE='../../outputs/RFsH_contribution.tex'
##sed -i s/'Factor.1'/'Veículo leve'/g  $FILE
##sed -i s/'Factor.2'/Biomassa/g  $FILE
##sed -i s/'Factor.3'/Mar/g  $FILE
##sed -i s/'Factor.4'/Solo/g  $FILE
##sed -i s/'Factor.5'/'Veículo pesado'/g  $FILE
#
### TFsH
##FILE='../../outputs/TFsH_contribution.tex'
##sed -i s/'Factor.1'/'Veículo pesado'/g  $FILE
##sed -i s/'Factor.2'/Biomassa/g  $FILE
##sed -i s/'Factor.3'/Solo/g  $FILE
##sed -i s/'Factor.4'/Mar/g  $FILE
##sed -i s/'Factor.5'/'Veículo leve'/g  $FILE
#
### RGsH
#FILE='../../outputs/RGsH_contribution.tex'
#sed -i s/'Factor.1'/Mar/g $FILE
#sed -i s/'Factor.2'/Solo/g $FILE
#sed -i s/'Factor.3'/'americo'/g $FILE
#sed -i s/'Factor.4'/'americo'/g $FILE
#sed -i s/'Factor.5'/Biomassa/g $FILE
#
### TGsH
#FILE='../../outputs/TGsH_contribution.tex'
#sed -i s/'Factor.1'/Mar/g  $FILE
#sed -i s/'Factor.2'/Solo/g  $FILE
#sed -i s/'Factor.3'/'americo'/g  $FILE
#sed -i s/'Factor.4'/'americo'/g  $FILE
#sed -i s/'Factor.5'/Biomassa/g  $FILE
#
#### profiles_percent_species
#
### RFsH
#FILE='../../outputs/RFsH_profiles_percent_species.tex'
#sed -i s/'Factor.1'/'Veículo leve'/g  $FILE
#sed -i s/'Factor.2'/Biomassa/g  $FILE
#sed -i s/'Factor.3'/Mar/g  $FILE
#sed -i s/'Factor.4'/Solo/g  $FILE
#sed -i s/'Factor.5'/'Veículo pesado'/g  $FILE
#sed -i s/RFsH/'\\textcolor{red}{$MP_{2.5}$ bairro}'/g $FILE
#
### TFsH
#FILE='../../outputs/TFsH_profiles_percent_species.tex'
#sed -i s/'Factor.1'/'Veículo pesado'/g  $FILE
#sed -i s/'Factor.2'/Biomassa/g  $FILE
#sed -i s/'Factor.3'/Solo/g  $FILE
#sed -i s/'Factor.4'/Mar/g  $FILE
#sed -i s/'Factor.5'/'Veículo leve'/g  $FILE
#sed -i s/TFsH/'\\textcolor{red}{$MP_{2.5}$ avenida}'/g $FILE
#
### RGsH
#FILE='../../outputs/RGsH_profiles_percent_species.tex'
#sed -i s/'Factor.1'/Mar/g $FILE
#sed -i s/'Factor.2'/Solo/g $FILE
#sed -i s/'Factor.3'/'americo'/g $FILE
#sed -i s/'Factor.4'/'americo'/g $FILE
#sed -i s/'Factor.5'/Biomassa/g $FILE
#
### TGsH
#FILE='../../outputs/TGsH_profiles_percent_species.tex'
#sed -i s/'Factor.1'/Mar/g  $FILE
#sed -i s/'Factor.2'/Solo/g  $FILE
#sed -i s/'Factor.3'/'americo'/g  $FILE
#sed -i s/'Factor.4'/'americo'/g  $FILE
#sed -i s/'Factor.5'/Biomassa/g  $FILE
