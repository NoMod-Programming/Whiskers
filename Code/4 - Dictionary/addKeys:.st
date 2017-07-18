
!Dictionary methodsFor: 'adding' stamp: 'EMP 7/17/2017 15:32'!
addKeys: aCollection
	aCollection do: [:key | self at: key put: 0].! !
