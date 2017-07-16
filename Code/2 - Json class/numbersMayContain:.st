
!Json class methodsFor: 'as yet unclassified' stamp: 'tonyg 8/17/2005 09:09'!
numbersMayContain: aChar
	^ aChar isDigit or: [#($- $+ $. $e $E) includes: aChar]! !
