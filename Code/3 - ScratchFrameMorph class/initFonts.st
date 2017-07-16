
!ScratchFrameMorph class methodsFor: 'scratch skin' stamp: 'EMP 7/13/2017 11:12'!
initFonts
	"self initFonts"

	| fontSpecs fonts fontsXO |
	fontSpecs := #(
		(Arg						Verdana		10	HelveticaMedium 14)
		(Label			VerdanaBoldNarrowSpace	10	Helvetica		18)
		(MenuTitle					VerdanaBold		12	ArialBold		16)
		(MenuItem					Verdana		11	Arial		14)
		(Button						VerdanaBold		10	ArialBold		16)
		(Category					VerdanaBold		10	ArialBold		16)
		(Tab						VerdanaBold		11	ArialBold		16)
		(CommentBlock				Verdana		10	Verdana		14)
		(TalkBubble					VerdanaBold		13	VerdanaBold	18)
		(ToolTip						Verdana		13	ArialBold		16)
		(ReporterToolTip				Verdana		14	ArialBold		16)
		(XYReadout					Verdana		10	Arial			14)
		(XYReadoutBold				VerdanaBold		10	ArialBold		14)
		(CostumesPage				VerdanaBold		11	ArialBold		14)
		(SoundsPage					VerdanaBold		11	ArialBold		14)
		(ViewerPage				VerdanaBold		11	ArialBold		14)
		(UpdatingStringField			VerdanaBold		11	VerdanaBold		14)
		(Watcher					VerdanaBold		10	ArialBold		14)
		(WatcherLarge				VerdanaBold		14	VerdanaBold		14)

		(PaintUtilityButton			VerdanaBold		10	ArialBold		16)
		(PaintSetRotationCenter		VerdanaBold		11	ArialBold		14)

		"Library"
		(LibraryItemName			VerdanaBold		9	ArialBold		14)
		(LibraryItemInfo			Verdana		6	Verdana		10)
		(MediaItemInfo				Verdana		9	Arial			14)

		"Dialog Boxes"
		(DialogBoxTitle				VerdanaBold		14	VerdanaBold		16)
		(DialogBoxMessage			VerdanaBold		13	VerdanaBold		16)
		(DialogBoxButton			VerdanaBold		11	VerdanaBold		16)
		(ProjectNotes				Verdana		10	Verdana		12)
		(LinkMorphDefault			VerdanaBold		10	VerdanaBold		12)
		(ShareLink					VerdanaBold		13	VerdanaBold		12)
		(SoundRecorderButton		VerdanaBold		13	VerdanaBold		12)
		(SoundRecorderTimer		NewYorkBold	10	NewYorkBold	12)
		(StringDialogTypeIn			Verdana		12	Verdana		16)
		(NewVariableDialogBox		Verdana		11	Verdana		14)
		(AboutScratch				VerdanaBold		11	VerdanaBold		14)
		(UploadTagLabel				VerdanaBold		10	VerdanaBold		12)
		(UploadTag					Verdana		10	Verdana		12)
		(UploadDialogLabel			VerdanaBold		10	VerdanaBold		12)
		(UploadDialogContents		Verdana		10	Verdana		12)
		(UploadDialogComment		Verdana		10	Verdana		12)

		"File Choosers"
		"This is the for the folder shortcuts in the file dialog"
		(FolderShortcut				Verdana		11	Verdana		14)
		(FileChooserNewFileTitle		VerdanaBold		10	VerdanaBold		14)
		(FileChooserNewFilename		Verdana		10	Verdana		12)
		(FileChooserLabel			VerdanaBold		10	VerdanaBold		14)
		(FileChooserContents			Verdana		12	Verdana		12)
		(FileChooserComment			Verdana		10	Verdana		12)
		(FilePickerDirectoryName	VerdanaBold		9	VerdanaBold		12)
		(FilePickerEntry				Verdana		11	Verdana		13)
		(FilePickerEntryHighlighted	VerdanaBold		11	VerdanaBold		13)

		(FrameMorphProjectTitle		VerdanaBold		13	ArialBold		16)
	).

	fonts := Dictionary new.
	fontsXO := Dictionary new.
	self buildVerdanaFonts.
	fontSpecs do: [:r |
		fonts at: (r at: 1) put: (StrikeFont familyName: (r at: 2) pointSize: (r at: 3)).
		fontsXO at: (r at: 1) put: (StrikeFont familyName: (r at: 4) pointSize: (r at: 5))].

	"We keep the base fonts in FontDefaults and (re)build Fonts after each setLanguage: to specialise the fonts actually used"
	FontDefaults := fonts.
	FontsXO := fontsXO.
	self setupFontsPlain "make sure the Fonts is set up to allow startup"
! !
