#
cd $(dirname $0)

cd outputs
  for i  in $(ls | grep -v README.md); do rm -r $i; done
cd ..

cd codes/R/
  make
cd ../..

cd codes/shellscript
  sh sedLatex_FactorAnalysis.sh
#  sh sedLatex_pmf.sh
cd ../..

cd latex/
  make
cd ..


