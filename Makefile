MAKEFLAGS += -j$(NPROCS)

all: generated/python generated/java generated/csharp generated/go docs EXAMPLE.md

.jsii: 
	jsii

generated: .jsii
	mkdir -p generated

generated/python: generated
	npx jsii-srcmak ./lib --python-outdir=$@ --python-module-name=jsii.workbench

generated/java: generated
	npx jsii-srcmak ./lib --java-outdir=$@ --java-package=jsii.workbench

generated/csharp: generated
	npx jsii-srcmak ./lib --csharp-outdir=$@ --csharp-namespace=jsii.workbench

generated/go: generated
	npx jsii-srcmak ./lib --golang-outdir=$@ --golang-module="github.com/danielmschmidt/jsii-workbench" --golang-package="workbench"

docs: .jsii
	node ./generate-docs.js

EXAMPLE.md: .jsii
	node ./generate-example.js
