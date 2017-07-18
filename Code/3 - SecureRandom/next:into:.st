
!SecureRandom methodsFor: 'accessing' stamp: 'len 8/4/2002 00:34'!
next: anInteger into: anArray
	1 to: anInteger do: [:index | anArray at: index put: self next].
	^ anArray! !
