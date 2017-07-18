
!Json methodsFor: 'private' stamp: 'Igor.Stasenko 4/7/2010 01:24'!
skipToEndOfLine
	| cr lf |
	cr := Character cr. lf := Character lf.
	[ | c | (c := stream peek) == cr or: [ c == lf]] whileFalse: [stream next].
	self skipWhitespace! !
