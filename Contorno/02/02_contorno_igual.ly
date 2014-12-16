\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 02_contorno
Igual ou diferente: igual
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Clarinet"
andamentoItemA = \tempo 2. = 60
compassoItemA = \time 3/4
clefItemA = \clef treble
keyItemA = \key a \minor

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \compassoItemA
clefItemB = \clefItemA
keyItemB = \keyItemA

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c'' {
  a2 b4 |
  c4 b a |
  d c b |
  e2. |
  f2 e4 |
  d4 c b |
  e, fis gis |
  a2.
 \tag #'itemA { }
 \tag #'itemB { }
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
% ragged-right = ##f 
% line-width = 110\mm
}

%%% CONTEXTOS PARA CADA SUBITEM %%%

itemA = \score {
  \new Staff <<
    \instrumentoNomeItemA
    \andamentoItemA
    \compassoItemA
    \clefItemA
    \keyItemA
    \new Voice { 
      \keepWithTag #'itemA \musica
    }
  >>
}

itemB = \score {
  \new Staff <<
    \instrumentoNomeItemB
    \andamentoItemB
    \compassoItemB
    \clefItemB
    \keyItemB
    \new Voice { 
      \keepWithTag #'itemB \musica
    }
  >>
}



\itemA

% Desmarcar para incluir o subitem B

%\itemB