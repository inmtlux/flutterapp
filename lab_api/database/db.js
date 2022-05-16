const {MongoClient} = require("mongodb");
/*const { response } = require("../app");*/
const client = new MongoClient(process.env.MONGO_DB);
client.connect().then(
    (response)=> {
        console.log('la conexion de la bd es correcta -url:'+ response.url);
    },
    (error)=>{
        console.log('error'+ error)
    }
)

module.exports = client;