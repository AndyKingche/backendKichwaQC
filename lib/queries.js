const {conexion} = require('../db/db-pg');

const getPalabras = (request, response) => {
    conexion.query('SELECT * FROM palabras ORDER BY id ASC', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }


  const getVoice = (request, response) => {
    conexion.query('SELECT * FROM voice_recognition', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }
  const getVoiceKichua = (request, response) => {
    const palabra = request.params.nombre
    console.log(palabra);
    conexion.query('SELECT palabraespanol FROM voice_recognition vc, palabras p,traductor t where p.id = vc.palabraid and t.palabra_id = p.id and vc.palabra_voice = $1',[palabra], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }
  module.exports = {
    getPalabras,
    getVoice,
    getVoiceKichua
  }