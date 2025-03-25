const winston = require('winston');
const { format, transports } = winston;
const path = require('path');

const fs = require('fs');
const logDir = 'logs';

if (!fs.existsSync(logDir)) {
  fs.mkdirSync(logDir);
}

const logger = winston.createLogger({
  level: 'info',
  format: format.combine(
    format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
    format.errors({ stack: true }), // Mostra stack trace de erros
    format.json()
  ),
  transports: [
    // Logs de ERRO (arquivo separado)
    new transports.File({
      filename: path.join(logDir, 'errors.log'),
      level: 'error',
    }),
    
    // Logs de WARN (arquivo separado)
    new transports.File({
      filename: path.join(logDir, 'warnings.log'),
      level: 'warn',
    }),
    
    // Logs de INFO (arquivo separado)
    new transports.File({
      filename: path.join(logDir, 'infos.log'),
      level: 'info',
    }),
    
    // Logs GERAIS (todos os níveis)
    new transports.File({
      filename: path.join(logDir, 'combined.log'),
    }),
    
    // Mostra logs no console (opcional)
    new transports.Console({
      format: format.combine(
        format.colorize(),
        format.simple()
      ),
    }),
  ],
});

module.exports = logger;