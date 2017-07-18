
!MultilineStringMorph methodsFor: 'private' stamp: 'EMP 7/17/2017 16:08'!
replaceTabs: aString
	"Answer a copy of the given UTF32 with each tab replaced by four spaces and all non-printing characters except spaces and line ends removed. Covert LF's to CR's."

	| tab lf cr space |
	<pragma: #i18nIssue>
	tab := Character tab.
	lf := Character lf.
	cr := Character cr.
	space := Character space.
	
	^String streamContents:[:strm|
	aString asString do: [:ch |
		ch < space
			ifTrue: [ "non-printing"
				ch = tab ifTrue: [strm nextPutAll: '    '].
				(ch = cr) | (ch = lf) ifTrue: [strm nextPut: cr]]
			ifFalse: [
				strm nextPut: ch]]]
! !
