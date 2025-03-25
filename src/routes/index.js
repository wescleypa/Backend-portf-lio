const express = require('express');
const router = express.Router();
const changelog = require('./changelog');
const config = require('./config');
const hardskills = require('./hardskills');
const history = require('./history');
const projects = require('./projects');

router.use('/changelog', changelog);
router.use('/config', config);
router.use('/hardskills', hardskills);
router.use('/history', history);
router.use('/projects', projects);

module.exports = router;

