const Pool = require('pg').Pool
const conexion = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'quichuashimi',
  password: 'root',
  port: 5432,
})

module.exports={
    conexion
}