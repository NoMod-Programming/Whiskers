
!ByteArray methodsFor: '*cryptography-core' stamp: 'cmm 2/23/2006 13:25'!
unsigned40At: index
	"Return a unsigned integer quantity starting from the given byte index"

	| b0 b1 b2 b3 w |

	w := self at: index.
	b3 := self at: index+1.
	b2 := self at: index+2.
	b1 := self at: index+3.
	b0 := self at: index+4.

	"Minimize LargeInteger arithmetic"
	b3 = 0 ifFalse:[w := (b3 bitShift: 8) + w].
	b2 = 0 ifFalse:[w := (b2 bitShift: 16) + w].
	b1 = 0 ifFalse:[w := (b1 bitShift: 24) + w].
	b0 = 0 ifFalse:[w := (b0 bitShift: 32) + w].

	^w! !
