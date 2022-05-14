const {MongoClient} = require("mongodb");
/*const { response } = require("../app");*/
const client = new MongoClient('mongodb+srv://user_node:BYxxFcvHxYohErgu@miclustercafe.kgjo7.mongodb.net/myFirstDatabase?retryWrites=true&w=majority');

client.connect().then(
    (response)=> {
        console.log('la conexion de la bd es correcta -url:'+ response.url);
    },
    (error)=>{
        console.log('error'+ error)
    }
)

module.exports = client;