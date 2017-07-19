

!ASN1Stream methodsFor: 'stream - api' stamp: 'rww 3/23/2007 21:06'!

peekTag



	| start |

	start := self position.

	^[self nextTag] ensure: [self position: start]! !

