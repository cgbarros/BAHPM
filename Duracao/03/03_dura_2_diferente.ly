\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 03_duracao
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Woodblock"
andamentoItemA = \tempo 4 = 85
compassoItemA = \time 3/4
clefItemA = \clef percussion
keyItemA = \key c \major

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \time 5/8
clefItemB = \clefItemA
keyItemB = \keyItemA

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

\include "../../difSpanner.ly"

musica = \relative c' {
  \difSpanner
 c16[ c c c] c16[ c] r8
 \tag #'itemA { c8[ c] }
 \tag #'itemB { c16[\startTextSpan c]\stopTextSpan }
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

\layout {
  \context {
    \Score
 \override TimeSignature #'stencil = ##f 		% Sem fórmla de compasso
% \accidentalStyle Score.neo-modern			% Acidente apenas para as notas
 \override StaffSymbol.line-count = #1			% Número de linhas na pauta
% \override Staff.StaffSymbol.line-positions = #'(-1 0 1)
% \override SpacingSpanner.uniform-stretching = ##t	% Notação proporcional
% \override SpacingSpanner.strict-note-spacing = ##t
 proportionalNotationDuration = #(ly:make-moment 1/20)
  }
}

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