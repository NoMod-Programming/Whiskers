
!CommandBlockMorph class methodsFor: 'utilities' stamp: 'EMP 7/16/2017 19:12'!
isArgSpec: aString
	"Answer true if the given string is an argument specification."
	^ ((aString size > 1) and: [aString first = $%])! !
