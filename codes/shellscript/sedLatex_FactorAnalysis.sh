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
sed -i s/PC1/Solo/g  ../../outputs/loadings_RFsH.tex
sed -i s/PC2/Mar/g  ../../outputs/loadings_RFsH.tex
sed -i s/PC3/Veículo/g  ../../outputs/loadings_RFsH.tex
sed -i s/PC4/Biomassa/g  ../../outputs/loadings_RFsH.tex
sed -i s/PC5/Zn/g  ../../outputs/loadings_RFsH.tex

## TFsH
sed -i s/PC1/Solo/g  ../../outputs/loadings_TFsH.tex
sed -i s/PC2/Mar/g  ../../outputs/loadings_TFsH.tex
sed -i s/PC3/Biomassa/g  ../../outputs/loadings_TFsH.tex
sed -i s/PC4/Veículo/g  ../../outputs/loadings_TFsH.tex
sed -i s/PC5/'Lixo Sólido'/g  ../../outputs/loadings_TFsH.tex

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
#  sed -i s/'Cumulative Var'/'$ \\sigma^2$ Acum.'/g  ../../outputs/$i
#  sed -i s/'Proportion Var'/'$ \\sigma^2$ Prop.'/g  ../../outputs/$i
#  sed -i s/'SS loadings'/'SS Loadings'/g  ../../outputs/$i
#  sed -i s/'Cum. factor Var'/'$ \\sigma^2$ Fac. Acumu. '/g  ../../outputs/$i
  sed -i s/'\\caption{}'//g  ../../outputs/$i
done








