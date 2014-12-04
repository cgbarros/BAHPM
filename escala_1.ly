\version "2.18.2"

\include "lilypond-book-preamble.ly"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item (número):
Igual ou diferente:
%}

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%

% Informações antes da música
% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName ="Piano"
andamentoItemA = \tempo  4 = 60
compassoItemA = \time 3/8
clefItemA = \clef treble

% Inserir música do item A

musicaItemA = \relative c' { 
  \partial 8 c8 |
  d4 c8 |
  g'8 f e |
  f4 e8 |
  d8 a b |
  c4.
}



%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

% Caso o exemplo seja igual, manter essa seção comentada
% Cada elemento possui um comentário anterior a ele para
% que seja removido somente o elemento diferenciado

% Informações antes da música
% Inserir nome do instrumento, andamento, compasso, clave

% instrumentoNomeItemB =
% andamentoItemB = 
% compassoItemB = 

% Música do Item B

% musicaItemB = \musicaItemA

\book {
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
}

%{

\book {
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
}

%}