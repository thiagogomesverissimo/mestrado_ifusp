#!/bin/bash
#
cd $(dirname $0)

# Copia saídas do PMF-EPA 5.0 
if [ -d '../../outputs/pmf' ]; then
  rm -r '../../outputs/pmf'
  cp -r '../../inputs/pmf/' '../../outputs/pmf'
else
  cp -r '../../inputs/pmf/' '../../outputs/pmf'
fi

for i in $(grep -r "Factor 1" ../../outputs/pmf/ | cut -d':' -f1); do sed -i s/"Factor 1"/"Fator1"/g $i; done
for i in $(grep -r "Factor 2" ../../outputs/pmf/ | cut -d':' -f1); do sed -i s/"Factor 2"/"Fator2"/g $i; done
for i in $(grep -r "Factor 3" ../../outputs/pmf/ | cut -d':' -f1); do sed -i s/"Factor 3"/"Fator3"/g $i; done
for i in $(grep -r "Factor 4" ../../outputs/pmf/ | cut -d':' -f1); do sed -i s/"Factor 4"/"Fator4"/g $i; done
for i in $(grep -r "Factor 5" ../../outputs/pmf/ | cut -d':' -f1); do sed -i s/"Factor 5"/"Fator5"/g $i; done
for i in $(grep -r "Factor 6" ../../outputs/pmf/ | cut -d':' -f1); do sed -i s/"Factor 6"/"Fator6"/g $i; done
