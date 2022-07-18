MAKEFLAGS += -j$(NPROCS)

all: generated/python generated/java generated/csharp generated/go docs/python.md docs/java.md docs/csharp.md docs/typescript.md docs/go.md EXAMPLE.md

.jsii: 
	npx jsii

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
	mkdir -p docs

docs/python.md: docs
	npx jsii-docgen -l python -o=$@

docs/java.md: docs
	npx jsii-docgen -l java -o=$@

docs/csharp.md: docs
	npx jsii-docgen -l csharp -o=$@

docs/typescript.md: docs
	npx jsii-docgen -l typescript -o=$@

docs/go.md: docs
	npx jsii-docgen -l go -o=$@

EXAMPLE.md: .jsii
	node ./generate-example.js
