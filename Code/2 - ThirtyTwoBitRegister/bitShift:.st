
!ThirtyTwoBitRegister methodsFor: '*cryptography-core-accumulator ops' stamp: 'RJT 10/28/2005 15:42'!
bitShift: anInteger
	"Replace my contents with the bitShift of anInteger."
	self load: (self asInteger bitShift: anInteger). ! !
