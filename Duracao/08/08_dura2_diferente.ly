\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 08_duracao
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set Staff.instrumentName = "Snare drum"
% andamentoItemA = \tempo "" 
compassoItemA = \time 4/8
clefItemA = \clef percussion
keyItemA = \key c \major

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

instrumentoNomeItemB = \instrumentoNomeItemA
%andamentoItemB = \tempo ""
compassoItemB = \compassoItemA
clefItemB = \clefItemA
keyItemB = \keyItemA

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musica = \relative c' {
 \override Staff.TimeSignature #'stencil = ##f
% \accidentalStyle Score.neo-modern
 \override Staff.StaffSymbol.line-count = #1
 \tag #'itemA { 
   c32[ ^\markup { \small { \note-by-number #2 #0 #UP } "= 123" \italic "rall." } c c c 
   c c c c 
   c c c c 
   c c c c] ^\markup { \small { \note-by-number #2 #0 #UP } "= 65" }  }
 \tag #'itemB {
   c32[ ^\markup { \small { \note-by-number #2 #0 #UP } "= 100" \italic "rall." } c c c 
   c c^\markup { \small { \note-by-number #2 #0 #UP } "= 46" \italic "accel." } c c 
   c c c c 
   c c c c] ^\markup { \small { \note-by-number #2 #0 #UP } "= 110" }
 }
 \bar "|."
}

%%% Configuração de layout %%%

\include "lilypond-book-preamble.ly"

% desmarcar os itens abaixo para regular alinhamento de itens

\paper {
 ragged-right = ##f 
 line-width = 180\mm
}

%%% CONTEXTOS PARA CADA SUBITEM %%%

itemA = \score {
  \new Staff <<
    \instrumentoNomeItemA
    % \andamentoItemA
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
    % \andamentoItemB
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