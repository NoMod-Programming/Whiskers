
!BackdropEventHatMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 19:47'!
asBlockTuple
	"Answer a tuple (Array) describing this block and its arguments."

	^ Array
		with: #whenSceneStarts
		with: scriptNameMorph choice
! !
