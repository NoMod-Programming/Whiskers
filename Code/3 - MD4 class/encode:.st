
!MD4 class methodsFor: 'instance creation' stamp: 'LC 10/26/2001 19:12'!
encode: aString
	^ (self input: aString)
		run;
		output! !
