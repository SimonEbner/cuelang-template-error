package foo

import "text/template"

#Input: {
	param2: string
	param3: string
	...
}

a: {
	in: #Input
	result:  template.Execute("test", in)
}
