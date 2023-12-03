const connection = require("../configs/Db")
const Produto = require('../models/modelProducts')
const { getAllProdutos, insertProdutos, updateProduto, deleteProduto } = require('../middlewares/midProdutos')
const getService = async () => {

  try {
    const query = 'SELECT * FROM produtos'
    
    let resService = await getAllProdutos(query)
    return resService
  } catch (error) {
    console.log(error)
    return { error: "Erro do servidor" }
  }

}


const postService = async (body) => {

  try {
    const produto = Produto;
    produto.nome = body.nome;
    produto.descricao = body.descricao;
    produto.preco = body.preco;

    if (!produto.nome || !produto.descricao || !produto.preco) {
      return { error: "Parâmetros incorretos ou sem parâmetros" }
    }

    const queryInsert = `INSERT INTO produtos (nome, descricao, preco, data_atualizado) VALUE ('${produto.nome}' ,'${produto.descricao}' ,'${produto.preco}' ,${produto.data_atualizacao}  )`

    const resultPost = await insertProdutos(queryInsert)
    return resultPost
  } catch (error) {
    console.log(error)
    return { error: "Erro do servidor" }
  }


}

const putService = async (body) => {

  try {
    const queryUpdate = `UPDATE produtos
    SET preco = ${body.preco}
    WHERE id = ${body.id};`
    const resultPut = await putService(queryUpdate)
    return resultPut
  } catch (error) {
    console.log(error)
    return { error: "Erro do servidor" }
  }


}
const deleteService = async (id) => {

  const queryDelete = `DELETE FROM produtos WHERE id = ${id};`
  let resultDelete;
  try {
    resultDelete = await deleteProduto(queryDelete)
  } catch (error) {
    console.log(error)
    resultDelete = { error: "Erro ao deletar produto" }
  }
  return resultDelete
}
module.exports = { getService, postService, putService, deleteService }