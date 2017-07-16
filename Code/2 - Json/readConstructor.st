
!Json methodsFor: 'private' stamp: 'tonyg 4/29/2016 11:08'!
readConstructor
	| s c v ctor |
	s := WriteStream on: ''.
	[
		c := stream peek.
		c ifNil: [JsonIncompleteError signal: 'Premature EOF reading constructor name'].
		((c == $.) or: [c isLetter])
			ifTrue: [s nextPut: c. stream next]
			ifFalse: [
				v := self readAny.
				s := s contents.
				ctor := ctorMap ifNotNil: [ctor := ctorMap at: s ifAbsent: [nil]].
				ctor ifNil: [JsonInvalidError signal: 'Unknown ctor ', s].
				^ ctor constructFromJson: v]
	] repeat.
! !
