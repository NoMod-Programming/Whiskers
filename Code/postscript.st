ArgMorph removeSelector: #borderColor!
BackdropEventHatMorph removeSelector: #isKeyEventHatMorph!
BackdropEventHatMorph removeSelector: #respondsToKeyEvent:!
BlockCreatorMorph removeSelector: #ddParameter:!
CommandBlockMorph removeSelector: #addCommandIcons!
BlockMorph subclass: #CommandBlockMorph
	instanceVariableNames: 'commandSpec argPermutation argMorphs titleMorph receiver selector isReporter isTimed wantsName wantsPossession numberArgFlags stopFrame'
	classVariableNames: 'CBlockBottomBarForm CBlockBottomBarWithTabsForm CBlockTopBarForms'
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
CustomReporterMorph removeSelector: #commandSpec!
DockingBarItemMorph removeSelector: #colorToUse!
ImageMedia removeSelector: #compositeForm!
ScratchMedia subclass: #ImageMedia
	instanceVariableNames: 'form rotationCenter textBox jpegBytes compositeForm savedForm svgForm'
	classVariableNames: 'JPEGPlaceholderForm'
	poolDictionaries: ''
	category: 'Scratch-Objects'!
Json initialize!
LibraryItemMorph removeSelector: #drawSubmorphsOn:!
MD5NonPrimitive initialize!
NewVariableDialog removeSelector: #message:details:font:!
ProcCallBlockMorph removeSelector: #sBlockTuple!
RandomGenerator initialize!
SHA1 initialize!
SampledSound removeSelector: #originalSamplingRate:!
ScratchBackdropChangeEvent removeSelector: #keyEvent:!
ScratchCategorySelector removeSelector: #mouseEnterDragging:!
ScratchCategorySelector removeSelector: #mouseLeaveDragging:!
ScratchCategorySelector removeSelector: #textColor!
ScratchCategorySelector removeSelector: #textColor:!
ScratchCategorySelector removeSelector: #translatedLabel!
ScratchCategorySelector removeSelector: #translatedLabel:!
ScratchFrameMorph removeSelector: #createViewModeButtonsPanel!
ScratchFrameMorph removeSelector: #hidePalette:!
ScratchFrameMorph removeSelector: #logoMorphOffset!
ScratchFrameMorph removeSelector: #updateViewModeButtons!
Morph subclass: #ScratchFrameMorph
	instanceVariableNames: 'topPane viewerPane scriptsPane stageFrame workPane titlePane libraryPane menuPanel stageButtonsPanel readoutPane logoMorph projectTitleMorph flagButton fillScreenFlag paintingInProgress projectDirectory projectName projectInfo author loginName loginPassword watcherPositions shuffledCostumeNames justSaved viewMode lastViewMode viewModeButtonsPanel toolbarPanel lastWeDoPoll workPaneWrapper stopButton'
	classVariableNames: 'AllowRemoteConnectionDialog AllowSharing DefaultNotes DefaultSprite FontDefaults Fonts FontsXO IsXO ScratchClipboard ScratchServers ScratchSkin ScratchSkinXO ShareServer ShareServerPath StartupPresentationMode SupportServer SupportServerPath TakeOverScreen UseErrorCatcher UserFontScale Version VersionDate VisibleDrives WorkpaneExtent'
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
ScratchLibraryMorph removeSelector: #buildSpriteLabel!
ScratchLibraryMorph removeSelector: #drawBackgroundOn:!
Morph subclass: #ScratchLibraryMorph
	instanceVariableNames: 'scrollPane stagePane thumbWidth itemExtent spritePane buttonPane spriteLabel topSectionHeight'
	classVariableNames: 'TitleStyle'
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
ScratchLibraryMorph initialize!
ScratchListMorph removeSelector: #asJSON!
ScratchMenuMorph removeSelector: #mouseDown:!
ScratchMenuMorph removeSelector: #mouseDownPriority!
ScratchMenuMorph removeSelector: #mouseUp:!
ScratchMenuMorph removeSelector: #popUpAt:forHand:in:!
ScratchMenuMorph removeSelector: #useSoftDropShadow!
MenuMorph subclass: #ScratchMenuMorph
	instanceVariableNames: 'font itemHeight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
Morph subclass: #ScratchPresenterMorph
	instanceVariableNames: 'frame stage stageWrapper buttons flagButton offscreenWorld mouseFocus mouseDownPoint dragOffset clickWasHandled mouseMoved lastStepTime'
	classVariableNames: 'TopStyle'
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
ScratchPresenterMorph initialize!
Object subclass: #ScratchProcess
	instanceVariableNames: 'stackFrame topBlock readyToYield errorFlag readyToTerminate answer atomicityList blockVarList scriptList ci'
	classVariableNames: 'BlockHighlightMSecs Times'
	poolDictionaries: ''
	category: 'Scratch-Execution Engine'!
