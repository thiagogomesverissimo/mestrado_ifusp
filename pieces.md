## Trechos que podem ser úteis

Lixo doméstico compreende uma mistura de orgânico 
(por exemplo, alimentares e de jardim detritos)
e resíduos não-orgânicos (por exemplo, invólucros plastificados e
outros materiais poliméricos).

Em geral, as irrigações nessas plantações
são feitas por água não tratada, provinda de córregos locais. 
Altos índices de metais pesados (Fe, Mn, Cu, Zn, Pb, Ni, Cr, Cd, Co)
são encontrados nos alimentos produzidos nessas fazendas, pois resíduos
residências são despejados diretamente nesses córregos \citep{lente2014}.

A principal fonte de poluição de automóvel vem de uma estrada pavimentada que 
dá acesso ao centro e o outro ponto um conjunto residencial improvisado.

inspeção visual indica que queimadas a céu aberto ocorrem frequentemente, 
pois moradores queimam galhos, folhas, detritos domésticos e também de plástico 
a partir de fios de cobre. 

com coletadas 879 amostras de  

Concentrações dos poluentes variam ao longo do dia na atmosfera
e quanto menor o tempo de amostragem, se obtém melhor resolução 
para identificação das fontes. Porém, amostras com concentrações menores 
são mais difíceis de se medir devido ao limite de detecção dos equipamentos
\citep{calzolai2015}. Doze ou menos horas de amostragem permitiria melhor captar 
a variabilidade das fontes de Acra (por ser uma região muito poluída).
Mas o tempo de amostragem de 48 horas e foi empregado antes da 
entrada da USP no projeto.

silicon or calcium concentrations are adequate to
capture all the dust events observed in the region.

Na/Cl with chloride depletion indicating
several sources beyond sea salt




O PIXE (Particle Induced X-Ray Emission) é outro método comumente usado 
em análises ambientais e usa feixe de íons (prótons ou alfas) para excitação dos 
átomos das amostras.

\begin{figure}[H]
\begin{center} 
  \includegraphics[width=0.5\textwidth]{../inputs/images/arranjopixe.png}
  \caption{Arranjo experimental básico para análise de método PIXE 
           \citep{tabacniks2000} \label{fig:arranjopixe}}
\end{center}
\end{figure}

Dado o arranjo experimental da figura \ref{fig:arranjopixe} e
considerando a amostra fina (alguns $\mu m$),
\citep{tabacniks2000} chega na equação \ref{eq:npixe} para 
quantidade de raios X $N$ contadas no detector. 

\begin{equation}
  \label{eq:npixe}
  N(Z) = \frac{\Omega}{4\pi} \sigma \zeta T t_z \frac{Q}{qe}
\end{equation}

Sendo $Z$ a espécie química, o número de raios X detectados 
$N(Z)$ é proporcional à densidade (massa ou átomos por área) $t_Z$ 
e a carga coletada $Q$.
$\zeta$ é a eficiência do detector, $\sigma_x$ é a secção de choque, 
$\Omega$ é o ângulo sólido, $T$ é a transmitância para raios-X em 
caso de uso de absorvedores (colocados entre a amostra e o detector), 
$q$ é o estado de carga da partícula incidente e 
$e$ é a carga do elétron \citep{tabacniks1983}.

Para resolver a equação \ref{eq:npixe}, parâmetros do arranjo experimental
($\Omega$, $\sigma$, $\zeta$ e $T$) deveriam ser conhecidos. 

Na prática, é mais comum é irradiar alvos de calibração com $t_z$ conhecidos,
e encontrar uma variável única proporcional aos parâmetros do arranjo experimental.
Da-se o nome de fator de resposta $R(Z)$ a essa variável.


Assim, adaptando a nomenclatura da equação \ref{eq:npixe} para o contexto 
da \textbf{ED-XRF} e incluindo o fator de resposta $R(Z)$ chegamos na equação 
\ref{eq:contagem}.

%PIXE -retirar até aqui

