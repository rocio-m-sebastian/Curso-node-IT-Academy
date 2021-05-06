const { exec } = require('child_process');
const homedir = require('os').homedir();

const listFiles = () => {
    process.chdir(homedir);
    exec('dir', (err, stdout, stderr)=> {
        if(err) {
            console.error(err);
            return;
        };

        if (stderr) {
            console.error(stderr);
            return;
        }

        console.log(stdout);
    });
}

listFiles();