
!RandomGenerator class methodsFor: 'initialize-release' stamp: 'rww 10/16/2016 07:29'!
unpredictableStringsDo: aBlock
	"Enumerate sources of information from my environment that should be generally hard to guess."
	"Values are injected into the block for SHA1 XOr randomization, then SHA256 key hashing"
	"Stale values to normalize squeak and pharo
			value: World imageForm bits compressToByteArray ;
			value: Sensor cursorPoint x asString ;
			value: Sensor cursorPoint y asString ;
			value: Display extent asString.
			value: Sensor mousePoint asString ;
	stale in pharo
		SmalltalkImage current perform: #(
			#vmVersion 
			#platformName 
			#primVmPath 
			#imageName 
			#platformSubtype 
			#vmStatisticsReportString 
			#imageName)
	stale in squeak
		SmalltalkImage current perform: #(
			#primImagePath)
	"

	| time |
	time := Time millisecondsToRun:
		[ aBlock
			value: Time millisecondClockValue asByteArray ;
			value: Date today asString ;
			value: Time now asString ;
			yourself.
		100 timesRepeat: [ aBlock value: UUID new ].
		#(version imagePath datedVersion lastQuitLogPosition) collect:
			[ : each |
			aBlock value: (SmalltalkImage current perform: each) asByteArray ] ].
	aBlock 
		value: time asByteArray;
		value: Time millisecondClockValue asByteArray! !
