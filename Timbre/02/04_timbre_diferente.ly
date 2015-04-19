\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 04_timbre
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Piano"
andamentoItemA = \tempo 4 = 75
compassoItemA = \time 9/4
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
 line-width = 110\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c'' {
  bes2 f4 
  \slashedGrace c'8 \tuplet 3/2 { b4 a ~  a8 fis ~ }
  fis4. cis'8
  dis16[ g, aes8] dis[ e]
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
\markup { \fill-line { \null "(2nd time with added reverb)" } }
% Desmarcar para incluir o subitem B

% \itemB