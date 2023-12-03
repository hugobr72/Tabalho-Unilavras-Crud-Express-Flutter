const express = require('express');
const router = express.Router();
const {getController, putController, postController, deleteController} = require("../controllers/clienteController")

router.get('/', getController);

router.post('/', postController);

router.put('/', putController);

router.delete('/', deleteController);


module.exports = router;
