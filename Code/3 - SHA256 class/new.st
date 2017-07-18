
!SHA256 class methodsFor: 'as yet unclassified' stamp: 'ziro 6/9/2017 01:45'!
new

	self isPluginAvailable 
		ifTrue: [ ^SHA256WithPrimitive basicNew initialize ]
		ifFalse: [ ^SHA256NonPrimitive basicNew initialize ]! !
