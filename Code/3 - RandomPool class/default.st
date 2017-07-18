
!RandomPool class methodsFor: 'default' stamp: 'len 8/20/2002 01:39'!
default
	^ default ifNil: [default := self new: 4096]! !
