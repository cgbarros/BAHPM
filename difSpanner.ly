difSpanner = {
 \override TextSpanner.bound-details.left.text = \markup { \musicglyph #"scripts.stopped" \null }
 \override TextSpanner.style = #'line
 \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -0.5) }
}