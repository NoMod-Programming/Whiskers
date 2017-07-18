
!CommandBlockMorph methodsFor: 'private' stamp: 'EMP 7/16/2017 19:13'!
iconForName: aString
	'@turnLeft' = aString
		ifTrue: [^ ImageMorph new image: (ScratchFrameMorph
						skinAt: #turnCCW
						ifAbsent: [^ self])].
	'@turnRight' = aString
		ifTrue: [^ ImageMorph new image: (ScratchFrameMorph
						skinAt: #turnCW
						ifAbsent: [^ self])].
	 ^ Morph new! !
