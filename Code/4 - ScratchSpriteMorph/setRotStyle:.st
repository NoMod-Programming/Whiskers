
!ScratchSpriteMorph methodsFor: 'motion ops' stamp: 'EMP 7/17/2017 16:53'!
setRotStyle: aSymbol
	aSymbol = #'all around' ifTrue: [^ self rotationStyle: #normal].
	aSymbol = #'left-right' ifTrue: [^ self rotationStyle: #leftRight].
	aSymbol = #'don''t rotate' ifTrue: [^ self rotationStyle: #none].
	aSymbol = #none ifTrue: [^ self rotationStyle: #none].
	aSymbol = #normal ifTrue: [^ self rotationStyle: #normal].
	aSymbol = #leftRight ifTrue: [^ self rotationStyle: #leftRight].
	^ self rotationStyle: #leftRight! !
