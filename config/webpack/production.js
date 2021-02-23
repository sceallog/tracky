process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = {
  environment.toWebpackConfig(),
  resolve: {
    modules: [
      //path.join(__dirname, "js/helpers"),
      "node_modules"
    ]
  }
};
