
!WatcherMorph methodsFor: 'private' stamp: 'EMP 11/3/2017 22:29'!
layoutForViewer

	watcher removeAllMorphs.
	ScratchTranslator isRTL
		ifTrue: [watcher
			addMorphBack: (Morph new color: color; extent: 2@0);
			addMorphBack: readoutFrame;
			addMorphBack: (AlignmentMorph new color: color; width: 4; hResizing: #rigid);
			addMorphBack: titleMorph;
			addMorphBack: (Morph new color: color; extent: 3@0)]
		ifFalse: [watcher
			addMorphBack: (Morph new color: color; extent: 3@0);
			addMorphBack: titleMorph;
			addMorphBack: (AlignmentMorph new color: color; width: 4; hResizing: #rigid);
			addMorphBack: readoutFrame;
			addMorphBack: (Morph new color: color; extent: 2@0)].
! !
