env          = require('./env')
autoprefixer = require('autoprefixer')
precss       = require('precss')

webpack = {
  #context: __dirname + "/app",
  entry:
    app: './src/app.coffee'
    #mobile: './src/mobile.js'
  output:
    filename: '[name].js'
    path: __dirname + '/built'
  resolve: {
    extensions: ['', '.js', '.coffee']
  }

  module:
    loaders: [
      {
        test: /\.coffee$/
        #include: []
        loader: "coffee"
      }
      {
        test: /\.jade$/
        loader: 'jade'
      }
      {
        test: /\.html$/
        loader: 'html'
      }
      {
        test:     /\.css$/
        loader:   "style!css"
      }
      {
        test:     /\.scss$/
        loader:   "style!css!postcss!sass"
      }
      {
        test: /\.jpg$/
        loader: "file-loader"
      }
		  {
        test: /\.png$/
        loader: "url-loader?limit=10000&mimetype=image/png"
      }
    ]

  htmlLoader:
    minimize: false
    ignoreCustomFragments: [/\{\{.*?}}/]
  jadeLoader:
    pretty: true,
  postcss: () ->
    [autoprefixer, precss]

}

if env.isProduction
  _webpack = require('webpack')
  webpack.plugins.push(
      new _webpack.optimize.UglifyJsPlugin()
  )

module.exports = webpack
