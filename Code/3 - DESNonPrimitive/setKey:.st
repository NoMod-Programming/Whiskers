

!DESNonPrimitive methodsFor: 'initialize-release' stamp: 'hmm 10/2/2006 21:29'!

setKey: anInteger

	"anInteger is a 64-bit DES key"

	"DES new setKey: 2"

	| kCurrent mask28 rot l r |

	mask28 := 16rFFFFFFF.

	kCurrent := PC1 permute: anInteger.

	l := kCurrent bitShift: -28.

	r := kCurrent bitAnd: mask28.

	k := Array new: 16.

	1 to: 16 do: [:i |

		rot := #(1	1	2	2	2	2	2	2	1	2	2	2	2	2	2	1) at: i.

		false

			ifTrue: [

				l := (l bitShift: 0-rot) + (l bitShift: 28-rot) bitAnd: mask28.

				r := (r bitShift: 0-rot) + (r bitShift: 28-rot) bitAnd: mask28]

			ifFalse: [

				l := (l bitShift: rot) + (l bitShift: rot - 28) bitAnd: mask28.

				r := (r bitShift: rot) + (r bitShift: rot - 28) bitAnd: mask28].

		kCurrent := (l bitShift: 28) + r.

		k at: i put: (PC2 permute: kCurrent)]! !

