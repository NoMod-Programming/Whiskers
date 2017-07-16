
!Color class methodsFor: '*SVG-Morphic' stamp: 'gvc 7/30/2005 10:05'!
css2NamedColors2
	"Answer a dictionary of CSS2 compliant color names to Color objects.
	Second half!!"

	^Dictionary new
		at: 'lightgray' put: (Color r: 211 g: 211 b: 211 range: 255);
		at: 'lightgreen' put: (Color r: 144 g: 238 b: 144 range: 255);
		at: 'lightgrey' put: (Color r: 211 g: 211 b: 211 range: 255);
		at: 'lightpink' put: (Color r: 255 g: 182 b: 193 range: 255);
		at: 'lightsalmon' put: (Color r: 255 g: 160 b: 122 range: 255);
		at: 'lightseagreen' put: (Color r: 32 g: 178 b: 170 range: 255);
		at: 'lightskyblue' put: (Color r: 135 g: 206 b: 250 range: 255);
		at: 'lightslategray' put: (Color r: 119 g: 136 b: 153 range: 255);
		at: 'lightslategrey' put: (Color r: 119 g: 136 b: 153 range: 255);
		at: 'lightsteelblue' put: (Color r: 176 g: 196 b: 222 range: 255);
		at: 'lightyellow' put: (Color r: 255 g: 255 b: 224 range: 255);
		at: 'lime' put: (Color r: 0 g: 255 b: 0 range: 255);
		at: 'limegreen' put: (Color r: 50 g: 205 b: 50 range: 255);
		at: 'linen' put: (Color r: 250 g: 240 b: 230 range: 255);
		at: 'magenta' put: (Color r: 255 g: 0 b: 255 range: 255);
		at: 'maroon' put: (Color r: 128 g: 0 b: 0 range: 255);
		at: 'mediumaquamarine' put: (Color r: 102 g: 205 b: 170 range: 255);
		at: 'mediumblue' put: (Color r: 0 g: 0 b: 205 range: 255);
		at: 'mediumorchid' put: (Color r: 186 g: 85 b: 211 range: 255);
		at: 'mediumpurple' put: (Color r: 147 g: 112 b: 219 range: 255);
		at: 'mediumseagreen' put: (Color r: 60 g: 179 b: 113 range: 255);
		at: 'mediumslateblue' put: (Color r: 123 g: 104 b: 238 range: 255);
		at: 'mediumspringgreen' put: (Color r: 0 g: 250 b: 154 range: 255);
		at: 'mediumturquoise' put: (Color r: 72 g: 209 b: 204 range: 255);
		at: 'mediumvioletred' put: (Color r: 199 g: 21 b: 133 range: 255);
		at: 'midnightblue' put: (Color r: 25 g: 25 b: 112 range: 255);
		at: 'mintcream' put: (Color r: 245 g: 255 b: 250 range: 255);
		at: 'mistyrose' put: (Color r: 255 g: 228 b: 225 range: 255);
		at: 'moccasin' put: (Color r: 255 g: 228 b: 181 range: 255);
		at: 'navajowhite' put: (Color r: 255 g: 222 b: 173 range: 255);
		at: 'navy' put: (Color r: 0 g: 0 b: 128 range: 255);
		at: 'oldlace' put: (Color r: 253 g: 245 b: 230 range: 255);
		at: 'olive' put: (Color r: 128 g: 128 b: 0 range: 255);
		at: 'olivedrab' put: (Color r: 107 g: 142 b: 35 range: 255);
		at: 'orange' put: (Color r: 255 g: 165 b: 0 range: 255);
		at: 'orangered' put: (Color r: 255 g: 69 b: 0 range: 255);
		at: 'orchid' put: (Color r: 218 g: 112 b: 214 range: 255);
		at: 'palegoldenrod' put: (Color r: 238 g: 232 b: 170 range: 255);
		at: 'palegreen' put: (Color r: 152 g: 251 b: 152 range: 255);
		at: 'paleturquoise' put: (Color r: 175 g: 238 b: 238 range: 255);
		at: 'palevioletred' put: (Color r: 219 g: 112 b: 147 range: 255);
		at: 'papayawhip' put: (Color r: 255 g: 239 b: 213 range: 255);
		at: 'peachpuff' put: (Color r: 255 g: 218 b: 185 range: 255);
		at: 'peru' put: (Color r: 205 g: 133 b: 63 range: 255);
		at: 'pink' put: (Color r: 255 g: 192 b: 203 range: 255);
		at: 'plum' put: (Color r: 221 g: 160 b: 221 range: 255);
		at: 'powderblue' put: (Color r: 176 g: 224 b: 230 range: 255);
		at: 'purple' put: (Color r: 128 g: 0 b: 128 range: 255);
		at: 'red' put: (Color r: 255 g: 0 b: 0 range: 255);
		at: 'rosybrown' put: (Color r: 188 g: 143 b: 143 range: 255);
		at: 'royalblue' put: (Color r: 65 g: 105 b: 225 range: 255);
		at: 'saddlebrown' put: (Color r: 139 g: 69 b: 19 range: 255);
		at: 'salmon' put: (Color r: 250 g: 128 b: 114 range: 255);
		at: 'sandybrown' put: (Color r: 244 g: 164 b: 96 range: 255);
		at: 'seagreen' put: (Color r: 46 g: 139 b: 87 range: 255);
		at: 'seashell' put: (Color r: 255 g: 245 b: 238 range: 255);
		at: 'sienna' put: (Color r: 160 g: 82 b: 45 range: 255);
		at: 'silver' put: (Color r: 192 g: 192 b: 192 range: 255);
		at: 'skyblue' put: (Color r: 135 g: 206 b: 235 range: 255);
		at: 'slateblue' put: (Color r: 106 g: 90 b: 205 range: 255);
		at: 'slategray' put: (Color r: 112 g: 128 b: 144 range: 255);
		at: 'slategrey' put: (Color r: 112 g: 128 b: 144 range: 255);
		at: 'snow' put: (Color r: 255 g: 250 b: 250 range: 255);
		at: 'springgreen' put: (Color r: 0 g: 255 b: 127 range: 255);
		at: 'steelblue' put: (Color r: 70 g: 130 b: 180 range: 255);
		at: 'tan' put: (Color r: 210 g: 180 b: 140 range: 255);
		at: 'teal' put: (Color r: 0 g: 128 b: 128 range: 255);
		at: 'thistle' put: (Color r: 216 g: 191 b: 216 range: 255);
		at: 'tomato' put: (Color r: 255 g: 99 b: 71 range: 255);
		at: 'turquoise' put: (Color r: 64 g: 224 b: 208 range: 255);
		at: 'violet' put: (Color r: 238 g: 130 b: 238 range: 255);
		at: 'wheat' put: (Color r: 245 g: 222 b: 179 range: 255);
		at: 'white' put: (Color r: 255 g: 255 b: 255 range: 255);
		at: 'whitesmoke' put: (Color r: 245 g: 245 b: 245 range: 255);
		at: 'yellow' put: (Color r: 255 g: 255 b: 0 range: 255);
		at: 'yellowgreen' put: (Color r: 154 g: 205 b: 50 range: 255);
		yourself! !
