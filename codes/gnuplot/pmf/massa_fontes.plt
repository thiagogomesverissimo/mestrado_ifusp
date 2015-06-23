set encoding utf8 

set term png enhanced size 640,480
set output "../../../outputs/fator1_massa.png"

#configurações do arquivo de entrada
set datafile separator "	"
set decimalsign "."


#estilos e fomatação do Gráfico final
set format y "%2.1f"
set title "PMF Recife: Perfil do Fator 1"
set ylabel "Concetração"
unset xlabel 
set grid ytics
set xtic rotate by -45 scale 0 font ",8"

plot "../../../inputs/pmf/run9_conc_species.txt" using 3:xticlabels(2) notitle with boxes fs solid 0.5 lc rgb "#0060ad"


