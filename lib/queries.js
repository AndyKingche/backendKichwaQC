const { response } = require('express');
const {conexion} = require('../db/db-pg');

const getPalabras = (request, response) => {
    conexion.query('SELECT * FROM palabras ORDER BY id ASC', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  const getTraductor= (request,response) =>{
    conexion.query('SELECT * FROM traductor ORDER BY id_traductor ASC',(err,results)=>{
      if(err){
        throw err
      }
      response.status(200).json(results.rows)
    })
  }

  const getTraductorId= (request,response) =>{
    const id = parseInt(request.params.id);

    conexion.query('SELECT * FROM traductor WHERE id_traductor =$1 ',
    [id]
    ,(err,results)=>{
      if(err){
        throw err
      }
      response.status(200).json(results.rows)
    })
  }

  const createTraductor= (request,response) =>{

    const {palabraespanol,palabra_id} = request.body;

    conexion.query('INSERT INTO traductor (palabraespanol,palabra_id)VALUES($1,$2) RETURNING*',
    [palabraespanol, parseInt(palabra_id)],
    (err,results)=>{
      if(err){
        throw err
      }
      response.status(200).send(`Agrego palabra en el Traductor: ${results.rows[0]}`);
  })
  }

  const updateTraductor= (request,response) =>{

    const id_traductor = parseInt(request.params.id);
   
    conexion.query('UPDATE traductor set palabraespanol = $1, palabra_id = $2 WHERE id_traductor = $3',
    [palabraespanol, palabra_id, id_traductor],
    (err,results)=>{
      if(err){
        throw err
      }
      response.status(200).send(`Palabra traducida modiificada: ${id_traductor}`);
  })
  }

  const deleteTraductor= (request,response) =>{

    const id_traductor = parseInt(request.params.id);

    conexion.query('DELETE FROM traductor WHERE id_traductor = $1',
    [id_traductor],
    (err,results)=>{
      if(err){
        throw err
      }
      response.status(200).send(`Palabra traducida eliminada: ${id_traductor}`);
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
    getVoiceKichua,
    getTraductor,
    updateTraductor,
    createTraductor,
    deleteTraductor,
    getTraductorId
  }