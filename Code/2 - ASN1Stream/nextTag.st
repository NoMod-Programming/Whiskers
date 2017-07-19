

!ASN1Stream methodsFor: 'stream - api' stamp: 'rww 3/22/2007 15:54'!

nextTag



	| tag octet |

	tag := self stream next.

	((tag bitAnd: 2r00011111) == 2r00011111)

		ifTrue: [

			tag := 0.

			[

				octet := self stream next.

				tag := (tag bitShift: 7) bitOr: (octet bitClear: 2r10000000).

				(octet bitAnd: 2r10000000) > 0] 

					whileTrue].

	self currentTag: tag.

	^ tag! !

