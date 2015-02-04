\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 08_metrica
Igual ou diferente: igual
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Flute"
andamentoItemA = \tempo 4 = 200
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
% ragged-right = ##f 
% line-width = 110\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c'' {
  a4 ~  a8. f16 a4 |
  a c b |
  f ~ f8. e16 f4 |
  e fis gis |
  a2. 
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

% Desmarcar para incluir o subitem B

% \itemB