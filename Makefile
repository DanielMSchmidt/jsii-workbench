
all: generated/python generated/java generated/csharp generated/go

generated:
	mkdir -p generated

generated/python: generated
	npx jsii-srcmak ./lib --python-outdir=$@ --python-module-name=jsii.workbench

generated/java: generated
	npx jsii-srcmak ./lib --java-outdir=$@ --java-package=jsii.workbench

generated/csharp: generated
	npx jsii-srcmak ./lib --csharp-outdir=$@ --csharp-namespace=jsii.workbench

generated/go: generated
	npx jsii-srcmak ./lib --golang-outdir=$@ --golang-module="github.com/danielmschmidt/jsii-workbench" --golang-package="workbench"

