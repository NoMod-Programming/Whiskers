BackdropEventHatMorph removeSelector: #isKeyEventHatMorph!
BackdropEventHatMorph removeSelector: #respondsToKeyEvent:!
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
	instanceVariableNames: 'thumbnailMorph target pageViewerMorph currentCategory tabPaneMorph viewerPane topSectionHeight'
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
ArgMorph subclass: #SpriteArgMorph
	instanceVariableNames: 'menuIconMorph morph type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Scratch-Blocks'!
WhenClonedEventHatMorph removeSelector: #isMouseClickEventHatMorph!
WhenClonedEventHatMorph removeSelector: #receiverName!
WhenGreaterThanHatBlockMorph removeSelector: #eventNameMatches:!
WhenGreaterThanHatBlockMorph removeSelector: #triggered!
