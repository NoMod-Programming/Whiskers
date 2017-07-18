
!ScratchFileChooserDialog methodsFor: 'initialization' stamp: 'EMP 7/16/2017 12:50'!
createScratchFileChooserFor: aScratchFrameMorph saving: savingFlag 
	"Create a Scratch file chooser dialog box with a project thumbnail and info box."
	| labelFont contentsFont commentFont thumbnailHolder |
	scratchFrame := aScratchFrameMorph.
	readingScratchFile := savingFlag not.
	list := ScratchFilePicker new extensions: #(#scratch #sb #sb2 ).
	
	mainColumn addMorphBack: list.

	savingFlag
		ifFalse: [self title: 'Open Project'.
			list scratchInfoClient: self].

	labelFont := ScratchFrameMorph getFont: #FileChooserLabel.
	contentsFont := ScratchFrameMorph getFont: #FileChooserContents.
	commentFont := ScratchFrameMorph getFont: #FileChooserComment.

	savingFlag
		ifTrue: [self title: 'Save Project'.
			newFileTitle := StringMorph contents: 'New Filename:' localized , ' ' font: labelFont.
			newFileTitle
				color: (Color gray: 0.3);
				lock.
			newFileName := StringFieldMorph new contents: scratchFrame projectName;
						client: self;
						font: contentsFont;
						color: (Color r: 211 / 255 g: 214 / 255 b: 216 / 255);
						 width: 180.
			tabFields add: newFileName.
			newTitleBin
				addMorphBack: newFileTitle;
				addMorphBack: newFileName.
			ScratchTranslator isRTL
				ifTrue: [newTitleBin submorphs reversed
						do: [:m | m delete.
							newTitleBin addMorphBack: m]].
			mainColumn addMorphBack: newTitleBin].

	thumbnailHolder := AlignmentMorph newColumn wrapCentering: #center;
				 color: Color transparent.
	thumbnailFrameMorph := ImageFrameMorph new
				initThumbnailFrameFromForm: (ScratchFrameMorph skinAt: #dialogThumbnailFrame).
	thumbnailFrameMorph extent: 170 @ 130.
	thumbnailHolder addMorph: thumbnailFrameMorph.
	thumbnailMorph := ImageMorph new
				image: (Form extent: 160 @ 120 depth: 1).
	thumbnailFrameMorph addMorphFront: thumbnailMorph.
	fileInfoColumn addMorphBack: thumbnailHolder.

	authorLabelMorph := StringMorph contents: 'Project author:' localized font: labelFont.
	authorLabelMorph color: (Color gray: 0.3).
	fileInfoColumn addMorphBack: authorLabelMorph.

	savingFlag
		ifTrue: [authorMorph := StringFieldMorph new useStringFieldFrame; contents: ''; font: contentsFont.
			tabFields add: authorMorph]
		ifFalse: [authorMorph := StringFieldMorph new color: Color transparent;
						 borderWidth: 0;
						 contents: '';
						 isEditable: false;
						 font: contentsFont].

	fileInfoColumn addMorphBack: authorMorph.
	commentLabelMorph := StringMorph contents: 'About this project:' localized font: labelFont.
	commentLabelMorph color: authorLabelMorph color; lock.
	fileInfoColumn addMorphBack: commentLabelMorph.

	commentMorph := ScrollingStringMorph new borderWidth: 0;
				 contents: '';
				 font: commentFont;
				 extent: 210 @ 110.

	savingFlag
		ifTrue: [commentMorph backForm: (ScratchFrameMorph skinAt: #stringFieldFrame).
			tabFields add: commentMorph]
		ifFalse: [commentMorph isEditable: false].

	fileInfoColumn addMorphBack: commentMorph.
	fileInfoColumn addMorphBack: buttonRow.

	savingFlag
		ifTrue: [self scratchInfo: scratchFrame projectInfo.
			thumbnailMorph image: scratchFrame workPane thumbnailForm.
			"default author field to login name if known; else author"
			aScratchFrameMorph loginName size > 0
				ifTrue: [authorMorph contents: aScratchFrameMorph loginName]
				ifFalse: [authorMorph contents: aScratchFrameMorph author]].
			
	fileInfoColumn addMorphBack: buttonRow.
! !
