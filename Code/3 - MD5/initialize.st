
!MD5 methodsFor: 'initialization' stamp: 'ziro 6/9/2017 01:41'!
initialize
	"Some magic numbers to get the process started"

	state :=  #[1 35 69 103 137 171 205 239 254 220 186 152 118 84 50 16]
	self initializeState.
! !
