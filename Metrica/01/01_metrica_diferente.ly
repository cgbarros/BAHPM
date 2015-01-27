\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 01_metrica
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Cow bell"
andamentoItemA = \tempo 4 = 120
compassoItemA = \time 3/4
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
  \override SpacingSpanner.uniform-stretching = ##t
  \override SpacingSpanner.strict-note-spacing = ##t
  proportionalNotationDuration = #(ly:make-moment 1/20)
  }
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c' {
 d4 b b
 \tag #'itemA { d b b | d b b }
 \tag #'itemB { \time 2/4 d b | d b | b b }
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
% ragged-right = ##f 
% line-width = 90\mm
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