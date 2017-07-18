
!ImageMedia methodsFor: 'accessing' stamp: 'EMP 7/16/2017 11:22'!
mediaSizeInKilobytes
	"Returns the storage size of this media as a String in kilobytes, rounded to the nearest kilobyte and clipped to 2d.p."

	| bytes |
	bytes := 0.
	svgForm ifNotNil: [
	^ (svgForm asString size // 1024) asString
	].
	jpegBytes
		ifNil: [form hibernate. bytes := form bits size]
		ifNotNil: [bytes := jpegBytes size].
	self hasTextLayer ifTrue: [
		(self compositeFormForScale: 1.0) hibernate.
		bytes := bytes + compositeForm bits size].

	bytes < 1024 ifTrue: [
		 ^ (bytes / 1024) printShowingDecimalPlaces: 2].

	^( (bytes + 512) // 1024) asString
! !
