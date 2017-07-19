

!MD2 methodsFor: 'accessing' stamp: 'rww 1/23/2007 19:44'!

hashMessage: aStringOrByteArray



	| input |

	input := self appendPaddingToInput: aStringOrByteArray asByteArray.

	input := self appendChecksumToInput: input.

	^ self processBlocks: input.

! !

