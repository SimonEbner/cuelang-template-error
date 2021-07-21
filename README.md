Evaluting the code via
```
cue eval test.cue
```
yields the following error:
```
_in.0.in.param2: error in call to text/template.Execute: cannot convert non-concrete value string:
    ./foo/foo.cue:15:11
    ./foo/foo.cue:8:2
_in.0.in.param3: error in call to text/template.Execute: cannot convert non-concrete value string:
    ./foo/foo.cue:15:11
    ./foo/foo.cue:9:2
```

The source of the error seems to be the `#Input` definition in `foo/foo.cue`.
```
#Input: {
	param2: string
	param3: string
	...
}
```

The error doesn't occur in either of the following two variations:

1. Variation: Reducing definition

Replace `#Input` inside `foo/foo.cue` with the reduced definition `#Input{param2: string, ...}` (removing `param3`). \
Running `cue eval test.cue -c` finishes cleanly with
```
out: ["test"]
```

2. Remove template.Execute

Replace `result: template.Execute("test", in)` in `foo/foo.cue` with simply `result: in`. \
Running `cue eval test.cue -c` finishes cleanly with 
```
out: [{
    param1: 123
    param2: "x86_64"
    param3: "xyz"
}]
```
