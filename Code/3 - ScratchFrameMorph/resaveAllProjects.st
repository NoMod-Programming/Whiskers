
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/17/2017 23:16'!
resaveAllProjects
	"Resave all the projects in the given directory (to recompress them)."

	| dir |
	dir := ScratchFileChooserDialog chooseFolder: FileDirectory default.
	dir = #cancelled ifTrue: [^ self].

	dir allFileNamesDo: [:fn |
		((fn asLowercase endsWith: '.sb') and:
		 [(fn endsWith: '-2.sb') not]) ifTrue: [
			self openScratchProjectNamed: fn.
			World doOneCycleNoInput.
"			projectName := (fn copyFrom: 1 to: fn size - 3), '-3.sb'."
			self writeScratchProject]].
! !
