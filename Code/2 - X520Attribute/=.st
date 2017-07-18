
!X520Attribute methodsFor: 'comparing' stamp: 'rww 1/23/2007 20:51'!
= attr

	^ self attrOid = attr attrOid
		and: [self attrValue = attr attrValue]! !
