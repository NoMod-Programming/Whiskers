

!ASN1IntegerType methodsFor: 'decoding' stamp: 'rww 3/26/2007 06:04'!

decodeValueWithDERStream: derStream length: length



	| integer |

	integer := Integer new: length neg: false.

	length to: 1 by: -1 do: [:index |

		integer digitAt: index put: derStream next].

	((integer digitAt: length) allMask: 16r80)

		ifTrue: [^integer twosComplement negated normalize]

		ifFalse: [^integer normalize].

! !

