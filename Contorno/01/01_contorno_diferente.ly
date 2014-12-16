\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 01_contorno
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Piano"
andamentoItemA = \tempo 4 = 120
compassoItemA = \time 4/4
clefItemA = \clef treble
keyItemA = \key c \major

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
  e2 c4 f, |
 \tag #'itemA { a2 }
 \tag #'itemB { d2-+ }
 f,2 |
 g4. b8 e4 d |
 c1
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
 ragged-right = ##f 
 line-width = 110\mm
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

\itemB