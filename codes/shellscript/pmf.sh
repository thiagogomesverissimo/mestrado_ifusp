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
