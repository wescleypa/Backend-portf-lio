const express = require('express');
const router = express.Router();
const changelog = require('./changelog');
const config = require('./config');
const hardskills = require('./hardskills');

router.use('/changelog', changelog);
router.use('/config', config);
router.use('/hardskills', hardskills);

module.exports = router;

