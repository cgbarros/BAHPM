\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 09_contorno
Igual ou diferente: igual
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "6 Woodblocks"
andamentoItemA = \tempo 4 = 145
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
% MUSICA %
%%%%%%%%%%

musica = \relative c'' {
% desmarcar as configurções abaixo para itens sem barra de compasso
 \override Staff.TimeSignature #'stencil = ##f
 \accidentalStyle Score.neo-modern
 a16 e, b'8 \tuplet 3/2 { d8 b g } \tuplet 3/2 { b g e } |
 e8 g16 b d4 g, |
 a'8[ d,] f[ f] g,4 |
 f'2
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
 ragged-right = ##f 
 line-width = 160\mm
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

%\itemB