
!Object methodsFor: '*JSON' stamp: 'Igor.Stasenko 1/9/2010 16:18'!
asJsonString

	^ String streamContents: [:str |
		self jsonWriteOn: str ]! !
