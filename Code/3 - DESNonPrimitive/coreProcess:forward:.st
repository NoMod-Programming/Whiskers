

!DESNonPrimitive methodsFor: 'encryption/decryption' stamp: 'hmm 10/2/2006 21:30'!

coreProcess: anInteger forward: aBoolean

	| rLast lLast rCurrent rXored rSBoxed rPermuted |

	lLast := anInteger bitShift: -32.

	rLast := anInteger bitAnd: 16rFFFFFFFF.

	1 to: 16 do: [:i |

		rCurrent := EBitSelectionTable permute: rLast.

		rXored := rCurrent bitXor: (k at: (aBoolean ifTrue: [i] ifFalse: [17-i])).

		rSBoxed := self applyToSBoxes: rXored.

		rPermuted := P permute: rSBoxed.

		rCurrent := rPermuted bitXor: lLast.

		lLast := rLast.

		rLast := rCurrent].

	^lLast + (rLast bitShift: 32)! !

