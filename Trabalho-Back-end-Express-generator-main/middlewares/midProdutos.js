const connection = require('../configs/Db');

const getAllProdutos = async (query) => {
  let resService = await connection.promise().query(
    query
  ).then(([rows, fields]) => {
    return rows
  }).catch();
  console.log(resService)
  return resService
}

const insertProdutos = async (query) => {
  const resultPost = await connection.promise().query(
    query
  ).then(([rows, fields]) => {
    return rows.affectedRows > 0 ? { msg: "Produto cadastrado com sucesso" } : { error: "Produto não foi cadastrado" }
  }).catch();

  return resultPost;
}
const updateProduto = async (query) => {
  const resultPut = await connection.promise().query(
    query
  ).then(([rows, fields]) => {
    return rows.affectedRows > 0 ? { msg: "Produto atualizado com sucesso" } : { error: "Produto com id não encontrado!" }
  }).catch();



  return resultPut

}
const deleteProduto = async (query) => {
  const resultDelete = await connection.promise().query(
    query
  ).then(([rows, fields]) => {
    return rows.affectedRows > 0 ? { msg: "Produto deletado com sucesso" } : { error: "Produto não encontrado!" }
  }).catch();


  return resultDelete
}

module.exports = {
  getAllProdutos,
  insertProdutos,
  updateProduto,
  deleteProduto
}