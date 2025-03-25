const pool = require('../config/db');
const logger = require('../utils/logs');

class HardSkills {

  static get = async (req, res) => {
    try {
      const [results] = await pool.execute('SELECT  * FROM hardskills', []);
      res.status(200).json(results);
    } catch (err) {
      logger.error(err);
      res.status(400).json(err);
    }
  };

  static add = async (req, res) => {
    try {
      const requiredFields = ['title', 'description', 'icon'];
      const missingFields = requiredFields.filter(field => !req.body[field]);

      if (missingFields?.length > 0) {
        return res.status(400).json({ error: `Field${missingFields?.length > 1 ? 's' : ''} ${missingFields.join(', ')} ${missingFields.length > 1 ? 'are' : 'is'} required` });
      }

      const { title, description, icon } = req?.body;

      const result = await pool.execute('INSERT INTO hardskills (title, description, icon) VALUES (?, ?, ?)', [title, description, icon]);

      logger.info(`[HARDSKILLS] Atualizado - ${title}: ${description} <${icon}>`);
      res.status(200).json({ message: 'Hardskill adicionado com sucesso', result });
    } catch (err) {
      logger.error(err);
      res.status(400).json(err);
    }
  };

  static update = async (req, res) => {
    try {
      const { id } = req.params;
      const { title, description, icon } = req.body;

      if (!id) {
        return res.status(400).json({ error: 'ID is required' });
      }

      // Verifica quais campos foram enviados para atualização
      const fieldsToUpdate = {};
      if (title !== undefined) fieldsToUpdate.title = title;
      if (description !== undefined) fieldsToUpdate.description = description;
      if (icon !== undefined) fieldsToUpdate.icon = icon;

      // Se nenhum campo válido foi enviado
      if (Object.keys(fieldsToUpdate).length === 0) {
        return res.status(400).json({ error: 'No valid fields to update' });
      }

      // Construir a query dinamicamente
      const setClause = Object.keys(fieldsToUpdate).map(key => `${key} = ?`).join(', ');
      const values = Object.values(fieldsToUpdate);
      values.push(id); // Adiciona o ID no final para a cláusula WHERE

      const result = await pool.execute(
        `UPDATE hardskills SET ${setClause} WHERE id = ?`,
        values
      );

      logger.info(`[HARDSKILLS] Atualizado - ID ${id}: ${setClause} ${title}`);
      res.status(200).json({ message: 'Hardskill atualizado com sucesso', result });
    } catch (err) {
      logger.error(err);
      res.status(400).json(err);
    }
  };

};

module.exports = HardSkills;