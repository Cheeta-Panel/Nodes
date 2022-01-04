const express = require('express');
const config = require('./config.json');
const app = express();

app.get('/', (req, res) => {
    res.send({'error': 'Root requests are not premitted'})
    res.status(500)
})


app.listen(config.port, config.ip, () => {
    console.log(`The wings api is listening for requests on ${config.ip}:${config.port}`);
})