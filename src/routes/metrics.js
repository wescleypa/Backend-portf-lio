const express = require('express');
const router = express.Router();
const controller = require('../controllers/metrics');

router.post('/get', controller.get);
router.post('/add', controller.add);
router.post('/update', controller.update);

module.exports = router;