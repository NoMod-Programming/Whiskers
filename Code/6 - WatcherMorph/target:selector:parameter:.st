
!WatcherMorph methodsFor: 'initialization' stamp: 'EMP 11/5/2017 20:20'!
target: anObject selector: selector parameter: parameter
	"Initialize this watcher. If parameter is not nil, then this watcher is used to access user-defined variables or parameterized reporters."

	readout
		target: anObject;
		getSelector: selector asSymbol;
		parameter: parameter.

	isSpriteSpecific := ScriptableScratchMorph isSpriteSpecificTarget: anObject selector: selector.
! !
