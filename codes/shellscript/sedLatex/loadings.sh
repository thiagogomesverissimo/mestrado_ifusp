#!/bin/bash

## Lembretes:
# Solid waste burning: Br. 
# Road dust & vehicle: Al, Si, Ca, Fe, Zn, BC.  
# Crustal: Al, Si, Mg, Ti, Mn, Fe.
# biomass particles: K, Cl, S, BC
# Sea salt: Na, Cl, S
# Sal marinho, solo, emissões veiculares e combustão de biomassa 
# Loadings, h2 comunalidade e u2 a unicidade (ou singularidade)

cd $(dirname $0)

### Corrige nomes nas tabelas de loadings.

# Comuns loading
FILES=$(ls ../../../outputs | grep loading.*tex)

for FILE in $FILES; do
  i="../../../outputs/$FILE"
  sed -i s/h2/'\\textcolor{red}{h}'/g $i
  sed -i s/u2/'\\textcolor{red}{S}'/g  $i
  sed -i s/'com '/'\\textcolor{red}{C}'/g $i
  sed -i s/Variable/Espécie/g $i
  sed -i s/'SS loadings'/'autovalor'/g $i
  sed -i s/'Proportion Var'/'variância'/g $i
  sed -i s/'Cumulative Var'/'\\textcolor{red}{variância acum.}'/g $i
  sed -i s/'Cum. factor Var'/'variância acum. abs'/g $i
  sed -i s/'\\caption{}'//g $i
  sed -i s/htbp/H/g $i
  sed -i s/cr/'\\'/g $i
done

## RFsH.tex
FILE='../../../outputs/loadings_RFsH.tex'
sed -i s/RFsH/'\\textcolor{red}{$MP_{2.5}$ área residencial}'/g $FILE

## TFsH
FILE='../../../outputs/loadings_TFsH.tex'
sed -i s/TFsH/'\\textcolor{red}{$MP_{2.5}$ avenida com tráfego de autos}'/g $FILE

## RGsH
FILE='../../../outputs/loadings_RGsH.tex'
sed -i s/RGsH/'\\textcolor{red}{$MP_{2,5-10}$ área residencial}'/g $FILE
