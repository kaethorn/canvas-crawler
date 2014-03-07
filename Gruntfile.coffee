module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        expand: true
        cwd:   'app'
        src:   ['*.coffee']
        dest:  'public/js'
        ext:   '.js'

    sass:
      dist:
        options:
          style: 'expanded'
        files: [
          expand: true
          cwd:    'css'
          src:    ['*.sass']
          dest:   'public/css'
          ext:    '.css'
        ]

    clean: ['public']

    concurrent:
      assets: ['coffee', 'sass']
      guard:
        tasks: ['watch:sass', 'watch:coffee']
        options:
          logConcurrentOutput: true

    watch:
      sass:
        files: ['css/*.sass']
        tasks: ['sass']
      coffee:
        files: ['app/*.coffee']
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'build', ['clean', 'concurrent:assets']
  grunt.registerTask 'development', ['build', 'concurrent:guard']

  grunt.registerTask 'default', ['development']
