

!ASN1ObjectIdentifierType methodsFor: 'decoding' stamp: 'rww 3/26/2007 06:05'!

decodeValueWithDERStream: derStream length: length



	| b oid len |

	b := derStream next.

	oid := ((b // 40) asString) , '.'  ,((b rem:40) asString).

	len := 0.

	2 to: length do: [:i | 

		b := derStream next.

		((b bitAnd: 16r80) = 16r80) 

			ifTrue: [len := ((len bitShift: 7) + (b bitAnd: 16r7F))]

			ifFalse: [

				len := (len bitShift: 7) + b.

				oid := oid , '.', (len asString).

				len := 0]].

	^ ASN1ObjectId fromString: oid.! !

