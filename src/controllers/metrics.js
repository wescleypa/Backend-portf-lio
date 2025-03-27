const pool = require('../config/db');
const logger = require('../utils/logs');

class Metrics {

  static get = async (req, res) => {
    try {
      console.log('bateu')
      const [results] = await pool.execute('SELECT * FROM metrics', []);
      console.log(results)
      res.status(200).json(results);
    } catch(err) {
      res.status(400).json(err);
    }
  };

  static update = async (req, res) => {
    try {
      const [results] = pool.execute('SELECT * FROM metrics', []);
      res.status(200).json(results);
    } catch(err) {
      res.status(400).json(err);
    }
  };

  static add = async (req, res) => {
    try {
      const { title, description } = req.body;

      if (!title || !description) {
        return res.status(400).json({ error: 'Title and description are required' });
      }

      const result = pool.execute('INSERT INTO changelog (title, description) VALUES (?, ?)', [title, description]);

      logger.info(`[CHANGELOG] Atualizado - ${title}: ${description}`);
      res.status(200).json({ message: 'Changelog atualizado com sucesso', result });
    } catch(err) {
      logger.error(err);
      res.status(400).json(err);
    }
  };

};

module.exports = Metrics;