const pool = require('../config/db');
const logger = require('../utils/logs');

class Changelog {

  static get = async (req, res) => {
    try {
      const [results] = await pool.execute('SELECT  * FROM config', []);
      res.status(200).json(results);
    } catch (err) {
      res.status(400).json(err);
    }
  };

  static update = async (req, res) => {
    try {
      if (!req.body || Object.keys(req.body).length === 0) {
        return res.status(400).json({ error: 'Nenhum dado enviado no body.' });
      }

      // Campos obrigatórios para INSERT (se a tabela estiver vazia)
      const requiredFields = ['title', 'description', 'name', 'label', 'contact'];
      const currentConfig = await pool.execute('SELECT * FROM config LIMIT 1');
      const hasExistingConfig = currentConfig[0].length > 0;

      // --- Se NÃO existir registro e faltar campos obrigatórios ---
      if (!hasExistingConfig) {
        const missingFields = requiredFields.filter(field => !req.body[field]);
        if (missingFields.length > 0) {
          return res.status(400).json({
            error: `Campos obrigatórios faltando: ${missingFields.join(', ')}`,
            requiredFields
          });
        }
      }

      // --- Monta a query dinâmica (UPDATE ou INSERT) ---
      let query;
      let params = [];

      if (hasExistingConfig) {
        // UPDATE: Só atualiza os campos enviados
        const fieldsToUpdate = Object.keys(req.body)
          .filter(key => req.body[key] !== undefined)
          .map(key => `${key} = ?`).join(', ');

        query = `UPDATE config SET ${fieldsToUpdate} WHERE id = 1`;
        params = Object.values(req.body).filter(val => val !== undefined);
      } else {
        // INSERT: Usa valores padrão para campos não enviados
        const allFields = [
          'title', 'description', 'name', 'label', 'presentation',
          'about', 'contact', 'github', 'youtube', 'linkedin',
          'deepseek', 'iaName', 'theme'
        ];

        const fields = [];
        const placeholders = [];

        allFields.forEach(field => {
          fields.push(field);
          placeholders.push('?');
          params.push(req.body[field] || null); // Assume NULL se não enviado
        });

        query = `INSERT INTO config (${fields.join(', ')}) VALUES (${placeholders.join(', ')})`;
      }

      // Executa a query
      const [result] = await pool.execute(query, params);
      logger.info(`[CONFIG] ${hasExistingConfig ? 'Atualizado' : 'Criado'} - ${JSON.stringify(req?.body)}`);

      res.status(200).json({
        message: `Configuração ${hasExistingConfig ? 'atualizada' : 'criada'} com sucesso`,
        data: result
      });

    } catch (err) {
      logger.error('[CONFIG] Erro:', err);
      res.status(500).json({
        error: 'Erro no servidor',
        details: err.message
      });
    }
  };

};

module.exports = Changelog;