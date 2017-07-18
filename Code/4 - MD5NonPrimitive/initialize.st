
!MD5NonPrimitive methodsFor: 'initialization' stamp: 'DSM 1/20/2000 17:56'!
initialize
	"Some magic numbers to get the process started"
	state := OrderedCollection newFrom: {
		(ThirtyTwoBitRegister new load: 16r67452301).
		(ThirtyTwoBitRegister new load: 16rEFCDAB89).
		(ThirtyTwoBitRegister new load: 16r98BADCFE).
		(ThirtyTwoBitRegister new load: 16r10325476)}.

! !
