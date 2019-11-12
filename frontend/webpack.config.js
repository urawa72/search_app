const VueLoaderPlugin = require("vue-loader/lib/plugin")

module.exports = {
  mode: "development",
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: "vue-loader",
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel-loader",
        options: {
          presets: [
            [
              '@babel/preset-env',
              {
                targets: {
                  ie: 11
                },
                useBuiltIns: 'usage'
              }
            ]
          ]
        }
      },
      {
        test: /\.css$/,
        use: [
          "vue-style-loader",
          "css-loader",
        ],
      },
      {
        test: /\.(png|jpe?g|gif|svg)(\?.*)?$/,
        loader: 'url-loader',
      }
    ]
  },
  plugins: [
    new VueLoaderPlugin()
  ],
  resolve: {
    extensions: [".vue", ".js"],
    alias: {
      "vue$": "vue/dist/vue.esm.js"
    }
  },
  devServer: {
    compress: true,
    port: 9000,
    open: true
  },
}
