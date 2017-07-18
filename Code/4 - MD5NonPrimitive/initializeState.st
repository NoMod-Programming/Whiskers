
!MD5NonPrimitive methodsFor: 'initialization' stamp: 'ul 3/7/2008 17:47'!
initializeState
	"Some magic numbers to get the process started"
	
	state := OrderedCollection newFrom: {
		(ThirtyTwoBitRegister new load: 16r67452301).
		(ThirtyTwoBitRegister new load: 16rEFCDAB89).
		(ThirtyTwoBitRegister new load: 16r98BADCFE).
		(ThirtyTwoBitRegister new load: 16r10325476)}.

! !
