\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 04_metrica
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Piano"
andamentoItemA = \tempo 4 = 90
compassoItemA = \time 4/4
clefItemA = \clef treble
keyItemA = \key c \major

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \time 3/4
clefItemB = \clefItemA
keyItemB = \keyItemA 

%%%%%%%%%%
% LAYOUT %
%%%%%%%%%%

\include "lilypond-book-preamble.ly"

\layout {
  \context {
    \Score
% \override TimeSignature #'stencil = ##f
% \accidentalStyle Score.neo-modern
% \override StaffSymbol.line-count = #1
% \override SpacingSpanner.uniform-stretching = ##t
% \override SpacingSpanner.strict-note-spacing = ##t
  proportionalNotationDuration = #(ly:make-moment 1/14)
  }
}

\paper {
% ragged-right = ##f 
% line-width = 250\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

\include "../../difSpanner.ly"

musica = \relative c'' {
  \difSpanner
  g4 bes b8. cis16
 \tag #'itemA { b8 d f,4. aes8 }
 \tag #'itemB { b4\startTextSpan d f,8. aes16\stopTextSpan }
 g4 cis b d f,8. g16 b4
 \bar "|."
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