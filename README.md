Mestrado realizado no IFUSP 2010-2016.

tips:

Texto envolta da tabela:

    \begin{wraptable}{l}{8cm}
        \input{../outputs/BC_monarch71.tex}
        \caption{}
    \end{wraptable}

Figuras lado-a-lado:

\begin{figure}[H]
  \centering
  \begin{subfigure}[b]{0.45\textwidth}
    \includegraphics[width=\textwidth]{../outputs/RFsH_pmf_contribution_pizza5.pdf}
    \caption{Residencial}
  \end{subfigure}%
  \begin{subfigure}[b]{0.45\textwidth}
    \includegraphics[width=\textwidth]{../outputs/TFsH_pmf_contribution_pizza5.pdf}
    \caption{Avenida}
  \end{subfigure}
  \caption{Contribuição $MP_{2,5}$ \label{a:kkk}}
\end{figure}
