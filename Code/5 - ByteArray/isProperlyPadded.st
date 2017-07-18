
!ByteArray methodsFor: '*cryptography-core' stamp: 'cmm 3/2/2006 21:14'!
isProperlyPadded
	"Verify my bytes have padding applied by #padToMultipleOf:.  The padding scheme used here is option #2 as specified by Ferguson and Schneier in 'Practical Cryptography', p. 68-69."
	| pad end start |
	pad := self last.
	end := self size.
	start := end - pad + 1.
	^ start > 0
	and: [ (start to: end) allSatisfy: [ : each | (self at: each) = pad ] ]! !
