\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 02_timbre
Igual ou diferente: diferente
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set PianoStaff.instrumentName = "Piano"
andamentoItemA = \tempo 8 = 200
compassoItemA = \time 6/8
clefItemARH = \clef treble
clefItemALH = \clef bass
keyItemA = \key a \minor

%%%%%%%%%%%%%
% SUBITEM B %
%%%%%%%%%%%%%

%{
instrumentoNomeItemB = \instrumentoNomeItemA
andamentoItemB = \andamentoItemA
compassoItemB = \compassoItemA
clefItemB = \clefItemA
keyItemB = \keyItemA 
%}

%%%%%%%%%%
% LAYOUT %
%%%%%%%%%%

\include "lilypond-book-preamble.ly"

\layout {
  \context {
    \Score
      % Sem fórmla de compasso
    % \override TimeSignature #'stencil = ##f
    
      % Acidente apenas para as notas
    % \accidentalStyle Score.neo-modern
    
      % Número de linhas na pauta
    % \override StaffSymbol.line-count = #1
    % \override Staff.StaffSymbol.line-positions = #'(-1 0 1)
    
      % Notação proporcional
    % \override SpacingSpanner.uniform-stretching = ##t	
    % \override SpacingSpanner.strict-note-spacing = ##t
    % proportionalNotationDuration = #(ly:make-moment 1/20)
  }
}

\paper {
  % ragged-right = ##f 
  line-width = 120\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musicaRH = \relative c' {
  d4. e |
  f8 a g a g f |
  d4. f4 f8 |
  a2. |
  \bar "|."
}

musicaLH = \relative c {
  R2. |
  d4. e4. |
  f8 a g a g f |
  d2.
  \bar "|."
}


%%% CONTEXTOS PARA CADA SUBITEM %%%

itemA = \score {
  \new PianoStaff <<
    \instrumentoNomeItemA
    \compassoItemA
    \new Staff <<
      \keyItemA
      \andamentoItemA
      \clefItemARH
      \new Voice { 
        \musicaRH
      }
    >>
    \new Staff <<
      \clefItemALH
      \new Voice { 
        \musicaLH
      }
    >>
  >>
}

%{
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
%}


\itemA

\markup { \fill-line { \null "(2nd time with added filters)" } }

% Desmarcar para incluir o subitem B

% \itemB