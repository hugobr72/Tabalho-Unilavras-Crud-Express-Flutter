const { getService, postService, putService, deleteService } = require('../services/clienteService')

const getController = async (req, res) => {
  const serviceGet = await getService();
  return res.status(200).json(serviceGet)
}

const postController = async (req, res) => {
  if (!req.body) {
    res.status(400).json({ "error": "body sem dados!" })
    return
  }

  const resService = await postService(req.body)
  return res.status(200).json(resService)
}

const putController = async (req, res) => {
  if (!req.body.id) {
    res.status(400).json({ "error": "ID não informado!" })
    return
  }

  const putResService = await putService(req.body)
  return res.status(200).json(putResService)
}

const deleteController = async (req, res) => {
  if (!req.body.id) {
    res.status(400).json({ "error": "ID não informado!" })
    return
  }

  const deleteResService = await deleteService(req.body.id)
  return res.status(200).json(deleteResService)
}

module.exports = { getController, postController, putController, deleteController }