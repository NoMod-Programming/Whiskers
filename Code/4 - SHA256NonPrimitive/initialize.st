
!SHA256NonPrimitive methodsFor: 'private' stamp: 'ul 3/7/2008 19:05'!
initialize
	"Initialize totalA through totalH to their seed values."

	totalA := ThirtyTwoBitRegister new load: self class h0.
	totalB := ThirtyTwoBitRegister new load: self class h1.
	totalC := ThirtyTwoBitRegister new load: self class h2.
	totalD := ThirtyTwoBitRegister new load: self class h3.
	totalE := ThirtyTwoBitRegister new load: self class h4.
	totalF := ThirtyTwoBitRegister new load: self class h5.
	totalG := ThirtyTwoBitRegister new load: self class h6.
	totalH := ThirtyTwoBitRegister new load: self class h7
! !
