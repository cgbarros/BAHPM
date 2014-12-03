\version "2.18.2"

% Inserir música (renomear variável para o nome do exemplo)

musica = \relative c' {  }

% Inserir nome do instrumento

instrumentName = \set Staff.instrumentName =""

\new Staff <<
  \instrumentName
  \new Voice { \musica  }
>>