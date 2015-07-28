\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 10_metrica
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Piano"
andamentoItemA = \tempo 8 = 210
compassoItemA = \time 7/8
clefItemA = \clef bass
keyItemA = \key c \minor

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
% \override TimeSignature #'stencil = ##f 		% Sem fórmla de compasso
% \accidentalStyle Score.neo-modern			% Acidente apenas para as notas
% \override StaffSymbol.line-count = #1			% Número de linhas na pauta
% \override Staff.StaffSymbol.line-positions = #'(-1 0 1)
% \override SpacingSpanner.uniform-stretching = ##t	% Notação proporcional
% \override SpacingSpanner.strict-note-spacing = ##t
% proportionalNotationDuration = #(ly:make-moment 1/20)
  }
}

\paper {
 ragged-right = ##f 
 line-width = 150\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

\include "../../difSpanner.ly"

musica = \relative c {
  \difSpanner
  c4 c
 \tag #'itemA { d4 d8 }
 \tag #'itemB { d8.\startTextSpan d16\stopTextSpan }
 g4 g
 \tag #'itemA { f8[ ees d] }
 \tag #'itemB { \tuplet 3/2 { f\startTextSpan ees d\stopTextSpan } }
 ees4 ees
 \tag #'itemA { d8[ aes' g] | bes2.. }
 \tag #'itemB { \tuplet 3/2 { d,8\startTextSpan aes' g } | bes2.\stopTextSpan }
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