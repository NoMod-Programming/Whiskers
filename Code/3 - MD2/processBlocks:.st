

!MD2 methodsFor: 'accessing' stamp: 'rww 1/23/2007 17:55'!

processBlocks: data



	| buffer t |

	buffer := ByteArray new: 48 withAll: 0.

	0 to: (data size // 16) - 1 do: [:i |

		1 to: 16 do: [:j |

			buffer at: (16 + j) put: (data at: (i * 16 + j)).

			buffer at: (32 + j) put: ((buffer at: (16 + j)) bitXor: (buffer at: j))].

		t := 0.

		1 to: 18 do: [:j |

			1 to: 48 do: [:k |

				t := (buffer at: k) bitXor: (self piTable at: t + 1).

				buffer at: k put: t].

			t := (t+j-1) \\ 256]].

	^ buffer copyFrom: 1 to: 16.

! !

