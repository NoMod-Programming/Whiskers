
!SVGMorph class methodsFor: 'as yet unclassified' stamp: 'gvc 10/17/2005 17:41'!
example
	"SVGMorph example"

	|s svg w|
	s := FileList2 modalFileSelectorForSuffixes: #('svg' 'svgz').
	s ifNil: [^nil].
	[svg := self fromFileStream: s]
		ensure: [s close].
	w := SystemWindow labelled: s name.
	w extent: svg extent.
	w
		addMorph: svg
		frame: (0@0 corner: 1@1);
		clipSubmorphs: true;
		openAsIs! !
