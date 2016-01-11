#!/bin/bash

cd $(dirname $0)

## outputs/briefFA_RFsH.tex
FILE='../../../outputs/briefFA_RFsH.tex'
sed -i s/F1/Solo/g $FILE
sed -i s/F2/"Queima de biomassa"/g $FILE
sed -i s/F3/Mar/g $FILE
sed -i s/F4/"Veículo"/g $FILE

## outputs/briefFA_RGsH.tex
FILE='../../../outputs/briefFA_RGsH.tex'
sed -i s/F1/Solo/g $FILE
sed -i s/F2/"Veículo"/g $FILE
sed -i s/F3/Mar/g $FILE
sed -i s/F4/Industria/g $FILE

## outputs/briefFA_TFsH.tex
FILE='../../../outputs/briefFA_TFsH.tex'
sed -i s/F1/Solo/g $FILE
sed -i s/F2/"Queima de Biomassa"/g $FILE
sed -i s/F3/Mar/g $FILE
sed -i s/F4/"Veículo"/g $FILE
sed -i s/F5/"Queima de Lixo"/g $FILE

## outputs/briefFA_TGsH.tex
FILE='../../../outputs/briefFA_TGsH.tex'
sed -i s/F1/Solo/g $FILE
sed -i s/F2/"Veículo"/g $FILE
sed -i s/F3/Mar/g $FILE
sed -i s/F4/Industria/g $FILE
sed -i s/F5/Fertilizante/g $FILE
