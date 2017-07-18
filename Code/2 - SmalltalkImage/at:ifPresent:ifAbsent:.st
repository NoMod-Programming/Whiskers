
!SmalltalkImage methodsFor: 'accessing' stamp: 'EMP 7/16/2017 20:58'!
at: key ifPresent: aBlock ifAbsent: absentBlock
	"Lookup the given key in the globals. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer nil."

	^globals at: key ifPresent: aBlock ifAbsent: absentBlock! !
