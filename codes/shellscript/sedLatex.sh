#!/bin/bash

cd $(dirname $0)

### Corrige nomes

## 
FILE='../../outputs/tabela_descritiva_com_harmatan.tex'
sed -i s/RFcH/'$MP_{2.5}$ bairro'/g $FILE
sed -i s/RIcH/'$MP_{10}$ bairro'/g  $FILE
sed -i s/TFcH/'$MP_{2.5}$ Avenida'/g $FILE
sed -i s/TIcH/'$MP_{10}$ Avenida'/g $FILE

