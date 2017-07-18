
!Color class methodsFor: '*SVG-Morphic' stamp: 'gvc 7/30/2005 10:05'!
css2NamedColors1
	"Answer a dictionary of CSS2 compliant color names to Color objects.
	First half!!"

	^Dictionary new
		at: 'aliceblue' put: (Color r: 240 g: 248 b: 255 range: 255);
		at: 'antiquewhite' put: (Color r: 250 g: 235 b: 215 range: 255);
		at: 'aqua' put: (Color r: 0 g: 255 b: 255 range: 255);
		at: 'aquamarine' put: (Color r: 127 g: 255 b: 212 range: 255);
		at: 'azure' put: (Color r: 240 g: 255 b: 255 range: 255);
		at: 'beige' put: (Color r: 245 g: 245 b: 220 range: 255);
		at: 'bisque' put: (Color r: 255 g: 228 b: 196 range: 255);
		at: 'black' put: (Color r: 0 g: 0 b: 0 range: 255);
		at: 'blanchedalmond' put: (Color r: 255 g: 235 b: 205 range: 255);
		at: 'blue' put: (Color r: 0 g: 0 b: 255 range: 255);
		at: 'blueviolet' put: (Color r: 138 g: 43 b: 226 range: 255);
		at: 'brown' put: (Color r: 165 g: 42 b: 42 range: 255);
		at: 'burlywood' put: (Color r: 222 g: 184 b: 135 range: 255);
		at: 'cadetblue' put: (Color r: 95 g: 158 b: 160 range: 255);
		at: 'chartreuse' put: (Color r: 127 g: 255 b: 0 range: 255);
		at: 'chocolate' put: (Color r: 210 g: 105 b: 30 range: 255);
		at: 'coral' put: (Color r: 255 g: 127 b: 80 range: 255);
		at: 'cornflowerblue' put: (Color r: 100 g: 149 b: 237 range: 255);
		at: 'cornsilk' put: (Color r: 255 g: 248 b: 220 range: 255);
		at: 'crimson' put: (Color r: 220 g: 20 b: 60 range: 255);
		at: 'cyan' put: (Color r: 0 g: 255 b: 255 range: 255);
		at: 'darkblue' put: (Color r: 0 g: 0 b: 139 range: 255);
		at: 'darkcyan' put: (Color r: 0 g: 139 b: 139 range: 255);
		at: 'darkgoldenrod' put: (Color r: 184 g: 134 b: 11 range: 255);
		at: 'darkgray' put: (Color r: 169 g: 169 b: 169 range: 255);
		at: 'darkgreen' put: (Color r: 0 g: 100 b: 0 range: 255);
		at: 'darkgrey' put: (Color r: 169 g: 169 b: 169 range: 255);
		at: 'darkkhaki' put: (Color r: 189 g: 183 b: 107 range: 255);
		at: 'darkmagenta' put: (Color r: 139 g: 0 b: 139 range: 255);
		at: 'darkolivegreen' put: (Color r: 85 g: 107 b: 47 range: 255);
		at: 'darkorange' put: (Color r: 255 g: 140 b: 0 range: 255);
		at: 'darkorchid' put: (Color r: 153 g: 50 b: 204 range: 255);
		at: 'darkred' put: (Color r: 139 g: 0 b: 0 range: 255);
		at: 'darksalmon' put: (Color r: 233 g: 150 b: 122 range: 255);
		at: 'darkseagreen' put: (Color r: 143 g: 188 b: 143 range: 255);
		at: 'darkslateblue' put: (Color r: 72 g: 61 b: 139 range: 255);
		at: 'darkslategray' put: (Color r: 47 g: 79 b: 79 range: 255);
		at: 'darkslategrey' put: (Color r: 47 g: 79 b: 79 range: 255);
		at: 'darkturquoise' put: (Color r: 0 g: 206 b: 209 range: 255);
		at: 'darkviolet' put: (Color r: 148 g: 0 b: 211 range: 255);
		at: 'deeppink' put: (Color r: 255 g: 20 b: 147 range: 255);
		at: 'deepskyblue' put: (Color r: 0 g: 191 b: 255 range: 255);
		at: 'dimgray' put: (Color r: 105 g: 105 b: 105 range: 255);
		at: 'dimgrey' put: (Color r: 105 g: 105 b: 105 range: 255);
		at: 'dodgerblue' put: (Color r: 30 g: 144 b: 255 range: 255);
		at: 'firebrick' put: (Color r: 178 g: 34 b: 34 range: 255);
		at: 'floralwhite' put: (Color r: 255 g: 250 b: 240 range: 255);
		at: 'forestgreen' put: (Color r: 34 g: 139 b: 34 range: 255);
		at: 'fuchsia' put: (Color r: 255 g: 0 b: 255 range: 255);
		at: 'gainsboro' put: (Color r: 220 g: 220 b: 220 range: 255);
		at: 'ghostwhite' put: (Color r: 248 g: 248 b: 255 range: 255);
		at: 'gold' put: (Color r: 255 g: 215 b: 0 range: 255);
		at: 'goldenrod' put: (Color r: 218 g: 165 b: 32 range: 255);
		at: 'gray' put: (Color r: 128 g: 128 b: 128 range: 255);
		at: 'grey' put: (Color r: 128 g: 128 b: 128 range: 255);
		at: 'green' put: (Color r: 0 g: 128 b: 0 range: 255);
		at: 'greenyellow' put: (Color r: 173 g: 255 b: 47 range: 255);
		at: 'honeydew' put: (Color r: 240 g: 255 b: 240 range: 255);
		at: 'hotpink' put: (Color r: 255 g: 105 b: 180 range: 255);
		at: 'indianred' put: (Color r: 205 g: 92 b: 92 range: 255);
		at: 'indigo' put: (Color r: 75 g: 0 b: 130 range: 255);
		at: 'ivory' put: (Color r: 255 g: 255 b: 240 range: 255);
		at: 'khaki' put: (Color r: 240 g: 230 b: 140 range: 255);
		at: 'lavender' put: (Color r: 230 g: 230 b: 250 range: 255);
		at: 'lavenderblush' put: (Color r: 255 g: 240 b: 245 range: 255);
		at: 'lawngreen' put: (Color r: 124 g: 252 b: 0 range: 255);
		at: 'lemonchiffon' put: (Color r: 255 g: 250 b: 205 range: 255);
		at: 'lightblue' put: (Color r: 173 g: 216 b: 230 range: 255);
		at: 'lightcoral' put: (Color r: 240 g: 128 b: 128 range: 255);
		at: 'lightcyan' put: (Color r: 224 g: 255 b: 255 range: 255);
		at: 'lightgoldenrodyellow' put: (Color r: 250 g: 250 b: 210 range: 255);
		yourself! !
