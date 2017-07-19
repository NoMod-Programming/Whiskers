

!ASN1IntegerType methodsFor: 'encoding' stamp: 'rww 3/25/2007 12:11'!

encodeValue: anObject withDERStream: derStream



	| integer |

	integer := anObject.

	integer positive

		ifTrue: [

			(integer lastDigit allMask: 16r80) 

				ifTrue: [derStream nextPut: 0]]

		ifFalse: [

			integer := integer negated twosComplement.

			(integer lastDigit noMask: 16r80)

				ifTrue: [derStream nextPut: 16rFF]].

	integer digitLength to: 1 by: -1 do: [:digitIndex |

		derStream nextPut: (integer digitAt: digitIndex)].

! !

