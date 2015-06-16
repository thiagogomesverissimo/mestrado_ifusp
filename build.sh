#!/bin/bash 

# Script que monta a dissertação. 
# Thiago Gomes Verissimo

# gera pdf pela latex
cd latex
make -f Makefile
cd ..
