const Pool = require('pg').Pool
const { //aqui ubicamos las variables que se creo en el archivo donde se puso las variables de entorno
  DB_USER,
  DB_PASS,
  DB_HOST,
  DB_DBNAME,
  DB_PORT
  }=process.env
const conexion = new Pool({
  user: `${DB_USER}`,
  host: `${DB_HOST}`,
  database: `${DB_DBNAME}`,
  password: `${DB_PASS}`,
  port: `${DB_PORT}`,
})

module.exports={
    conexion
}