
!CTR methodsFor: 'private' stamp: 'cmm 2/20/2006 23:45'!
nextBlock
	| kSubI |
	self incrementCounter.
	kSubI := vector copy.  "as named in the book"
	cipher encryptBlock: kSubI.
	^ kSubI! !
