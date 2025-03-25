const express = require('express');
const router = express.Router();
const controller = require('../controllers/config');

router.post('/get', controller.get);
router.post('/update', controller.update);

module.exports = router;