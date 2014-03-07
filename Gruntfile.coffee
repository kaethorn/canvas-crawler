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

    haml:
      files:
        expand: true
        cwd:   'app'
        src:   ['*.haml']
        dest:  'public'
        ext:   '.html'

    clean: ['public']

    concurrent:
      assets:
        tasks: ['coffee', 'sass', 'haml', 'copy:js', 'copy:css']
        options:
          limit: 5
      development:
        tasks: ['watch:sass', 'watch:coffee', 'watch:haml', 'watch:livereload', 'connect']
        options:
          logConcurrentOutput: true
          limit: 5

    watch:
      sass:
        files: ['css/*.sass']
        tasks: ['sass']
      coffee:
        files: ['app/*.coffee']
        tasks: ['coffee']
      haml:
        files: ['app/*.haml']
        tasks: ['haml']
      livereload:
        files: ['public/**/*']
        options:
          livereload: true

    copy:
      js:
        expand:  true
        flatten: true
        src:     'lib/**.js'
        dest:    'public/js'
      css:
        expand:  true
        flatten: true
        src:     'lib/**.css'
        dest:    'public/css'

    connect:
      server:
        options:
          port:       9001
          base:       'public'
          keepalive:  true
          livereload: true
          hostname:   '*'


  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-haml'

  grunt.registerTask 'build', ['clean', 'concurrent:assets']
  grunt.registerTask 'development', ['build', 'concurrent:development']

  grunt.registerTask 'default', ['development']
