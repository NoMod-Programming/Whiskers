
!VariableBlockMorph methodsFor: 'watcher' stamp: 'EMP 11/5/2017 20:27'!
createWatcher
	"Return a new watcher for me."

	| newWatcher |
	newWatcher := WatcherMorph new setCategoryColor: self color.
	newWatcher target: receiver selector: #getVar: parameter: varReference.

	^ newWatcher
! !
