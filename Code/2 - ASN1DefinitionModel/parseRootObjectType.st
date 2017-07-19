

!ASN1DefinitionModel methodsFor: 'services parsing' stamp: 'RJT 9/7/2006 15:58'!

parseRootObjectType

	"parse the definition string and figure out if this object is a subject or a

	collection of subjects"

	| aString aType |

	aString := self asn1DefinitionString.

	aType := (aString copyFrom: (aString indexOfSubCollection: '::=')

					+ 4 to: (aString indexOf: ${)

					- 1) withBlanksTrimmed.

	^aType isEmpty

		ifTrue: [self subject]

		ifFalse: [aType = 'SEQUENCE'

				ifTrue: [OrderedCollection]

				ifFalse: [self error: 'new root type']]! !

