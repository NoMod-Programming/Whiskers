

!PBEStorage class methodsFor: 'instance creation' stamp: 'rww 10/13/2016 03:02'!

readFrom: stream



	| storage |

	storage := super new.

	[ storage readFrom: stream ]

		on: Error

		do: [ :ex | NotFound signal].

	^ storage! !

