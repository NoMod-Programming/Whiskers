
!ScratchSpriteMorph class methodsFor: 'block specs' stamp: 'EMP 7/14/2017 22:27'!
blockSpecs

	| blocks |
	blocks := #(
		'Motion'
			('move %n steps'				-	forward:)
			('turn %n degrees'				-	turnRight: 15)	"icon shows turn direction"
			('turn %n degrees'				-	turnLeft: 15)	"icon shows turn direction"
			-
			('point in direction %d'			-	heading: 90)
			('point towards %m'				-	pointTowards:)
			-
			('go to x:%n y:%n'				-	gotoX:y: 0 0)
			('go to %m'						-	gotoSpriteOrMouse:)
			('glide %n secs to x:%n y:%n'	t	glideSecs:toX:y:elapsed:from: 1 50 50)
			-
			('change x by %n'				-	changeXposBy: 10)
			('set x to %n'					-	xpos: 0)
			('change y by %n'				-	changeYposBy: 10)
			('set y to %n'					-	ypos: 0)
			-
			('if on edge, bounce'			-	bounceOffEdge)
			-
			('xset rotation style %r'			-	whoKnows)
			-
			('x position'						r	xpos)
			('y position'						r	ypos)
			('direction'						r	heading)
		'Pen'
			('clear'							-	clearPenTrails)
			-
			('stamp'							-	stampCostume)
			-
			('pen down'						-	putPenDown)
			('pen up'						-	putPenUp)
			-
			('set pen color to %c'			-	penColor:)
			('change pen color by %n'		-	changePenHueBy:)
			('set pen color to %n'			-	setPenHueTo: 0)
			-
			('change pen shade by %n'		-	changePenShadeBy:)
			('set pen shade to %n'			-	setPenShadeTo: 50)
			-
			('change pen size by %n'		-	changePenSizeBy: 1)
			('set pen size to %n'				-	penSize: 1)
	).

	blocks := blocks, #(
		'Looks'
			('say %s for %n secs'			t	say:duration:elapsed:from: 'Hello!!' 2)
			('say %s'						-	say: 'Hello!!')
			('think %s for %n secs'			t	think:duration:elapsed:from: 'Hmm...' 2)
			('think %s'						-	think: 'Hmm...')
			-
			('show'							-	show)
			('hide'							-	hide)
			-
			('switch to costume %l'			-	lookLike:)
			('next costume'					-	nextCostume)
			('xswitch to backdrop %b'		-	whoKnows)
			-
			('change %g effect by %n'		-	changeGraphicEffect:by: 'color' 25)
			('set %g effect to %n'			-	setGraphicEffect:to: 'color' 0)
			('clear graphic effects'			-	filterReset)
			-
			('change size by %n'			-	changeSizeBy:)
			('set size to %n%'				-	setSizeTo: 100)
			-
			('go to front'					-	comeToFront)
			('go back %n layers'			-	goBackByLayers: 1)
			-
			('costume #'					r	costumeIndex)
			('xbackdrop name'				r	whoKnows)
			('size'							r	scale)
		'Sensing'
			('touching %m?' 				b	touching:)
			('touching color %C?' 			b	touchingColor:)
			('color %C is touching %C?'		b	color:sees:)
			('distance to %m'				r	distanceTo:)
			-
			('ask %s and wait'				s	doAsk 'What''s your name?')
			('answer'						r	answer)
			-
			('key %k pressed?'				b	keyPressed: 'space')
			('mouse x'						r	mouseX)
			('mouse y'						r	mouseY)
			('mouse down?'					b	mousePressed)
			-
			('loudness'						r	soundLevel)
			-
			('video motion on this sprite'	r	whoKnows)
			('turn video on'					-	whoKnows)
			('set video transparency'		-	whoKnows)
			-
			('timer'							r	timer)
			('reset timer'					-	timerReset)
			-
			('%a of %m'						r	getAttribute:of:)
			-
			('xloud?'						b	isLoud)
			-
			('current minute'				r	whoKnows)
			('days since 2000'				r	whoKnows)
			('username'						r	whoKnows)
			~
			('%H sensor value'				r	sensor: 'slider')
			('sensor %h?'					b	sensorPressed: 'button pressed')
		).

	^ blocks, super blockSpecs
! !
