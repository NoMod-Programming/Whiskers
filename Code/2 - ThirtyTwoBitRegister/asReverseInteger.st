
!ThirtyTwoBitRegister methodsFor: '*cryptography-core-accessing' stamp: 'DSM 1/20/2000 17:17'!
asReverseInteger
	"Answer the byte-swapped integer value of my current contents."

	^ ((low bitAnd: 16rFF) bitShift: 24) +
       ((low bitAnd: 16rFF00) bitShift: 8) +
	  ((hi bitAnd: 16rFF) bitShift: 8) +
       (hi bitShift: -8)
! !
