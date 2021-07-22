import "example.com/foo"

_arg: {
	in: {
		param1: 123
		param2: "x86_64"
		param3: "xyz"
	}
}

_transform: {
	_in: [...]
	_intermediate: [ for x in _in {x & _arg}]
	out: [ for x in _intermediate {x.result}]
}

_transform & {_in: [foo.#a]}
