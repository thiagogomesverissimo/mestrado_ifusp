Como extrair o arquivo .csv do EDX, com as informações e intensidades do espectro de RX obtido.
1) Fechar todos as opções de programação do EDX, ficando somente com o menu principal na tela
2) Abrir a opção EXTRAS
3) Em EXTRAS, acionar a opção “file maintenance”
4) Selecione no lado esquerdo da janela aberta os arquivos que deseja extrair
5) No lado direito da janela, escolher o disco e diretório onde deseja escrever os arquivos .csv
6) Antes de mandar converter, selecione “options” e marque todas as opções disponíveis (para que o arquivo contenha as informações de irradiação e o profile com as intensidades dos picos de RX).
7) Selecione o botão de conversão e os arquivos .csv serão gerados.

Como usar o PROGRAMA CONVERTE_XRF_SPE

Este programa lê o espectro gerado pelo xrf-shimadzu da medicina convertendo-o para .SPE, para ser lido pelo programa de ajuste axil (ou Qxas). Ele grava no cabeçalho do arquivo .SPE, todas as informações da aquisição do espectro, necessárias para fazer a análise quantitativa (tempo vivo, corrente, filtro, energia de excitação etc). Pode converter espectros escritos um a um ou em uma lista dada por um arquivo texto.
Converter espectros um a um
Para converter espectros um a um, basta executar o programa converte_xrf_spe.exe respondendo Nao(n), e dando enter, quando o programa perguntar “Você tem um arquivo com o nome dos espectros?”. Em seguida ele lhe perguntará o nome do arquivo que deverá ser escrito (ou copiado de outro lugar onde esteja escrito), apertando a tecla enter em seguida. Com muitos arquivos para converter esse modo é lento e inadequado, sendo preferível criar um arquivo com os nomes, como indicado abaixo.
Converter múltiplos espectros
Para cria o arquivo, pode-se simplesmente escrever o nome dos arquivos em uma única coluna, ou, o que é mais fácil e seguro, gerar um arquivo usando o DOS, no Windows, da seguinte forma:
1. Copie os arquivos .csv que deseja converter em um diretório provisório, juntamente com o programa converte_xrf_spe.exe
2. abrir o Program Prompt, do windows, nos Accessories.
3. ir para o diretório onde estão os arquivos:
cd <diretorio>
4. dar o comando dir, com opção /b, direcionado para um arquivo, tendo cuidado para o limite deste programa, que são até 500 arquivo.(lembre-se que os arquivos da fluorescência têm terminação .csv):
dir *.csv/b > arquivo
5. O arquivo será gerado neste diretório, contendo uma coluna com todos os nomes de espectros com extensão .csv que estiverem no diretório.
6. Para converter os espectros, basta rodar o programa converte_xrf_spe.exe e responder Sim(s), e dando enter, quando o programa perguntar “Você tem um arquivo com o nome dos espectros?”.Automaticamente os arquivos .spe serão gerados no diretório criado no item 1.
7. Organize seus arquivos de acordo com sua estrutura de trabalho, colocando os espectros .spe no diretório onde irá analisá-los com o QXAS.
