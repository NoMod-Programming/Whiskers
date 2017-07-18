
!CustomReporterMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:35'!
asBlockTuple
^ {#getParam. self commandSpec. (isBoolean ifTrue: [#b] ifFalse: [#r])}! !
