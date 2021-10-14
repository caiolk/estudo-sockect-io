const app = require('express')();
const http = require('http').createServer(app);

const io = require('socket.io')(http)

app.get('/', (req,res) => {
    res.sendFile(`${__dirname}/public/index.html`)
})
    
io.on('connection', (socket) => {
    console.log( 'new connection', socket);
})

http.listen(3000, function(){
    console.log('Listening 3000a')
} )