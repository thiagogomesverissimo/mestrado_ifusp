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
FILES=$(ls ../../outputs | grep loading.*tex)

for FILE in $FILES; do
  i="../../outputs/$FILE"
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
  sed -i '/multicolumn/I,+4 d' $i
  sed -i '/begin{table}/,+0 d' $i
  sed -i '/end{table}/,+0 d' $i
  sed -i '/label{default}/,+0 d' $i
done

# Comuns loading
FILES=$(ls ../../outputs | grep briefFA.*tex)

for FILE in $FILES; do
  i="../../outputs/$FILE"
  sed -i s/V1/'Fonte poluídora'/g $i
  sed -i s/V2/'Espécie'/g  $i
done

## outputs/briefFA_RFsH4.tex
FILE='../../outputs/briefFA_RFsH5.tex'
sed -i s/F1/"Solo"/g $FILE
sed -i s/F2/"Queima de biomassa"/g $FILE
sed -i s/F3/"Mar"/g $FILE
sed -i s/F4/"e-waste/veículo"/g $FILE
