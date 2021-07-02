const { Documentation } = require("jsii-docgen");
const reflect = require("jsii-reflect");
const path = require("path");
const fs = require("fs");

const folder = path.resolve(__dirname, "docs");
fs.mkdirSync(folder);

const ts = new reflect.TypeSystem();
ts.load(path.resolve(__dirname)).then(() => {
  function createDocs(language) {
    const docs = new Documentation({
      assembly: ts.findAssembly("jsii-workbench"),
      language: "ts",
      apiReference: true,
      readme: false,
    });

    const md = docs.render().render();
    fs.writeFileSync(
      path.resolve(folder, `${language}.md`),
      md
    );
  }

  createDocs("ts");
  createDocs("python");
});
