require('dotenv').config()
const express = require('express')
const cors = require('cors')
const db = require('./lib/queries')
const bodyParser = require('body-parser')
const app = express()
const port = process.env.port || 3000

app.use(cors());

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);


app.get('/palabras',db.getPalabras)
app.get('/voice_recognition',db.getVoice)
app.get('/voice_recognition/:nombre',db.getVoiceKichua)
app.get('/translate',db.getTraductor)
app.get('/translate/:id',db.getTraductorId)
app.post('/translate',db.createTraductor)
app.put('/translate/:id',db.updateTraductor)
app.delete('/translate/:id',db.deleteTraductor)


  app.listen(port, () => {
    console.log(`App running on port http://localhost:${port}`)
  })