
!MD4 methodsFor: 'functions' stamp: 'LC 6/24/2001 15:47'!
gRound: x shift: s 
	a := self lshift: a + (self gFunction: x) bits: s! !
