
!ImageMedia methodsFor: 'other' stamp: 'EMP 7/18/2017 16:51'!
exportFilename: fileName for: stageOrSprite
	"Export my image to a file with the given name. Save sprite costumes as GIF's, dropping color resolution if necessary."

	| myForm f fName |

	svgForm ifNotNil: [
		fName := (FileDirectory baseNameFor: fileName), '.svg'.
		f := ScratchFrameMorph newScratchFileNamed: fName.
		f ifNil: [^ self].
		svgForm printXMLOn: (XMLWriter on: f).
		f close.
	].

	myForm := self compositeFormForScale: 1.0.

	"save as GIF if image has under 256 colors"
	((myForm depth <= 8) or: [myForm couldBeColorReduced]) ifTrue: [
		f := myForm colorReduced8Bit.
		fName := (FileDirectory baseNameFor:  fileName) , '.gif'.
		[GIFReadWriter putForm: f onFileNamed: fName] ifError: [self inform: 'Could not write image to file' withDetails: 'Export to ', fileName, 'failed. Perhaps a locked directory?'].
		^ self].

	"otherwise, save as BMP to retain color resolution"
	fName := (FileDirectory baseNameFor:  fileName) , '.bmp'.

	(stageOrSprite isScratchSpriteMorph)
		ifTrue: [
			f := Form extent: myForm extent depth: 32.
			f fillColor: Color white.  "BMP cannot handle transparency; use white as BG color"
			myForm displayOn: f at: form offset negated rule: Form paint]
		ifFalse: [
			f := myForm asFormOfDepth: 32].

	[f writeBMPfileNamed: fName] ifError: [self inform: 'Could not write image to file' withDetails: 'Export to ', fileName, 'failed. Perhaps a locked directory?']
! !