ScratchScriptEditorMorph removeSelector: #addLockButton!
ScratchScriptEditorMorph removeSelector: #addNameBox!
ScratchScriptEditorMorph removeSelector: #addReadouts!
ScratchScriptEditorMorph removeSelector: #addRotationButtons!
ScratchScriptEditorMorph removeSelector: #animateRotationStyle!
ScratchScriptEditorMorph removeSelector: #deleteDeleteButton!
ScratchScriptEditorMorph removeSelector: #deleteLockButton!
ScratchScriptEditorMorph removeSelector: #deleteReadouts!
ScratchScriptEditorMorph removeSelector: #deleteRotationButtons!
ScratchScriptEditorMorph removeSelector: #deleteSprite!
ScratchScriptEditorMorph removeSelector: #drawBackgroundOn:!
ScratchScriptEditorMorph removeSelector: #getTabTop!
ScratchScriptEditorMorph removeSelector: #setRotationStyle:!
ScratchScriptEditorMorph removeSelector: #showOrHideReadouts!
ScratchScriptEditorMorph removeSelector: #toggleSpriteDraggable!
ScratchScriptEditorMorph removeSelector: #updateLockButton!
ScratchScriptEditorMorph removeSelector: #updateRotationButtonHighlight!
Morph subclass: #ScratchScriptEditorMorph
	instanceVariableNames: 'thumbnailMorph target pageViewerMorph currentCategory tabPaneMorph viewerPane topSectionHeight renderTransform'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
ScratchTabMorph removeSelector: #translatedLabel!
ScratchTabMorph removeSelector: #translatedLabel:!
ScratchTabMorph initialize!
ScratchTabPaneMorph removeSelector: #createTab:withLabel:onForm:offForm:!
ScratchTabPaneMorph removeSelector: #drawSubmorphsOn:!
ScratchTabPaneMorph removeSelector: #tab:label:!
PasteUpMorph subclass: #ScratchTabPaneMorph
	instanceVariableNames: 'targetPane currentTab lastTabAdded'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
ScratchThumbnailMorph removeSelector: #mouseMove:!
ScratchThumbnailMorph removeSelector: #mouseX!
ScratchThumbnailMorph removeSelector: #mouseY!
ScratchThumbnailMorph removeSelector: #showDirection:!
ScratchThumbnailMorph removeSelector: #startDrag:!
ImageMorph subclass: #ScratchThumbnailMorph
	instanceVariableNames: 'target lastUpdateMSecs xreadout yreadout'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
ScratchTitlePaneMorph initialize!
ScratchVariable removeSelector: #name!
ScratchVariable removeSelector: #name:!
ScratchVariable removeSelector: #value!
ScratchVariable removeSelector: #value:!
ScratchViewerMorph removeSelector: #drawBackgroundOn:!
ScratchViewerMorph removeSelector: #rebuildCategorySelectors!
Morph subclass: #ScratchViewerMorph
	instanceVariableNames: 'topSectionHeight target pageViewer currentCategory catButtonsExtent categoryButtons'
	classVariableNames: 'CatList'
	poolDictionaries: ''
	category: 'Scratch-UI-Panes'!
ScratchViewerMorph initialize!
ScratchWorkpaneMorph removeSelector: #drawSubmorphsOn:!
ScriptableScratchMorph removeSelector: #getUsername!
ScriptableScratchMorph class removeSelector: #blockColorFor:!
ScrollFrameMorph removeSelector: #angle!
ScrollFrameMorph removeSelector: #containsPoint:!
ScrollFrameMorph removeSelector: #drawSubmorphsOn:!
ScrollFrameMorph removeSelector: #grabTransform!
ScrollFrameMorph removeSelector: #invalidRect:from:!
ScrollFrameMorph removeSelector: #layoutBounds!
ScrollFrameMorph removeSelector: #localSubmorphBounds!
ScrollFrameMorph removeSelector: #localVisibleSubmorphBounds!
ScrollFrameMorph removeSelector: #offset!
ScrollFrameMorph removeSelector: #offset:!
ScrollFrameMorph removeSelector: #privateFullMoveBy:!
ScrollFrameMorph removeSelector: #scale!
ScrollFrameMorph removeSelector: #scale:!
ScrollFrameMorph removeSelector: #smoothing!
ScrollFrameMorph removeSelector: #smoothing:!
ScrollFrameMorph removeSelector: #submorphBounds!
ScrollFrameMorph removeSelector: #transformFrom:!
BorderedMorph subclass: #ScrollFrameMorph
	instanceVariableNames: 'contents hScrollbar vScrollbar cornerMorph hbarInset vbarInset contentsChanged growthFraction transform smoothing localBounds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Support'!
SecureRandom initialize!
SmalltalkImageInstanceID initialize!
ArgMorph subclass: #SpriteArgMorph
	instanceVariableNames: 'menuIconMorph morph type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
String removeSelector: #asn1Tag!
String removeSelector: #formatASN1!
String removeSelector: #formatASN1TabLevel:!
String removeSelector: #padLeftTo:with:!
String removeSelector: #tokensBasedOn:!
DialogBoxMorph subclass: #StringDialog
	instanceVariableNames: 'typeinMorph responseArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-UI-Dialogs'!
VariableArgMorph removeSelector: #checkForDeletedMorph!
VariableArgMorph removeSelector: #clearMorphReference!
VariableArgMorph removeSelector: #isSpriteArgMorph!
ReporterBlockMorph subclass: #VariableBlockMorph
	instanceVariableNames: 'varReference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
WhenClonedEventHatMorph removeSelector: #isMouseClickEventHatMorph!
WhenClonedEventHatMorph removeSelector: #receiverName!
WhenGreaterThanHatBlockMorph removeSelector: #eventNameMatches:!
WhenGreaterThanHatBlockMorph removeSelector: #triggered!
Smalltalk removeClassNamed: #ShadowedStringMorph!
