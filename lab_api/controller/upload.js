const path = require('path');

const { response } = require("express");
const cloudinary = require('cloudinary').v2
cloudinary.config(process.env.CLOUDINARY_URL) // para que sepa que usuario lo esta utilizando

// const { subirArchivo } = require("../helpers/subir-archivo");

var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");





const actualizarImagenCloudinary = async (req = request, res = response) => {

    const { coleccion, id } = req.params;

    let modelo;

    if (coleccion == 'usuarios') {
        modelo = await db.collection(coleccion).findOne({ usuarioId: parseInt(id) });

        if (!modelo) {
            return res.status(404).json({
                msg: `El id ${id} no se encontro en ${coleccion}`
            })
        }
        if (modelo.img) {
            const pathArr = modelo.img.split('/');
            const nombre = pathArr[pathArr.length - 1];
            const [public_id] = nombre.split('.');
            cloudinary.uploader.destroy(public_id);

        }

        const { archivo } = req.files
        const { tempFilePath } = archivo;
        const { secure_url } = await cloudinary.uploader.upload(tempFilePath);
        modelo.img = secure_url;
        db.collection(coleccion).updateOne({ usuarioId: { $eq: parseInt(id) } }, { $set: modelo });

        return res.json({
            msg: 'excelente',
            modelo
        });
    }
    if (coleccion == 'categorias') {
        modelo = await db.collection(coleccion).findOne({ categoriaId: parseInt(id) });

        if (!modelo) {
            return res.status(404).json({
                msg: `El id ${id} no se encontro en ${coleccion}`
            })
        }
        if (modelo.img) {
            const pathArr = modelo.img.split('/');
            const nombre = pathArr[pathArr.length - 1];
            const [public_id] = nombre.split('.');
            cloudinary.uploader.destroy(public_id);

        }

        const { tempFilePath } = req.files.archivo;
        const { secure_url } = await cloudinary.uploader.upload(tempFilePath);
        modelo.img = secure_url;
        db.collection(coleccion).updateOne({ categoriaId: { $eq: parseInt(id) } }, { $set: modelo });
        return res.json({
            msg: 'excelente',
            modelo
        });
    }
    if (coleccion == 'libros') {
        modelo = await db.collection(coleccion).findOne({ libroId: parseInt(id) });

        if (!modelo) {
            return res.status(404).json({
                msg: `El id ${id} no se encontro en ${coleccion}`
            })
        }
        if (modelo.img) {
            const pathArr = modelo.img.split('/');
            const nombre = pathArr[pathArr.length - 1];
            const [public_id] = nombre.split('.');
            cloudinary.uploader.destroy(public_id);

        }

        const { tempFilePath } = req.files.archivo;
        const { secure_url } = await cloudinary.uploader.upload(tempFilePath);
        modelo.img = secure_url;
        db.collection(coleccion).updateOne({ libroId: { $eq: parseInt(id) } }, { $set: modelo });
        return res.json({
            msg: 'excelente',
            modelo
        });
    }

}


const mostrarImagen = async (req, res) => {
    const { coleccion, id } = req.params;
    let modelo;
    switch (coleccion) {
        case 'usuarios':
            modelo = await db.collection(coleccion).findOne({ usuarioId: parseInt(id) });
            if (!modelo) {
                return res.status(404).json({
                    msg: `El id ${id} no se encontro en ${coleccion}`
                })
            }
            break;
        case 'categorias':
            modelo = await db.collection(coleccion).findOne({ categoriaId: parseInt(id) });
            if (!modelo) {
                return res.status(404).json({
                    msg: `El id ${id} no se encontro en ${coleccion}`
                })
            }
            break;
        case 'libros':
            modelo = await db.collection(coleccion).findOne({ libroId: parseInt(id) });
            if (!modelo) {
                return res.status(404).json({
                    msg: `El id ${id} no se encontro en ${coleccion}`
                })
            }
            break;

        default:
            res.status(500).json({ msg: 'Se me olvido activibar' })
            break;
    }

    if (modelo.img) {

        return res.json({
            img: modelo.img
        });

    }
    const pathNotFound = path.join(__dirname, '../assets', 'no-image.jpg');
    res.sendFile(pathNotFound);

}


module.exports = {
    actualizarImagenCloudinary,
    mostrarImagen
}