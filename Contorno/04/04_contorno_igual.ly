\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 04_contorno
Igual ou diferente: igual
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Flute"
andamentoItemA = \tempo 4 = 120
compassoItemA = \time 10/4
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
% MUSICA %
%%%%%%%%%%

musica = \relative c'' {
% desmarcar as configurções abaixo para itens sem barra de compasso
 \override Staff.TimeSignature #'stencil = ##f
 \accidentalStyle Score.neo-modern
 d4 c16.[ des,32 e8]
 \tuplet 3/2 { b'4 ees8[ a,] bes4 ~ }
 bes8[ f] \tuplet 3/2 { g8 aes4 ~ }
 \tuplet 5/4 { aes4 ges8 ~ } ges2
 \tag #'itemA { }
 \tag #'itemB { }
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
% ragged-right = ##f 
% line-width = 110\mm
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