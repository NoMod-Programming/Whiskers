
!MD5NonPrimitive methodsFor: 'private-functions' stamp: 'DSM 1/20/2000 13:38'!
ffA: a B: b C: c D: d M: m S: s T: t
	"compute a = b + ((a + f(b,c,d) + m + t) <<< s)"
	^ a += (self fX: b Y: c Z: d); += m; += t; leftRotateBy: s; += b.
! !
