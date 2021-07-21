package foo

import "text/template"

_dummy: template.Execute("supress error 'imported and not userd'", {})

#Input: {
	param2: string
	param3: string
	...
}

a: {
	in: #Input
	result:  in
}
