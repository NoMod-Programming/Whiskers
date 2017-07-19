
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/18/2017 16:28'!
aboutScratch
	| dialog |
	dialog := DialogBoxMorph new title: 'About Whiskers';
			
				withButtonsForYes: false
				no: false
				okay: true
				cancel: false.
	dialog message: 'Whiskers ' , Version , '

Original system Copyright © 2009 Massachusetts Institute of Technology.
NuScratch (Bug fixes and changes to support modern Squeak systems) Copyright ©2012-6 tim Rowledge.
Logo by @Penguin5664
Website by @infinitytec

This release made under the same conditions as the Scratch Source Code License.
' font: (ScratchFrameMorph getFont: #AboutScratch).
	dialog getUserResponse! !
