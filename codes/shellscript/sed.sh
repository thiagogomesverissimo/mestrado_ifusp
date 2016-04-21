#!/bin/bash

cd $(dirname $0)

#### Corrige census cook

FILE='../../outputs/census_cookfuel.tex'
#sed -i '/begin{table}/,+0 d' $FILE
#sed -i '/end{table}/,+0 d' $FILE
#sed -i '/label{default}/,+0 d' $FILE
sed -i s/cook/"Fontes de energia"/g $FILE
sed -i s/year//g $FILE

####  
#FILE='../../outputs/tabela_descritiva_com_harmatan.tex'
#sed -i s/RFcH/'Fino ($MP_{2,5}$) residencial'/g $FILE
#sed -i s/RIcH/'Inalável ($MP_{10}$) residencial'/g $FILE
#sed -i s/TFcH/'Fino ($MP_{2,5}$) avenida'/g $FILE
#sed -i s/TIcH/'Inalável ($MP_{10}$) avenida'/g $FILE
#sed -i s/\\./,/g $FILE

####  
FILES=$(ls ../../outputs | grep descriptive_)
for i in $FILES; do
 FILE='../../outputs/'$i
 sed -i s/'\.'/','/g $FILE
 sed -i s/mean/'Média ($  ng \/ m^3$)'/g $FILE
 sed -i s/'median'/'Mediana'/g $FILE
 sed -i s/'se'/'Des. Pad. Média'/g $FILE
 #sed -i s/'e-'/' E-'/g $FILE
 #sed -i s/'e+'/' E+'/g $FILE
 sed -i s/'min'/'Mínimo'/g $FILE
 sed -i s/'max'/'Máximo'/g $FILE
 sed -i s/'rrlllll'/'ccccccc'/g $FILE
 sed -i s/'mass'/'massa ($ \\mu g \/ m^3$)'/g $FILE
 sed -i s/'BC'/'BC ($ \\mu g \/ m^3$)'/g $FILE
done

####  
FILE='../../outputs/BC_monarch71.tex'
sed -i s/'\.'/','/g $FILE
sed -i s/fabricante/'Fabricante ($  \\mu g \/ cm^2$)'/g $FILE
sed -i s/ajustado/'Ajuste ($  \\mu g \/ cm^2$)'/g $FILE
sed -i s/Ref1/'Refletância 1 (\\%)'/g $FILE
sed -i s/Ref2/'Refletância 2 (\\%)'/g $FILE
sed -i s/Ref3/'Refletânia 3 (\\%)'/g $FILE
sed -i s/'rrrlr'/'ccccc'/g $FILE
