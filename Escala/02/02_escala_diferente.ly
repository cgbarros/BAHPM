\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 02_escala
Igual ou diferente: diferente
%}

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%

% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName ="Violin"
andamentoItemA = \tempo 8 = 210
compassoItemA = \time 5/8
clefItemA = \clef treble


%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

% Caso o exemplo seja igual, manter essa seção comentada
% Cada elemento possui um comentário anterior a ele para
% que seja removido somente o elemento diferenciado

% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \compassoItemA

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c' { 
  f4 d8 b' a |
  e4 c'8 b 
  \tag #'itemA { a }
  \tag #'itemB { aes-+ } |
  f4 g8 b e, |
  f2 ~ f8 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
 ragged-right = ##f 
 line-width = 110\mm
}

%%%%%%%%%%%%%
% CONTEXTOS %
%%%%%%%%%%%%%

itemA = \score {
  \new Staff <<
    \instrumentoNomeItemA
    \andamentoItemA
    \compassoItemA
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
    \new Voice { 
      \keepWithTag #'itemB \musica
    }
  >>
}



\itemA

% Desmarcar para incluir o subitem B

\itemB