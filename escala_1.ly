\version "2.18.2"

%%%%%%%%%%
% ITEM A %
%%%%%%%%%%

% Inserir nome do instrumento

instrumentoNomeItemA = \set Staff.instrumentName ="Piano"

% inserir andamento

andamentoItemA = \tempo  4 = 60

% inserir fórmula de compasso

compassoItemA = \time 3/8

% Inserir item A (renomear variável para o nome do exemplo)

musicaItemA = \relative c' { \partial 8 c8 }



%%%%%%%%%%
% ITEM B %
%%%%%%%%%%

% Inserir nome do instrumento

instrumentoNomeItemB = \instrumentoNomeItemA

% inserir andamento

andamentoItemB = \andamentoItemA

% inserir fórmula de compasso

compassoItemB = \compassoItemA

% Inserir item B

musicaItemB = \musicaItemA

% Configurações para silêncio entre exemplos

%{
silencio = \relative c' {  
    \stopStaff
    \once \override Staff.TimeSignature.stencil = ##f
    \time 4/4
    \once \override Rest.stencil = #ly:text-interface::print
    \once \override Rest.text = #(markup "(2s)" )
    f1\rest
    \startStaff
}
%}

\score {
\new Staff <<
  \instrumentoNomeItemA
  \andamentoItemA
  \compassoItemA
  \new Voice { 
    \musicaItemA
  }
>>
}

\score {
\new Staff <<
  \instrumentoNomeItemB
  \andamentoItemB
  \compassoItemB
  \new Voice { 
    \musicaItemB
  }
>>
}