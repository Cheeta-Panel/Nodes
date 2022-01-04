const fs = require('fs');
const { exec } = require('child_process');


if (!fs.existsSync('~/cheeta-panel') || fs.existsSync('~/cheeta-panel/logs')) { 
    exec('mkdir ~/cheeta-panel')
    exec('mkdir ~/cheeta-panel/logs')
}

try {
    console.log('Starting Cheeta-Panel Wings')
    exec('node api.js', (err, stdout, stderr) => {
        if (err) {
            console.log(`${err}`)
            fs.writeFileSync('~/cheeta-panel/logs/cheeta-panel.log', `${err}`)
        }
    })
} catch (e) {
    console.log('Please view the ~/cheeta-panel/logs/cheeta-panel.log file for more information')
    fs.writeFileSync('~/cheeta-panel/logs/cheeta-panel.log', `${e}`)
}
