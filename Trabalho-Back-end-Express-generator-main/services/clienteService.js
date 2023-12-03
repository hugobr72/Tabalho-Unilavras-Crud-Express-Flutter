const connection = require("../configs/Db")
const Cliente = require('../models/modelCliente')
const { getAllClientes, updateClientes, insertClientes, deleteClientes } = require('../middlewares/midClientes')

const getService = async () => {

  try {
    const queryAll = 'SELECT * FROM cliente'
    let resService = await getAllClientes(queryAll)
    return resService
  } catch (error) {
    console.log(error)
    return { error: "Erro do servidor" }
  }
}



const postService = async (body) => {
  try {

    const cliente = Cliente;
    cliente.nome = body.nome
    cliente.idade = body.idade
    cliente.email = body.email
    cliente.sobrenome = body.sobrenome
    if (!cliente.nome || !cliente.idade || !cliente.email) {
      return { error: "Parâmetros incorretos ou sem parâmetros" }
    }
    console.log(body)

    const queryInsert = `INSERT INTO cliente (nome, sobrenome ,email, idade) VALUE ('${cliente.nome}', '${cliente.sobrenome}','${cliente.email}' , ${cliente.idade})`;
    const resultPost = await insertClientes(queryInsert);
    console.log(resultPost);
    return resultPost;

  } catch (error) {
    console.log(error)
    return { error: "Erro do servidor" }
  }
}


const putService = async (body) => {
  try {
    if (!body.email || !body.idade) {
      return { error: "Email ou Idade não informado" }
    }
    let queryUpdate;
    if (body.email && body.idade) {
      queryUpdate = `UPDATE cliente
      SET idade = ${body.idade}, email = '${body.email}'
      WHERE id = ${body.id};`
    } else if (body.email) {
      queryUpdate = `UPDATE cliente
      SET  email = '${body.email}'
      WHERE id = ${body.id};`
    } else {
      queryUpdate = `UPDATE cliente
      SET idade = ${body.idade} WHERE id = ${body.id};`
    }

    const resultPut = await updateClientes(queryUpdate)
    return resultPut
  } catch (error) {
    console.log(error)
    return { error: "Erro do servidor" }
  }

}


const deleteService = async (id) => {
  const queryDelete = `DELETE FROM cliente WHERE id = ${id};`
  let resultDelete;
  try {
    resultDelete = await deleteClientes(queryDelete)
  } catch (error) {
    console.log(error)
    resultDelete = { error: "Erro ao deletar Cliente" }
  }
  return resultDelete
}


module.exports = { getService, postService, putService, deleteService }