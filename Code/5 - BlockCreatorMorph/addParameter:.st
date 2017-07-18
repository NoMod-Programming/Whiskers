
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:10'!
addParameter: type
	type = #reporter ifTrue: [self commandSpec: (self commandSpec asString, ' %n ')].
	type = #string ifTrue: [self commandSpec: (self commandSpec asString, ' %s ')].
	type = #boolean ifTrue: [self commandSpec: (self commandSpec asString, ' %b ')].
	type = #text ifTrue: [self commandSpec: (self commandSpec asString, '  ')].
	type = #color ifTrue: [self commandSpec: (self commandSpec asString, ' %c ')].
	^ self fixParametersWith: lastParameters! !
