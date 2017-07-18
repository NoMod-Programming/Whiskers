
!CommandBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 19:14'!
commandSpec: aString
	"Set my command spec string. See my class comment."
	"CommandBlockMorph new commandSpec: 'forward %n'"

	commandSpec  :=  aString.
	numberArgFlags  :=  nil.
	self addLabel.
! !
