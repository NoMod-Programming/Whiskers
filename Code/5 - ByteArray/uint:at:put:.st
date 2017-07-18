
!ByteArray methodsFor: '*cryptography-core' stamp: 'cmm 2/23/2006 13:32'!
uint: bits at: position put: anInteger

	position
		to: position + (bits // 8) - 1
		do:
			[ :pos |
			self
				at: pos
				put: (anInteger digitAt: pos-position+1) ].
	^ anInteger! !
