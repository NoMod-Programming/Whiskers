
!BooleanArgMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:13'!
endFormsForHeight: height
	"return my cached end-forms; if none yet exist for my height, build them"
	^EndForms at: height ifAbsent:[
		EndForms at: height put: (self drawEndFormsForHeight: height)]! !
