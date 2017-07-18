
!CBlockMorph methodsFor: 'private' stamp: 'EMP 7/16/2017 19:14'!
addCommandIcons
	"Add additional icons to certain blocks. Do nothing if this isn't one of those blocks."

	| f |

	(#(doForever doForeverIf doRepeat doUntil) includes: selector) ifTrue: [
		f  :=  ScratchFrameMorph skinAt: #loopIcon ifAbsent: [^ self].
		loopMorph  :=  ImageMorph new image: f.
		self addMorphBack: loopMorph].
! !
