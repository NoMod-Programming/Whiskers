
!Json class methodsFor: 'as yet unclassified' stamp: 'ul 11/4/2008 06:23'!
initialize
	"Json initialize."
	
	escapeArray := Array new: 128.
	(0 to: 31), #(127) do: [ :each |
		escapeArray at: each + 1 put: '\u', (each printStringHex padded: #left to: 4 with: $0) ].
	{
		$" -> '\"'.
		$\ -> '\\'.
		Character backspace -> '\b'.
		Character lf -> '\n'.
		Character newPage -> '\f'.
		Character cr -> '\r'.
		Character tab -> '\t'.
	} do: [ :each |
		escapeArray at: each key asciiValue + 1 put: each value ].
! !
