
!Integer methodsFor: '*cryptography-core' stamp: 'rww 12/7/2002 23:28'!
twosComplement
	| complement digit length |
	length := self digitLength + 1.
	complement := Integer new: length neg: false.
	1 to: length-1 do: [:index |
		digit := self digitAt: index.
		digit := digit bitXor: 16rFF.	"flip bits without 2's complement logic in bitInvert"
		complement digitAt: index put: digit].	
	self areAllBitsSet ifTrue: [complement digitAt: length put: 16rFF].
	^complement + 1! !
