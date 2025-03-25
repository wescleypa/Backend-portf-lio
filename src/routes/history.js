const express = require('express');
const router = express.Router();
const controller = require('../controllers/history');

router.post('/get', controller.get);
router.post('/add', controller.add);
router.post('/update/:id', controller.update);

module.exports = router;