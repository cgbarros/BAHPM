\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 01_escala
Igual ou diferente: Igual
%}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
% ragged-right = ##f 
% line-width = 110\mm
}

musica = \relative c' { 
  \partial 8 c8 |
  d4 c8 |
  g'8 f e |
  f4 e8 |
  d8 a b |
  c4. \bar "|."
  \tag #'itemA { }
  \tag #'itemB { }
}


%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%

% Informações antes da música
% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName ="Piano"
andamentoItemA = \tempo  4. = 60
compassoItemA = \time 3/8
clefItemA = \clef treble

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

% Caso o exemplo seja igual, manter essa seção comentada
% Cada elemento possui um comentário anterior a ele para
% que seja removido somente o elemento diferenciado

% Informações antes da música
% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \compassoItemA

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

%\itemB