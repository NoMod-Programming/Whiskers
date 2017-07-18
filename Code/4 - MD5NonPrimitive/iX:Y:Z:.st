
!MD5NonPrimitive methodsFor: 'private-functions' stamp: 'DSM 1/20/2000 01:48'!
iX: x Y: y Z: z
	" compute 'y xor (x or (not z))'"
	^ y copy bitXor: (z copy bitInvert; bitOr: x)
! !
