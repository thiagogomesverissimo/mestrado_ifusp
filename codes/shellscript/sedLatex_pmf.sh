#!/bin/bash

cd $(dirname $0)

### contribution

## RFsH
FILE='../../outputs/RFsH_contribution.tex'
sed -i s/'Factor.1'/'Veículo leve'/g  $FILE
sed -i s/'Factor.2'/Biomassa/g  $FILE
sed -i s/'Factor.3'/Mar/g  $FILE
sed -i s/'Factor.4'/Solo/g  $FILE
sed -i s/'Factor.5'/'Veículo pesado'/g  $FILE

## TFsH
FILE='../../outputs/TFsH_contribution.tex'
sed -i s/'Factor.1'/'Veículo pesado'/g  $FILE
sed -i s/'Factor.2'/Biomassa/g  $FILE
sed -i s/'Factor.3'/Solo/g  $FILE
sed -i s/'Factor.4'/Mar/g  $FILE
sed -i s/'Factor.5'/'Veículo leve'/g  $FILE

## RGsH
FILE='../../outputs/RGsH_contribution.tex'
sed -i s/'Factor.1'/Mar/g $FILE
sed -i s/'Factor.2'/Solo/g $FILE
sed -i s/'Factor.3'/'americo'/g $FILE
sed -i s/'Factor.4'/'americo'/g $FILE
sed -i s/'Factor.5'/Biomassa/g $FILE

## TGsH
FILE='../../outputs/TGsH_contribution.tex'
sed -i s/'Factor.1'/Mar/g  $FILE
sed -i s/'Factor.2'/Solo/g  $FILE
sed -i s/'Factor.3'/'americo'/g  $FILE
sed -i s/'Factor.4'/'americo'/g  $FILE
sed -i s/'Factor.5'/Biomassa/g  $FILE

### profiles_percent_species

## RFsH
FILE='../../outputs/RFsH_profiles_percent_species.tex'
sed -i s/'Factor.1'/'Veículo leve'/g  $FILE
sed -i s/'Factor.2'/Biomassa/g  $FILE
sed -i s/'Factor.3'/Mar/g  $FILE
sed -i s/'Factor.4'/Solo/g  $FILE
sed -i s/'Factor.5'/'Veículo pesado'/g  $FILE
sed -i s/RFsH/'\\textcolor{red}{$MP_{2.5}$ bairro}'/g $FILE

## TFsH
FILE='../../outputs/TFsH_profiles_percent_species.tex'
sed -i s/'Factor.1'/'Veículo pesado'/g  $FILE
sed -i s/'Factor.2'/Biomassa/g  $FILE
sed -i s/'Factor.3'/Solo/g  $FILE
sed -i s/'Factor.4'/Mar/g  $FILE
sed -i s/'Factor.5'/'Veículo leve'/g  $FILE
sed -i s/TFsH/'\\textcolor{red}{$MP_{2.5}$ avenida}'/g $FILE

## RGsH
FILE='../../outputs/RGsH_profiles_percent_species.tex'
sed -i s/'Factor.1'/Mar/g $FILE
sed -i s/'Factor.2'/Solo/g $FILE
sed -i s/'Factor.3'/'americo'/g $FILE
sed -i s/'Factor.4'/'americo'/g $FILE
sed -i s/'Factor.5'/Biomassa/g $FILE

## TGsH
FILE='../../outputs/TGsH_profiles_percent_species.tex'
sed -i s/'Factor.1'/Mar/g  $FILE
sed -i s/'Factor.2'/Solo/g  $FILE
sed -i s/'Factor.3'/'americo'/g  $FILE
sed -i s/'Factor.4'/'americo'/g  $FILE
sed -i s/'Factor.5'/Biomassa/g  $FILE








