const pool = require('../config/db');
const logger = require('../utils/logs');

class Projects {
  static get = async (req, res) => {
    try {
      const query = `SELECT * FROM projects LEFT JOIN images_projects i ON i.project = projects.id`;
      const [results] = await pool.execute(query, []);
      res.status(200).json(results);
    } catch (err) {
      logger.error(err);
      res.status(400).json(err);
    }
  };

  static add = async (req, res) => {
    const requiredFields = ['title', 'description', 'image', 'action'];
    const missingFields = requiredFields.filter(field => !req.body[field]);

    if (missingFields?.length > 0) {
      return res.status(400).json({ error: `Field${missingFields?.length > 1 ? 's' : ''} ${missingFields.join(', ')} ${missingFields.length > 1 ? 'are' : 'is'} required` });
    }

    const { title, description, image, action, path, images } = req?.body;

    try {
      // Inicia uma transação para garantir que ambos os inserts sejam completados com sucesso
      const connection = await pool.getConnection();
      await connection.beginTransaction();

      try {
        // Insere o projeto principal
        const [result] = await connection.execute(
          'INSERT INTO projects (title, description, image, action, path) VALUES (?, ?, ?, ?, ?)',
          [title, description, image, action, path || null]
        );

        const projectId = result.insertId;

        // Se houver imagens adicionais, insere na tabela images_projects
        if (images && images.length > 0) {
          const imagesValues = images.map(img => [projectId, img, '']);
          await connection.query(
            'INSERT INTO images_projects (project, image, description) VALUES ?',
            [imagesValues]
          );
        }

        // Commit da transação
        await connection.commit();
        connection.release();

        logger.info(`[PROJETOS] Criado - ${title}: ${description} <${image}>: ${action} / ${path}`);
        res.status(200).json({
          message: 'Projeto adicionado com sucesso',
          projectId,
          imagesAdded: images ? images.length : 0
        });

      } catch (err) {
        // Rollback em caso de erro
        await connection.rollback();
        connection.release();
        logger.error(`[PROJETOS] Erro ao criar - ${err.message}`);
        res.status(500).json({ error: 'Erro ao criar projeto', details: err.message });
      }
    } catch (err) {
      logger.error(`[PROJETOS] Erro de conexão - ${err.message}`);
      res.status(500).json({ error: 'Erro de conexão com o banco de dados', details: err.message });
    }
  };

  static update = async (req, res) => {
    try {
      const { id } = req.params;
      const { title, description, image, action, path, images } = req.body;
  
      if (!id) {
        return res.status(400).json({ error: 'ID do projeto é obrigatório' });
      }
  
      // Verifica se o projeto existe
      const [projectExists] = await pool.execute('SELECT id FROM projects WHERE id = ?', [id]);
      if (projectExists.length === 0) {
        return res.status(404).json({ error: 'Projeto não encontrado' });
      }
  
      // Verifica quais campos foram enviados para atualização
      const fieldsToUpdate = {};
      if (title !== undefined) fieldsToUpdate.title = title;
      if (description !== undefined) fieldsToUpdate.description = description;
      if (image !== undefined) fieldsToUpdate.image = image;
      if (action !== undefined) fieldsToUpdate.action = action;
      if (path !== undefined) fieldsToUpdate.path = path;
  
      // Inicia transação
      const connection = await pool.getConnection();
      await connection.beginTransaction();
  
      try {
        // Atualiza os dados do projeto se houver campos para atualizar
        if (Object.keys(fieldsToUpdate).length > 0) {
          const setClause = Object.keys(fieldsToUpdate).map(key => `${key} = ?`).join(', ');
          const values = Object.values(fieldsToUpdate);
          values.push(id);
  
          await connection.execute(
            `UPDATE projects SET ${setClause} WHERE id = ?`,
            values
          );
        }
  
        // Processa as imagens se foram enviadas
        if (images !== undefined) {
          // Remove todas as imagens existentes do projeto
          await connection.execute('DELETE FROM images_projects WHERE project = ?', [id]);
  
          // Insere as novas imagens se o array não estiver vazio
          if (images.length > 0) {
            const imagesValues = images.map(img => [id, img, '']);
            await connection.query(
              'INSERT INTO images_projects (project, image, description) VALUES ?',
              [imagesValues]
            );
          }
        }
  
        // Commit da transação
        await connection.commit();
        connection.release();
  
        logger.info(`[PROJETOS] Atualizado - ID ${id}: ${title || ''}`);
        res.status(200).json({ 
          message: 'Projeto atualizado com sucesso',
          updatedFields: Object.keys(fieldsToUpdate),
          imagesUpdated: images !== undefined
        });
  
      } catch (err) {
        // Rollback em caso de erro
        await connection.rollback();
        connection.release();
        throw err;
      }
  
    } catch (err) {
      logger.error(`[PROJETOS] Erro ao atualizar - ${err.message}`);
      res.status(500).json({ 
        error: 'Erro ao atualizar projeto',
        details: process.env.NODE_ENV === 'dev' ? err.message : undefined
      });
    }
  };
};

module.exports = Projects;