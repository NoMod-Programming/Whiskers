ScratchMedia subclass: #ImageMedia
	instanceVariableNames: 'form rotationCenter textBox jpegBytes compositeForm savedForm svgForm '
	classVariableNames: 'JPEGPlaceholderForm '
	poolDictionaries: ''
	category: 'Scratch-Objects'!
Object subclass: #Json
	instanceVariableNames: 'stream ctorMap'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!Json commentStamp: '<historical>' prior: 0!
This class reads and writes JSON format data - strings, numbers, boolean, nil, arrays and dictionaries. See http://www.crockford.com/JSON/index.html. It has been extended with syntax for invoking a prearranged list of constructors on read objects.!

Json class
	instanceVariableNames: 'escapeArray'!
Object subclass: #JsonDummyTestObject
	instanceVariableNames: 'a b c'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!
JsonSyntaxError subclass: #JsonIncompleteError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonIncompleteError commentStamp: 'tonyg 4/29/2016 11:37' prior: 0!
I signal that reading a JSON value failed because more input is required, but that the input seen so far was not incorrect. Compare to JsonInvalidError.

Be warned that reading numbers directly out of a stream can be ambiguous!!

Consider reading from '1234'. Is the result intended to be 1234, or is there missing input, and the next character will be '5', making the result (possibly) 12345?!

JsonSyntaxError subclass: #JsonInvalidError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonInvalidError commentStamp: 'tonyg 4/29/2016 11:06' prior: 0!
I signal that reading a JSON value failed because the input didn't match the (extended)JSON grammar implemented by class Json.!

Dictionary subclass: #JsonObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!
Error subclass: #JsonSyntaxError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonSyntaxError commentStamp: 'tonyg 4/29/2016 11:06' prior: 0!
Class Json signals (possibly-indirect) instances of me when reading a JSON value from an input stream fails.!

TestCase subclass: #JsonTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JSON'!

!JsonTests commentStamp: '<historical>' prior: 0!
I provide a number of test cases for class Json.!

SVGRenderer subclass: #SVGBalloonRenderer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGSegmentRun subclass: #SVGBezierSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGEllipseMorph subclass: #SVGCircleMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
LineSegment subclass: #SVGClosingLineSegment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
MatrixTransformMorph subclass: #SVGComponentMorph
	instanceVariableNames: 'id style cachedComposedStyle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGCompositeMorph
	instanceVariableNames: 'fills'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGEllipseMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
LineSegment subclass: #SVGFixupLineSegment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGLineSegmentRun subclass: #SVGFixupLineSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
GradientFillStyle subclass: #SVGGradientFillStyle
	instanceVariableNames: 'units spread'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGGroupMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGLineMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGSegmentRun subclass: #SVGLineSegmentRun
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGPathMorph
	instanceVariableNames: 'segments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGPolygonalMorph subclass: #SVGPolygonMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGPolygonalMorph
	instanceVariableNames: 'points'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGPolygonalMorph subclass: #SVGPolylineMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
Dictionary subclass: #SVGPropertyDictionary
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGRectangularMorph subclass: #SVGRectMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGComponentMorph subclass: #SVGRectangularMorph
	instanceVariableNames: 'rectangle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGMorph subclass: #SVGRenderMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!

!SVGRenderMorph commentStamp: 'EMP 7/16/2017 11:11' prior: 0!
Used for Scratch, renders an SVG without any borders or background for use as a costume!

Object subclass: #SVGRenderer
	instanceVariableNames: ''
	classVariableNames: 'DefaultRenderer'
	poolDictionaries: ''
	category: 'SVG-Morphic'!
Object subclass: #SVGSegmentRun
	instanceVariableNames: 'segments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGTextMorph subclass: #SVGTSpanMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
SVGCompositeMorph subclass: #SVGTextMorph
	instanceVariableNames: 'text location'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SVG-Morphic'!
Morph subclass: #ScratchCategorySelector
	instanceVariableNames: 'label translatedLabel categoryColor isSelected textColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchFrameMorph
	instanceVariableNames: 'topPane viewerPane scriptsPane stageFrame workPane titlePane libraryPane menuPanel stageButtonsPanel readoutPane logoMorph projectTitleMorph flagButton fillScreenFlag paintingInProgress projectDirectory projectName projectInfo author loginName loginPassword watcherPositions shuffledCostumeNames justSaved viewModeButtons viewMode lastViewMode viewModeButtonsPanel toolbarPanel lastWeDoPoll workPaneWrapper '
	classVariableNames: 'AllowRemoteConnectionDialog AllowSharing DefaultNotes DefaultSprite FontDefaults Fonts FontsXO IsXO ScratchClipboard ScratchServers ScratchSkin ScratchSkinXO ShareServer ShareServerPath StartupPresentationMode SupportServer SupportServerPath TakeOverScreen UseErrorCatcher UserFontScale Version VersionDate VisibleDrives WorkpaneExtent '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchLibraryMorph
	instanceVariableNames: 'scrollPane stagePane thumbWidth itemExtent spritePane buttonPane spriteLabel topSectionHeight '
	classVariableNames: 'TitleStyle '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchPresenterMorph
	instanceVariableNames: 'frame stage stageWrapper buttons flagButton offscreenWorld mouseFocus mouseDownPoint dragOffset clickWasHandled mouseMoved lastStepTime '
	classVariableNames: 'TopStyle '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchScriptEditorMorph
	instanceVariableNames: 'thumbnailMorph nameMorph pageViewerMorph rotationButtons lockButton readoutMorphs penReadout currentCategory tabPaneMorph deleteButton target topSectionHeight viewerPane '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
Morph subclass: #ScratchTabMorph
	instanceVariableNames: 'id label translatedLabel selected mouseOver'
	classVariableNames: 'NormalStyle SelectedStyle'
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
PasteUpMorph subclass: #ScratchTabPaneMorph
	instanceVariableNames: 'targetPane currentTab lastTabAdded barForm '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
ImageMorph subclass: #ScratchThumbnailMorph
	instanceVariableNames: 'target showDirection lastUpdateMSecs lastRotationDegrees draggingDirection xreadout yreadout '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchTitlePaneMorph
	instanceVariableNames: ''
	classVariableNames: 'Style'
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchViewerMorph
	instanceVariableNames: 'target pageViewer currentCategory catButtonsExtent categoryButtons topSectionHeight '
	classVariableNames: 'CatList '
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!

!ScratchViewerMorph commentStamp: 'EMP 7/13/2017 15:27' prior: 0!
I am a Scratch blocks palette viewer. I have a set of ScratchCategorySelectors that allow selection of a blocks category to view and a scrollable area showing the blocks in the currently selected category.
The actual palette of blocks is a ScratchBlockPaletteMorph inside me, just to cause confusion. So to test if a morph is the tile palette we actually have to do nasty things like 
((self ownerThatIsA: ScratchViewerMorph) notNil) ifTrue: [
so watch out for that.
!

Morph subclass: #ScratchWorkpaneMorph
	instanceVariableNames: 'workPane titlePane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!

!ScratchWorkpaneMorph commentStamp: 'EMP 7/14/2017 10:10' prior: 0!
I hold the workPane and titlePane for the ScratchFrameMorph, to prevent it from having to draw everything, or having to compute bounds multiple times while drawing.!

