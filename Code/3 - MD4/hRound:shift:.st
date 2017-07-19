

!MD4 methodsFor: 'functions' stamp: 'LC 6/24/2001 15:47'!

hRound: x shift: s 

	a := self lshift: a + (self hFunction: x) bits: s! !

