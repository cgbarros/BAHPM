\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 07_metrica
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Violin"
andamentoItemA = \tempo 4 = 180
compassoItemA = \time 3/4
clefItemA = \clef treble
keyItemA = \key c \major

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \time 2/4
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
 \override SpacingSpanner.uniform-stretching = ##t	% Notação proporcional
 \override SpacingSpanner.strict-note-spacing = ##t
 proportionalNotationDuration = #(ly:make-moment 1/8)
  }
}

\paper {
% ragged-right = ##f 
% line-width = 110\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c'' {
 \tag #'itemA { 
   c4-> g c |
   d-> g, d' |
   e-> d c |
   f2.->
 }
 \tag #'itemB { 
   c4-> g |
   c-> d |
   g,-> d' |
   e-> d |
   c-> f |
   f2
 }
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