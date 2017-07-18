
!SecureRandom class methodsFor: 'instance creation' stamp: 'len 8/20/2002 01:37'!
new
	^ self key: (RandomPool default next: 64)! !
