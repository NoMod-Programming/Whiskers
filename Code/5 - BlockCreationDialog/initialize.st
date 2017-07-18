
!BlockCreationDialog methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:50'!
initialize
	| toggleButton labelText maxStringLength buttons label offForm onForm b final |

	"Dear people wishing to look at my code... I know that this is repetitive. I should fix it, but right now I am feeling too lazy to do so. So... you can fix it if you like"

	super initialize.
	block _ BlockCreatorMorph new commandSpec: '	'.
	blockColumn _ AlignmentMorph new color: Color transparent; addMorph: block.
	self title: 'New Block'.
	isAtomic _ false.
	showingBin _ true.
	blockParts _ OrderedCollection new.
	showHideButton _ AlignmentMorph new color: Color transparent.
	isAtomicButton _ AlignmentMorph new color: Color transparent.
	toggleButton _ ((ToggleButton
		onForm: (ScratchFrameMorph skinAt: #watcherButtonPressed)
		offForm: (ScratchFrameMorph skinAt: #watcherButton)) alphaOn: false).
	toggleButton target: self;
		actionSelector: #toggleAtomic;
		borderWidth: 0;
		setProperty: #balloonText toValue: 'Allows a block to run without making changes to the screen until it is done' localized.
	labelText _ StringMorph new contents: '  Run without screen refresh'; font: (ScratchFrameMorph getFont: #DialogBoxMessage).
	isAtomicButton addMorphBack: toggleButton; addMorphBack: (labelText position: (toggleButton topRight + (10@0))).
	showHideButton addMorphBack: ((toggleButton copy) onForm: (ScratchFrameMorph skinAt: #arrowOpenComment) offForm: (ScratchFrameMorph skinAt: #arrowClosedComment); actionSelector: #toggleBin; setProperty: #balloonText toValue: 'Show or hide additional options for this block'); addMorphBack: (StringMorph new contents: ' options'; font: (ScratchFrameMorph getFont: #DialogBoxMessage)).


	"find the longest string"
	maxStringLength _ 385.
	

	"assemble the block builder"
	blockPartsBin _ AlignmentMorph newColumn
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	buttons _ (#(
	('add number input' reporter)
	('add string input' string)
	('add boolean input' boolean)
	('add label text' text)
	) collect: [:pair | 
	label _ StringMorph contents: ((ScratchTranslator translationFor: pair first asString) capitalized) font: (ScratchFrameMorph getFont: #DialogBoxMessage).
	offForm _ (ScratchFrameMorph skinAt: (pair second, 'Button')).
	onForm _ (ScratchFrameMorph skinAt: (pair second, 'ButtonPressed')).
	b _ ResizableToggleButton2 new offForm: offForm onForm: onForm overForm: onForm.
	b target: self; actionSelector: #addParameter:; arguments: (Array with: pair second).
	b extent: 51@26.
	final _ AlignmentMorph new color: Color transparent; hResizing: #rigid; vResizing: #shrinkWrap; extent: ((maxStringLength + b width) @ (b height - 15)).
	final addMorph: (label position: 0@0); addMorphBack: (Morph new color: Color transparent; extent: (maxStringLength - label width)@5); addMorphBack: (b position: (maxStringLength@0)).
	b over; off.
	final]).
	
	buttons do: [:m | blockPartsBin addMorphBack: m].

	bin _ AlignmentMorph newColumn color: Color transparent.
	bin 
		addMorphBack: blockPartsBin;
		addMorphBack: isAtomicButton.

	mainColumn submorphsDo: [:m | 
		((m = messageLineMorphs) not) ifTrue: [m delete]].
	mainColumn
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: blockColumn;
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: showHideButton;
		addMorphBack: (Morph new extent: (5@7); color: Color transparent);
		addMorphBack: bin;
		addMorphBack: (Morph new extent: (216@7); color: Color transparent);
		addMorphBack: buttonRow.
	self extent: (385@175).
	self toggleBin.
self extent: (385@175).! !
