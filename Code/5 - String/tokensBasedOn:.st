

!String methodsFor: '*cryptography-asn1' stamp: 'RJT 12/18/2006 10:08'!

tokensBasedOn: aChar

	"Answer an array of the substrings that compose the receiver."

	| result end begin |



	result := WriteStream on: (Array new: 10).



	begin := 1.

	"find one substring each time through this loop"

	[ 

		"find the beginning of the next substring"

		end := self indexOf: aChar startingAt: begin ifAbsent: [ nil ].

		end ~~ nil ] 

	whileTrue: [

		result nextPut: (self copyFrom: begin to: end - 1).

		begin := end + 1].

	result nextPut: (self copyFrom: begin to: self size).

	^result contents

! !

