const util = require('util');
const fs = require('fs');
const leerArchivo = util.promisify(fs.readFile);
const leerDir = util.promisify(fs.readdir);
const escribirArchivo = util.promisify(fs.writeFile);
const { join } = require("path");
const inbox = join(__dirname, "inbox");
const outbox = join(__dirname, "outbox");

const reverseText = str =>
  str
  .split("")
  .reverse()
  .join("");

async function main() {
  const files = await leerDir(inbox);

  for (const file of files) {
    const data = await leerArchivo(join(inbox, file), 'utf-8')
    const archivoNuevo =  await escribirArchivo(join(outbox, file), reverseText(data))
  }
}

main();


