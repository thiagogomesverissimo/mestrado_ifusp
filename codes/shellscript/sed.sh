#!/bin/bash

cd $(dirname $0)

### Corrige census cook

FILE='../../outputs/census2010_cookfuel.tex'
#sed -i '/begin{table}/,+0 d' $FILE
#sed -i '/end{table}/,+0 d' $FILE
#sed -i '/label{default}/,+0 d' $FILE
sed -i s/cook/"Fontes de energia"/g $FILE
sed -i s/year//g $FILE

# \shortstack{aa \\ bb}
