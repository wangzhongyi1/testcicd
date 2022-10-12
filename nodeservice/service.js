const http = require('http');
const { execFile } = require('child_process');

const service = http.createServer((req, res) => {
    console.log(req.url);
    res.end(JSON.stringify({name: 'wzy', age: 18}));
    if (req.url === '/pullproject') {
        console.log('开始执行1.sh');
        start();
    }
});

function start() {
    execFile('./1.sh', (error, stdout, stderr) => {
        if (error) {
            console.log('出错了：', error);
            return;
        }
        console.log('stdout:', stdout);
        console.log('stderr:', stderr);
    });
}

service.listen(3000, () => {
    console.log('service is running 3000 port');
});
