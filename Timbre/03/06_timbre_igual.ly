\version "2.18.2"

%{
BAHPM
Bateria de Avaliação da Habilidade de Percepção Musical
Item: 06_timbre
Igual ou diferente: igual
%}

%%% INFORMACOES PRE-MUSICA %%%

%%%%%%%%%%%%%
% SUBITEM A %
%%%%%%%%%%%%%


% Inserir nome do instrumento, andamento, compasso, clave

instrumentoNomeItemA = \set PianoStaff.instrumentName = "Piano"
andamentoItemA = \tempo 4. = 60
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
  % line-width = 120\mm
}

%%%%%%%%%%
% MUSICA %
%%%%%%%%%%

musicaRH = \relative c'' {
  a8. b16 a8 c4 f8 |
  b,4. a4.
  \bar "|."
}

musicaLH = \relative c {
  f8. e16 f8 e4 d8 |
  g4. a4.
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

% Desmarcar para incluir o subitem B

% \itemB