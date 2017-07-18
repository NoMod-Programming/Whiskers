
!ASN1StructureElement methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:52'!
decode: aTarget withDERStream: derStream

	| tag val |
	derStream atEnd ifTrue: [
		self hasDefault ifTrue: [^self value: self default into: aTarget].
		self isOptional ifTrue: [^self].
		^ self error: 'missing element'].
	tag := derStream peekTag.
	(self matchesTag: tag)
		ifTrue: [
			val := type 
				decodeWithDERStream: derStream 
				owner: aTarget 
				ownerType: self owner.
			self value: val into: aTarget.
			^ val ]
		ifFalse: [
			self hasDefault ifTrue: [^self value: self default into: aTarget].
			self isOptional ifTrue: [^self].
			^ self error: 'missing element'].
! !
