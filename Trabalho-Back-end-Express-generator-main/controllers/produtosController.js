const { getService, postService, putService, deleteService } = require("../services/produtosService")
const getController = async (req, res) => {

  const resService = await getService()

  console.log(resService)
  if (resService == "error") {
    res.status(500).json({ "error": "Ocorreu um erro de servidor!" })
    return
  }

  res.status(200).json(resService)
}

const postController = async (req, res) => {

  if (!req.body) {
    res.status(400).json({ "error": "body sem dados!" })
    return
  }
  const servicePost = await postService(req.body)

  res.status(200).json(servicePost)
}

const putController = async (req, res) => {

  console.log(req.body)
  if (!req.body.id) {
    return res.status(400).json({ "error": "Id não informado para fazer update no preço!" })
  }

  const PutResult = await putService(req.body)

  res.status(200).json(PutResult)
}

const deleteController = async (req, res) => {

  if (!req.body.id) {
    return res.status(400).json({ "err": "Id não informado" });
  }

  const deleteResult = await deleteService(req.body.id);
  res.status(200).json(deleteResult);
}

module.exports = { getController, postController, putController, deleteController }