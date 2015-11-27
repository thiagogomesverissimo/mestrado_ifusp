# Função que: prepara dados para plot distribuição de frequência
# Nos gráficos, os labels serão a sequência começando de 22.5 até 360 com passo de  
# 22.5. Porém, para distribuirmos as frequências vamos nos centrar nestes labels +/- 11.25
windFrequency<-function(inputdados,GraphTitle="Ghana",file_name) 
{
  calmaria<-sum(inputdados$Calmaria)
  inputdados<-inputdados[!is.na(inputdados$DIR),]
  inputdados<-inputdados[inputdados$DIR!=990,]
  PolarLabels<-seq(22.5,360,by=22.5) # Nos dados não há direção zero, apenas 360
  freq<-data.frame(centroide=NA,quantidade=NA) # Zerando vetor essa primeira linha de Na's será excluída 
  for (i in PolarLabels){
    freq<-rbind(freq,c(i,sum(inputdados$DIR> (i-11.25) & inputdados$DIR < (i+11.25) )))
  }
  freq<-freq[-1,] # remove a linha criada propositalmente
  porcentage_calmaria<-round(100*(calmaria/(sum(freq$quantidade) +  calmaria)),digits=2)
  freq$quantidade<-100*freq$quantidade/(sum(freq$quantidade) +  calmaria)
  
  ##Plotando gráficos
  #library(plotrix)  
  pdf(file=paste('../../outputs/',file_name,'.pdf',sep=""))
  polar.plot(lengths=freq$quantidade,
             polar.pos=freq$centroide,
             labels=freq$centroide,
             label.pos=freq$centroide,
             clockwise=TRUE,
             start=90,
             rp.type="p", 
             #main=paste('Frequência de direção do vento (%):',GraphTitle,sep=" "),
             main=paste('',GraphTitle,sep=" "),
             label.prop=1.1,
             line.col= 'red',
             lty= 20, 
             lwd= 3,
             mar=c(2,2,3,2),
             show.grid.labels=4,
             grid.col="gray",
             point.symbols = 2,
             grid.bg="transparent"
  )
  text(5,5,'% de ocorrências')
  text(10,-10,paste('Calmaria = ',porcentage_calmaria,'%',sep=""))
  #legend('topleft',legend=paste('Calmaria=',porcentage_calmaria,'%',sep=""))
  dev.off()
}
