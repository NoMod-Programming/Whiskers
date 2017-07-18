
!MD5NonPrimitive methodsFor: 'private-functions' stamp: 'DSM 1/20/2000 01:48'!
hX: x Y: y Z: z
	" compute 'x xor y xor z'"
	^ x copy bitXor: y; bitXor: z

	! !
