
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/17/2017 23:17'!
writeMultipleSummaries
	"Write the summary for all Scratch projects in a given folder."

	| dir |
	dir := ScratchFileChooserDialog chooseFolder: FileDirectory default.
	dir = #cancelled ifTrue: [^ self].

	dir allFileNamesDo: [:fn |
		(fn asLowercase endsWith: '.scratch') | (fn asLowercase endsWith: '.sb') | (fn asLowercase endsWith: '.sb2') ifTrue: [
			self openScratchProjectNamed: fn.
			World doOneCycleNoInput.
			self writeSummaryFile: fn]].
! !
