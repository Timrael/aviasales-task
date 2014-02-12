module.exports = (grunt) ->
	grunt.initConfig
	# Concatinate js
		concat:
			prod:
				src: [
#					'src/vendor/jquery-1.10.1.min.js'
					'src/vendor/customSelect/*.js'
					'src/vendor/jscrollpane/*.js'
					'public/js/tabs-folder.js'
				]
				dest: 'public/js/main.js'

	# Minimalize js
		uglify:
			prod:
				files:
					'public/js/main.min.js': '<%= concat.prod.dest %>'

	# Run simple server for static
		connect:
			test:
				options:
					port: 8011
					base: '.'
					keepalive: true

	# Compile compass (more configure in config.rb)
		compass:
			prod:
				options:
					environment: 'production'
					outputStyle: 'expanded'
			dev:
				options:
					environment: 'development'
					outputStyle: 'expanded'

	# Sass instead of compass, cuz its support sourceMap
		sass:
			prod:
				options:
					compass: true
#					style: 'compressed'
				files:
					'public/css/main.css': 'src/sass/main.scss'
			dev:
				options:
					compass: true
					sourcemap: true
					debugInfo: true
				files:
					'public/css/main.css': 'src/sass/main.scss'

		cssmin:
			prod: {
				expand: true,
				cwd: 'public/css/',
				src: ['*.css', '!*.min.css'],
				dest: 'public/css/',
				ext: '.min.css'
			}

	# Compile coffeeScript
		coffee:
			prod:
				options:
					join: true
				files:
					'public/js/tabs-folder.js': 'src/coffee/tabs-folder.coffee'
			dev:
				options:
					join: true
				files:
					'public/js/tabs-folder.js': 'src/coffee/tabs-folder.coffee'

	# Watch for coffee, sass
		watch:
			dev:
				files: ['src/sass/**/*.scss', 'src/vendor/**/*.scss']
				tasks: 'buildDev'
			prod:
				files: ['src/sass/**/*.scss', 'src/vendor/**/*.scss']
				tasks: ['sass:prod', 'cssmin:prod']

	require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

	grunt.registerTask 'buildDev', ['coffee:dev', 'compass:dev']
	grunt.registerTask 'buildProd', ['coffee:prod', 'concat:prod', 'uglify:prod', 'sass:prod', 'cssmin:prod']