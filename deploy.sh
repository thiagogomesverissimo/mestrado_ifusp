#

cd $(dirname $0)

cd codes/R/
make

cd ../shellscript/
sh sedLatex_FactorAnalysis.sh
sh sedLatex_pmf.sh

cd ../../latex/
make

