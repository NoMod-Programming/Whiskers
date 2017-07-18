
!DESBitPermutation class methodsFor: 'instance creation' stamp: 'hmm 12/31/2001 18:19'!
fromBitIndexes: aCollection
	"aCollection are bit indexes counting from the right, unlike the DES spec which counts from the left"
	"Example: the key permutation table for DES
	self fromBitIndexes: (#(
		57	49	41	33	25	17	9
		1	58	50	42	34	26	18
		10	2	59	51	43	35	27
		19	11	3	60	52	44	36
		63	55	47	39	31	23	15
		7	62	54	46	38	30	22
		14	6	61	53	45	37	29
		21	13	5	28	20	12	4) reverse collect: [:i | 64-i])"
	| permutation |
	permutation := self new initialize.
	aCollection doWithIndex: [:srcBit :dstBit | permutation map: srcBit to: dstBit-1].
	^permutation! !
