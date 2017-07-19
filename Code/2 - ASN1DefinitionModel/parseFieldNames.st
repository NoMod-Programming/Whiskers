

!ASN1DefinitionModel methodsFor: 'services parsing' stamp: 'RJT 9/3/2006 00:02'!

parseFieldNames

	| aString fields |

	aString := self asn1DefinitionString.

	fields := OrderedCollection new.

	(aString copyFrom: (aString indexOf: ${) + 1 to: (aString indexOf: $}) - 1) linesDo: [:aLine |

		(((aLine indexOfSubCollection: '--') > 0) or: [aLine withBlanksTrimmed isEmpty])ifFalse: [

			fields add: aLine subStrings first

		].

	].

	^fields! !

