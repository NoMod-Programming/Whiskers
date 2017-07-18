
!JsonObject methodsFor: 'accessing' stamp: 'rh 2/19/2010 21:34'!
at: aKey

	"make it work more like javascript objects"
	^ self at: aKey ifAbsent: [nil]! !
