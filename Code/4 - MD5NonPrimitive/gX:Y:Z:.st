
!MD5NonPrimitive methodsFor: 'private-functions' stamp: 'DSM 1/20/2000 01:48'!
gX: x Y: y Z: z
	" compute 'xz or y(not z)'"
	^ x copy bitAnd: z; bitOr: (z copy bitInvert; bitAnd: y)

	! !
