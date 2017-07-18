
!ASN1StructuredType methodsFor: 'private' stamp: 'rww 3/23/2007 14:52'!
addElement: element

	self elements addLast: element.
	element addedTo: self.
	^element! !
