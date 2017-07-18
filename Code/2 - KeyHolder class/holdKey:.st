
!KeyHolder class methodsFor: 'instance creation' stamp: 'RJT 2/9/2007 11:10'!
holdKey: aKey
	"store a key scrambled in memory"
	^self new
		data: (KeyHolderData new);
		encryptKey: aKey;
		randomChangeLoop;
		yourself! !
