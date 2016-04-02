#!/bin/bash

cd $(dirname $0)

#### Corrige census cook

FILE='../../outputs/census_cookfuel.tex'
#sed -i '/begin{table}/,+0 d' $FILE
#sed -i '/end{table}/,+0 d' $FILE
#sed -i '/label{default}/,+0 d' $FILE
sed -i s/cook/"Fontes de energia"/g $FILE
sed -i s/year//g $FILE

# \shortstack{aa \\ bb}

####  
FILE='../../outputs/tabela_descritiva_com_harmatan.tex'
sed -i s/RFcH/'Fino ($MP_{2,5}$) residencial'/g $FILE
sed -i s/RIcH/'Inalável ($MP_{10}$) residencial'/g $FILE
sed -i s/TFcH/'Fino ($MP_{2,5}$) avenida'/g $FILE
sed -i s/TIcH/'Inalável ($MP_{10}$) avenida'/g $FILE
sed -i s/\\./,/g $FILE

#### Comparações de Padrões 
FILE='../../outputs/standard_brazil_ghana_OMS_pm10.tex'
sed -i s/lrrr/cccc/g $FILE
sed -i s/Gana_residencial_rural/'Gana (residencial e rural)'/g $FILE
sed -i s/OMS/'Organização Mundial de Saúde'/g $FILE
#sed -i s/Tipo/'Padrões nacionais para \$MP_{10}\$'/g $FILE
#sed -i s/diaria/'Média diária (24h) \$ug\/m^3\$'/g $FILE
#sed -i s/anual/'Média anual \$ug\/m^3\$'/g $FILE

####  calibração EDX 
FILE='../../outputs/edxCalibrationnov2010K.tex'

####  
FILES=$(ls ../../outputs | grep descriptive_)
for i in $FILES; do
 FILE='../../outputs/'$i
 sed -i s/mean/'Média'/g $FILE
 sed -i s/'se'/'Des. Pad. Média'/g $FILE
 sed -i s/'median'/'Mediana'/g $FILE
 sed -i s/'\.'/','/g $FILE
 sed -i s/'e-'/' E-'/g $FILE
 sed -i s/'e+'/' E+'/g $FILE
 sed -i s/'e+'/' E+'/g $FILE
 sed -i s/'min'/'Mínimo'/g $FILE
 sed -i s/'max'/'Máximo'/g $FILE
 sed -i s/'rrlllll'/'ccccccc'/g $FILE
done

#antigalinha='Z \& Rmedido \& Umedido \& Rajustado \& Uajustado \& razaoMedido \& razaoAjustado'
#novalinha='Z & R experimental & Incerteza & R Ajustado & Incerteza & desvio percentual & desvio percentual \\ Z & $ cm^2 \/ s \mu A \mu g $ & $ cm^2 \/ s \mu A \mu g$ & $ cm^2 \/ s \mu A \mu g$ & $ cm^2 \/ s \mu A \mu g$ & medido \\% & ajustado \\% \\'
#sed -i s/"^$antigalinha"/"$novalinha"/g $FILE
