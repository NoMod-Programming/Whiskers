
!String methodsFor: '*cryptography-asn1' stamp: 'CamilloBruni 5/25/2012 18:14'!
padLeftTo: length with: char
	^ (String new: (length - self size max: 0) withAll: char) , self.! !
