
!CommandBlockMorph class methodsFor: 'utilities' stamp: 'EMP 7/17/2017 12:26'!
parseCommandSpec: aString
	"CommandBlockMorph parseCommandSpec: '\\%n'"
	| result temp i |
	result := OrderedCollection new.
	temp := ''.
	i := 1.
	aString do: [:char |
		temp _ temp, char asString.
		i _ i + 1.
		(((((aString at: i ifAbsent: [$ ]) = $% | ((aString at: i ifAbsent: [$ ]) = $@)) and: [((aString at: i + 1 ifAbsent: [$ ]) = $ ) not]) and: [(((aString at: i - 3 ifAbsent: [$ ]) ~= $\) and: [((aString at: i - 1 ifAbsent: [$ ]) = $\) & ((aString at: i - 2 ifAbsent: [$ ]) = $\)]) not])) ifTrue: [
			result add: (temp withoutLeadingBlanks withoutTrailingBlanks).
			temp := ''].
		((((temp at: 1 ifAbsent: [nil]) = $%) | ((temp at: 1 ifAbsent: [nil]) = $@)) and: [(aString at: i ifAbsent: [nil]) = $ ]) ifTrue: [
			result add: (temp withoutLeadingBlanks withoutTrailingBlanks).
			temp := '']].
	result add: (temp withoutLeadingBlanks withoutTrailingBlanks).
	^ ( result select: [:m | m ~= '']) asArray! !
