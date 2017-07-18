
!Integer methodsFor: '*cryptography-core' stamp: 'len 11/14/2002 11:51'!
inverseModulo: n
	"Answer the inverse of the receiver modulus n. That is, the integer y such that (self * y) \\ n is 1. Both self and n must be positive, and it is assumed that self < n and that n is integer."
	"Details: Use the extended Euclidean algorithm, Schneier, p. 247."

	| v u k u1 u2 u3 t1 t2 t3 tmp |
	((self <= 0) or: [n <= 0]) ifTrue: [self error: 'number and modulo must be greater than zero'].
	self >= n ifTrue: [self error: 'number must be < modulo'].

	v := self.
	u := n.
	k := 0.
	[self even and: [n even and: [u > 0]]] whileTrue: [  "eliminate common factors of two"
		k := k + 1.
		u := u bitShift: -1.
		v := v bitShift: -1].

	u1 := 1. u2 := 0. u3 := u.
	t1 := v. t2 := u - 1. t3 := v.
	[	[u3 even ifTrue: [
			((u1 odd) or: [u2 odd]) ifTrue: [
				u1 := u1 + v.
				u2 := u2 + u].
			u1 := u1 bitShift: -1.
			u2 := u2 bitShift: -1.
			u3 := u3 bitShift: -1].
		((t3 even) or: [u3 < t3]) ifTrue: [
			tmp := u1. u1 := t1. t1 := tmp.
			tmp := u2. u2 := t2. t2 := tmp.
			tmp := u3. u3 := t3. t3 := tmp].
		u3 even and: [u3 > 0]] whileTrue: ["loop while u3 is even"].

		[((u1 < t1) or: [u2 < t2]) and: [u1 > 0]] whileTrue: [
			u1 := u1 + v.
			u2 := u2 + u].
	
		u1 := u1 - t1.
		u2 := u2 - t2.
		u3 := u3 - t3.
		t3 > 0] whileTrue: ["loop while t3 > 0"].

	[u1 >= v and: [u2 >= u]] whileTrue: [
		u1 := u1 - v.
		u2 := u2 - u].

	u1 := u1 bitShift: k.
	u2 := u2 bitShift: k.
	u3 := u3 bitShift: k.

	u3 = 1 ifFalse: [self error: 'no inverse'].
	^ u - u2! !
