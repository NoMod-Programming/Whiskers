
!BlockCreatorMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 09:55'!
argPermutationForSpec: spec withTranslation: translatedSpec
	"CommandBlockMorph argPermutationForSpec: '%a of %m of %m of %t' withTranslation: '%a de %m de %m de %t'"
	"CommandBlockMorph argPermutationForSpec: '%a of %m of %m of %t' withTranslation: '%t de %m2 de %m1 de %a'"

	| parsedSpec parsedTranslatedSpec parsedSpecArgs parsedTranslatedSpecArgs permutation a copiesSize n originalPermutation |

	parsedSpec _ CommandBlockMorph parseCommandSpec: spec.
	parsedSpecArgs _ parsedSpec select: [:s | BlockCreatorMorph isArgSpec: s].
	parsedTranslatedSpec _ CommandBlockMorph parseCommandSpec: translatedSpec.
	parsedTranslatedSpecArgs _ parsedTranslatedSpec select: [:s | BlockCreatorMorph isArgSpec: s].

	permutation _ #().
	1 to: parsedSpecArgs size do: [:i | permutation _ permutation copyWith: i].
	originalPermutation _ permutation.

	"no change"
	(parsedSpecArgs = parsedTranslatedSpecArgs) ifTrue: [
			^ originalPermutation].

	"otherwise, calculate permutation"
	1 to: parsedSpecArgs size do: [:i |
		a _ parsedSpecArgs at: i.
		copiesSize _ (parsedSpecArgs select: [:s | (s = a)]) size.
		(copiesSize = 1)
			ifTrue:[permutation at: i put: (parsedTranslatedSpecArgs indexOf: a
				ifAbsent: [Transcript show: 'Permutation failed: ', spec.
						^ originalPermutation])]
			ifFalse:["count copies until now"
				n _ ((parsedSpecArgs copyFrom: 1 to: i) select: [:s | (s = a)]) size.
				permutation at: i put: (parsedTranslatedSpecArgs indexOf: (a,n asString)
					ifAbsent: [Transcript show: 'Permutation failed: ', spec.
						^ originalPermutation])]].
^ permutation! !
