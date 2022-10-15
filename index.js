const express = require('express')
const cors = require('cors')
const db = require('./lib/queries')
const bodyParser = require('body-parser')
const app = express()
const port = 3000

app.use(cors())
app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/palabras',db.getPalabras);
app.get('/voice_recognition',db.getVoice);
app.get('/voice_recognition/:nombre',db.getVoiceKichua);

  app.listen(port, () => {
    console.log(`App running on port http://localhost:${port}`)
  })