
!MD5NonPrimitive methodsFor: 'private-functions' stamp: 'DSM 1/20/2000 01:47'!
fX: x Y: y Z: z
	" compute 'xy or (not x)z'"
	^ x copy bitAnd: y; bitOr: (x copy bitInvert; bitAnd: z)

	! !
