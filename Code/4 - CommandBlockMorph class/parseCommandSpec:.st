
!CommandBlockMorph class methodsFor: 'utilities' stamp: 'EMP 7/14/2017 23:34'!
parseCommandSpec: aCommandSpec
	"Answer an array of token strings containing my keywords and argument specs."
	| result len i currentToken k |
	result  :=  OrderedCollection new.
	len  :=  aCommandSpec size.
	i  :=  1.
	currentToken := ''.
	[(i < len) and: [(aCommandSpec at: i) isSeparator]] whileTrue: [i  :=  i + 1].
	[i <= len] whileTrue: [
		k := aCommandSpec at: i.
		k = $% ifTrue: [
			result add: currentToken.
			currentToken := ''.
			[i >= len or: [' ?-' includes: k]] whileFalse: [
				currentToken := currentToken, k.
				i := i + 1.
				k := aCommandSpec at: i.
			].
			result add: currentToken.
			currentToken := ''.
			i = len ifTrue: [
				result at: (result size) put: (result last, k).
				k := ''.
			].
		].
		currentToken := currentToken, k.
		i := i + 1.
	].
	result add: currentToken.

	result  :=  result collect: [:s | s withBlanksTrimmed].
	^ result asArray select: [:s | s ~= '']! !
