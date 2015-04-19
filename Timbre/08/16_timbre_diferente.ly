\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 16_timbre
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Oboe"
andamentoItemA = \tempo 4 = 57
compassoItemA = \time 15/8
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
% LAYOUT %
%%%%%%%%%%

\include "lilypond-book-preamble.ly"

\layout {
  \context {
    \Score
 \override TimeSignature #'stencil = ##f 		% Sem fórmla de compasso
 \accidentalStyle Score.neo-modern			% Acidente apenas para as notas
% \override StaffSymbol.line-count = #1			% Número de linhas na pauta
% \override Staff.StaffSymbol.line-positions = #'(-1 0 1)
% \override SpacingSpanner.uniform-stretching = ##t	% Notação proporcional
% \override SpacingSpanner.strict-note-spacing = ##t
% proportionalNotationDuration = #(ly:make-moment 1/20)
  }
}

\paper {
% ragged-right = ##f 
 line-width = 140\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c'' {
  s8 \grace { b32 b } b8. \slashedGrace b8 b16 ~
  b16 d b8 \grace { b32 b b b } g'4 
  f8 \slashedGrace f8 c8 
  << 
    { 
      \grace { d32 d d d } \stemUp d4
      d8 d 
      \grace { d32[ d d d] } d4
    } \\ 
    { 
      c4 \slashedGrace c8 
      \tuplet 3/2 { c4 c8 }
      \grace { c32 c c c c } c4
    } 
  >>
 \tag #'itemA { }
 \tag #'itemB { }
 \bar "|."
}


%%% CONTEXTOS PARA CADA SUBITEM %%%

itemA = \score {
  \new Staff <<
    \instrumentoNomeItemA
    \andamentoItemA
    \compassoItemA
   % \clefItemA
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
\markup { \fill-line { \null "(2nd time with added filters)" } }

% Desmarcar para incluir o subitem B

% \itemB