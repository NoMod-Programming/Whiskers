
!Rijndael methodsFor: 'setup' stamp: 'cs 8/6/2002 18:50'!
calculateNumberOfRounds
	nK = 4 ifTrue: [
		nB = 4 ifTrue: [nR := 10].
		nB = 6 ifTrue: [nR := 12].
		nB = 8 ifTrue: [nR := 14]].
	nK = 6 ifTrue: [
		nB = 4 ifTrue: [nR := 12].
		nB = 6 ifTrue: [nR := 12].
		nB = 8 ifTrue: [nR := 14]].
	nK = 8 ifTrue: [
		nB = 4 ifTrue: [nR := 14].
		nB = 6 ifTrue: [nR := 14].
		nB = 8 ifTrue: [nR := 14]].

! !
