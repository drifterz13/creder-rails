const withMT = require("@material-tailwind/html/utils/withMT");

module.exports = withMT({
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
})
