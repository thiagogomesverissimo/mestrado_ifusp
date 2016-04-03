set encoding utf8 

set term png font "arial,12" 
set output "../../../outputs/fator6_contri.png"

#configurações do arquivo de entrada
set datafile separator ","
set decimalsign "."

set format y "%2.1f"
set mytics 10

#estilos e fomatação do Gráfico final
set title "PMF Recife: Contribuições por amostra do Fator 6"
set ylabel "Concentrações"
unset xlabel
set grid
#set xdata time
#set timefmt "%d/%m/%Y" #formato de entrada no arquivo
#set format x "%d/%m/%Y"
#set xrange [ "01/06/2007":"1/08/2008" ]
#set xtics rotate by 90 offset 0,-4 out nomirror
#set xtics  ('20/06/2007','20/09/2007','20/12/2007','20/03/2008','20/06/2008')

set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 ps 0.5
plot "../../../inputs/pmf/6factors/RFsH/RFsH_contributions.csv" using 2:8 notitle with points ls 1

