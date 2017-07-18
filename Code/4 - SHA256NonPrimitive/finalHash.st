
!SHA256NonPrimitive methodsFor: 'accessing' stamp: 'ul 3/6/2008 03:18'!
finalHash
	"Concatenate the final totals to build the 256-bit integer result."

	^ ((totalA asInteger bitShift: 224) +
	  (totalB asInteger bitShift: 192) +
	  (totalC asInteger bitShift: 160) +	
	  (totalD asInteger bitShift: 128) +
	  (totalE asInteger bitShift:  96) +
	  (totalF asInteger bitShift:  64) +
	  (totalG asInteger bitShift:  32) +
	  (totalH asInteger)) asByteArrayOfSize: 32.! !
