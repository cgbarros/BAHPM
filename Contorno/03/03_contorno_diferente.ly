\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 03_contorno
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Guitar"
andamentoItemA = \tempo 4 = 60
compassoItemA = \time 11/4
clefItemA = \clef "G_8"
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
% MUSICA %
%%%%%%%%%%

musica = \relative c' {
  \override Staff.TimeSignature #'stencil = ##f
  \accidentalStyle Score.neo-modern
  a8. b16
  \tuplet 5/4 { bes,4 g'16 ~ }
  \tuplet 3/2 { g4 c8 }
 \tag #'itemA { aes4 }
 \tag #'itemB { aes,4-+ }
  d'4 ~ d16[ cis,8.]
  \tuplet 7/4 { d4 fis8. }
  e8[ dis] f2.
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
 ragged-right = ##f 
 line-width = 150\mm
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