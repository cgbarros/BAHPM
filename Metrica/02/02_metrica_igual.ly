\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 02_metrica
Igual ou diferente: igual
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Bass drum"
andamentoItemA = \tempo 4 = 110
compassoItemA = \time 2/4
clefItemA = \clef percussion
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
% LAYOUT %
%%%%%%%%%%

\layout {
  \context {
    \Score
% \override TimeSignature #'stencil = ##f
% \accidentalStyle Score.neo-modern
 \override StaffSymbol.line-count = #1
%{  \override SpacingSpanner.uniform-stretching = ##t
  \override SpacingSpanner.strict-note-spacing = ##t
  proportionalNotationDuration = #(ly:make-moment 1/20)
%}
  }
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c' {
  \partial 4 c8. c16 |
  c4-> c |
  c8-> c c8. c16 |
  c4-> c
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

% \itemB