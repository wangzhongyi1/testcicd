const http = require('http');

const service = http.createServer((req, res) => {
    console.log(req.url);
    res.end(JSON.stringify({name: 'wzy', age: 18}))
});

service.listen(3000, () => {
    console.log('service is running 3000 port');
});
