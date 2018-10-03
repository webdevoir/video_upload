process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment');
const nodeExternals = require('webpack-node-externals');
environment.config.externals = [nodeExternals()];

module.exports = environment.toWebpackConfig()
