

!ASN1Pragma class methodsFor: 'instance creation' stamp: 'RJT 9/2/2006 14:21'!

fromPragma: aPragma

	| aClass |

	aClass := (self isAccessorPragma: aPragma) ifTrue: [ASN1PragmaAccessor] ifFalse: [ASN1PragmaMutator].

	^aClass fromPragma: aPragma! !

