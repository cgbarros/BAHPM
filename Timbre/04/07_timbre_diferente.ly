\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 07_timbre
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

%instrumentoNomeItemA = \set Staff.instrumentName = "Piano"
andamentoItemA = \tempo 4 = 72
compassoItemA = \time 19/8
clefItemARH = \clef percussion
clefItemALH = \clef percussion
keyItemA = \key c \major

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

%instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \compassoItemA
clefItemB = \clef percussion
keyItemB = \keyItemA 

%%%%%%%%%%
% LAYOUT %
%%%%%%%%%%

\include "lilypond-book-preamble.ly"

\layout {
  \context {
    \Score
      % Sem fórmla de compasso
     \override TimeSignature #'stencil = ##f
    
      % Acidente apenas para as notas
    % \accidentalStyle Score.neo-modern
    
      % Número de linhas na pauta
     \override StaffSymbol.line-count = #1
     \override Staff.StaffSymbol.line-positions = #'(-1 0 1)
    
      % Notação proporcional
    % \override SpacingSpanner.uniform-stretching = ##t	
    % \override SpacingSpanner.strict-note-spacing = ##t
    % proportionalNotationDuration = #(ly:make-moment 1/20)
  }
}

\paper {
  % ragged-right = ##f 
  % line-width = 120\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c' {
  c16[ c] c4 
  \slashedGrace c8 c8[ \slashedGrace c8 c8 ]
  \tuplet 5/4 { c16 c c c c } c4
  c16[ c] c8[ c]
  \slashedGrace c8 c8
  c16[ c c c] c4
  \bar "|."
}


%%% CONTEXTOS PARA CADA SUBITEM %%%

itemA = \score {
  \new StaffGroup <<
    \compassoItemA
    \new Staff <<
      \set Staff.instrumentName = "Cymbal"
      \keyItemA
      \andamentoItemA
      \clefItemARH
      \new Voice { 
        \musica
      }
    >>
    \new Staff <<
      \set Staff.instrumentName = "Tom"
      \clefItemALH
      \new Voice { 
        \musica
      }
    >>
  >>
}

itemB = \score {
  \new Staff <<
    \set Staff.instrumentName = "Cymbal"
    \andamentoItemB
    \compassoItemB
    \clefItemB
    \keyItemB
    \new Voice { 
      \musica
    }
  >>
}


\itemA

% Desmarcar para incluir o subitem B

\itemB