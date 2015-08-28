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

## RFsH
FILE='../../outputs/loadings_RFsH.tex'
sed -i s/PC1/Solo/g $FILE
sed -i s/PC2/Mar/g $FILE
sed -i s/PC3/Veículo/g $FILE
sed -i s/PC4/Biomassa/g $FILE
sed -i s/PC5/Zn/g $FILE
sed -i s/RFsH/'\\textcolor{red}{$MP_{2.5}$ bairro}'/g $FILE


## TFsH
FILE='../../outputs/loadings_TFsH.tex'
sed -i s/PC1/Solo/g  $FILE
sed -i s/PC2/Mar/g  $FILE
sed -i s/PC3/Biomassa/g  $FILE
sed -i s/PC4/Veículo/g  $FILE
sed -i s/PC5/'Lixo Sólido'/g $FILE
sed -i s/TFsH/'\\textcolor{red}{$MP_{2.5}$ avenida}'/g $FILE

## RGsH
sed -i s/PC1/Solo/g  ../../outputs/loadings_RGsH.tex
sed -i s/PC2/Biomassa/g  ../../outputs/loadings_RGsH.tex
sed -i s/PC3/'Anti-mar'/g  ../../outputs/loadings_RGsH.tex
sed -i s/PC4/'Lixo Sólido'/g  ../../outputs/loadings_RGsH.tex

## TGsH
sed -i s/PC1/Solo/g  ../../outputs/loadings_TGsH.tex
sed -i s/PC2/Biomassa/g  ../../outputs/loadings_TGsH.tex
sed -i s/PC3/'Anti-mar'/g  ../../outputs/loadings_TGsH.tex
sed -i s/PC4/'Lixo Sólido'/g  ../../outputs/loadings_TGsH.tex

## TIcH
sed -i s/PC1/Solo/g  ../../outputs/loadings_TIcH.tex
sed -i s/PC2/Biomassa/g  ../../outputs/loadings_TIcH.tex
sed -i s/PC3/'Anti-mar'/g  ../../outputs/loadings_TIcH.tex
sed -i s/PC4/'Lixo Sólido'/g  ../../outputs/loadings_TIcH.tex

# Comuns
for i in loadings_RFsH.tex loadings_TFsH.tex loadings_RGsH.tex loadings_TGsH.tex loadings_TIcH.tex; do
  sed -i s/h2/a/g  ../../outputs/$i
  sed -i s/u2/b/g  ../../outputs/$i
  sed -i s/'com '/c/g  ../../outputs/$i
  sed -i s/Variable/Espécie/g  ../../outputs/$i
  sed -i s/'SS loadings'/'autovalor'/g  ../../outputs/$i
  sed -i s/'Proportion Var'/'variância'/g  ../../outputs/$i
  sed -i s/'Cumulative Var'/'\\textcolor{red}{variância acum.}'/g  ../../outputs/$i
  sed -i s/'Cum. factor Var'/'variância fat.'/g  ../../outputs/$i
  sed -i s/'\\caption{}'//g  ../../outputs/$i
done








