
!BlockCreatorMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 09:55'!
isArgSpec: aString
	"Answer true if the given string is an argument specification."
^ (((aString size > 1) and: [aString first = $%]) and: [#('%s' '%b' '%n' '%c' '%m.spriteOnly' '%m.spriteOrMouse' '%m.spriteOrStage' '%m.location' '%m.touching' '%m.timeAndDate' '%m.var' '%m.list' '%m.backdrop' '%m.broadcast') includes: aString])! !
