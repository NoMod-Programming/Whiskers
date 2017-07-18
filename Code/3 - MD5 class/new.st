
!MD5 class methodsFor: 'as yet unclassified' stamp: 'ziro 6/9/2017 01:45'!
new

	self isPluginAvailable 
		ifTrue: [ ^MD5WithPrimitive basicNew initialize ]
		ifFalse: [ ^MD5NonPrimitive basicNew initialize ]! !
