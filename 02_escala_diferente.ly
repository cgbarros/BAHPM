\version "2.18.2"

\include "lilypond-book-preamble.ly"

\paper {
 ragged-right = ##f 
 line-width = 110\mm
}

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item (número):
Igual ou diferente:
%}

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%

% Informações antes da música
% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName ="Violino"
andamentoItemA = \tempo 8 = 210
compassoItemA = \time 5/8
clefItemA = \clef treble

% Inserir música do item A

diferente = { a' }

musicaItemA = \relative c' { 
  f4 d8 b' a |
  e4 c'8 b a |
  f4 g8 b e, |
  f2 ~ f8 \bar "|."
}




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

% Música do Item B

musicaItemB = \relative c' { 
  f4 d8 b' a |
  e4 c'8 b aes-+ |
  f4 g8 b e, |
  f2 ~ f8 \bar "|."
}


\include "templateA.ly"

\include "templateB.ly"