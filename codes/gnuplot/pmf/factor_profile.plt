set encoding utf8 

#set terminal png font "arial,12" size 800,600
set term png enhanced size 640,480
set output "../../../outputs/fator6_elementos.png"

#configurações do arquivo de entrada
set datafile separator "	"
set decimalsign "."

#estilos e fomatação do Gráfico final
set format y "%2.1f"
set title "PMF Recife: Perfil do Fator 6"
set ylabel "(%) da espécie no Fator"
unset xlabel 
set grid ytics
set xtic rotate by -45 scale 0 font ",8"

plot "../../../inputs/pmf/run9_per_specie_total.txt" using 8:xticlabels(2) notitle with boxes fs solid 0.5 lc rgb "#0060ad"


