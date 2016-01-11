#
cd $(dirname $0)

cd outputs
  for i  in $(ls | grep -v README.md); do rm -r $i; done
cd ..

cd codes/R/
  make
cd ../..

cd codes/
  make
cd ../

cd latex/
  make
cd ..


