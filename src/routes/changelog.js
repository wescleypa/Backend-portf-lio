const express = require('express');
const router = express.Router();
const controller = require('../controllers/changelog');

router.post('/get', controller.get);
router.post('/add', controller.add);

module.exports = router;