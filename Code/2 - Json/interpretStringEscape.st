
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:11'!
interpretStringEscape
	| c |
	c := stream next.
	c ifNil: [JsonIncompleteError signal: 'Expected character following ''\'' in string escape'].
	c == $b ifTrue: [^ Character backspace].
	c == $n ifTrue: [^ Character lf].
	c == $f ifTrue: [^ Character newPage].
	c == $r ifTrue: [^ Character cr].
	c == $t ifTrue: [^ Character tab].
	c == $u ifTrue: [^ self unescapeUnicode].
	^ c.! !
