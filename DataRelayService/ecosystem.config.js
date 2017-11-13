module.exports = {
  /**
   * Application configuration section
   * http://pm2.keymetrics.io/docs/usage/application-declaration/
   */
  apps : [
    {
      name      : 'DataRelayService',
      script    : 'app.js',
      env: {
        COMMON_VARIABLE: 'true'
      },
      env_production : {
          NODE_ENV: 'production',
          PORT: 3000
      }
    }
  ],

  /**
   * Deployment section
   * http://pm2.keymetrics.io/docs/usage/deployment/
   */
  deploy : {
    production : {
      user : 'node',
      host: 'ec2-54-164-254-145.compute-1.amazonaws.com',
      ref  : 'origin/DataRelayService',
      repo : 'https://github.com/hackerbuddy/CryptoBot.git',
      path : '/var/www/DataRelayService',
      'post-deploy': 'npm install && pm2 reload ecosystem.config.js --env production',
      env  : {
          "NODE_ENV": "production"
      }
    }
  }
};
