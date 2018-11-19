var projectName = 'project';

var gulp = require('gulp'),
	plumber = require('gulp-plumber'),
	environments = require('gulp-environments'),
	watch = require('gulp-watch'),
	rigger = require('gulp-rigger'),
	pug = require('gulp-pug'),
	coffee = require('gulp-coffee'),
	coffeeConcat = require('gulp-coffeescript-concat'),
	stylus = require('gulp-stylus'),
	yaml = require('gulp-yaml'),
	uglify = require('gulp-uglify'),
	csso = require('gulp-csso'),
	autoprefixer = require('gulp-autoprefixer'),
	sourcemaps = require('gulp-sourcemaps'),
	htmlhint = require('gulp-htmlhint'),
	stripDebug = require('gulp-strip-debug'),
	mocks = require('./mocks.js'),
	browserSync = require('browser-sync').create();

gulp.task('serve', function() {
	browserSync.init({
		server: { // or proxy: 'stoner-html.dev:8888',
			baseDir: "./dist",
			middleware: mocks
		},
		notify: false
	});
});

gulp.task('json', function() {
	return gulp.src('./src/yaml/**/*.yml')
		.pipe(plumber())
		.pipe(yaml())
		.pipe(gulp.dest('./dist/templates/' + projectName + '/assets/json/'))
		.pipe(browserSync.stream({ match: '**/*.json' }));
});

gulp.task('html', function() {
	return gulp.src('./src/pug/*.pug')
		.pipe(plumber())
		.pipe(pug({
			pretty: '\t' // tabs
		}))
		.pipe(environments.development(htmlhint('./.htmlhintrc')))
		.pipe(environments.development(htmlhint.reporter()))
		.pipe(gulp.dest('./dist/'))
		.pipe(browserSync.reload({ stream: true }));
});

gulp.task('coffee', function() {
	return gulp.src('./src/coffee/**/*.coffee')
		.pipe(plumber())
		.pipe(coffeeConcat('app.coffee'))
		.pipe(coffee({ bare: true }))
		.pipe(gulp.dest('./src/js/'))
});

gulp.task('js', function() {
	return gulp.src('./src/js/**/*.js')
		.pipe(environments.development(sourcemaps.init()))
		.pipe(rigger())
		.pipe(environments.production(uglify({
			preserveComments: 'license',
			mangle: true
		})))
		.pipe(environments.production(stripDebug()))
		.pipe(environments.development(sourcemaps.write()))
		.pipe(gulp.dest('./dist/templates/' + projectName + '/assets/scripts/'))
		.pipe(browserSync.stream({ match: '**/*.js' }));
});

gulp.task('css', function() {
	return gulp.src(['./src/stylus/*.styl', '!./src/stylus/core/'])
		.pipe(plumber())
		.pipe(environments.development(sourcemaps.init()))
		.pipe(stylus({'include css': true}))
		.pipe(autoprefixer({ browsers: ['last 2 versions', 'ios >= 7','firefox >=4','safari >=7','IE >=8','android >=2'] }))
		.pipe(environments.production(csso()))
		.pipe(environments.development(sourcemaps.write()))
		.pipe(gulp.dest('./dist/templates/' + projectName + '/assets/styles/'))
		.pipe(browserSync.stream({ match: '**/*.css' }));
});

gulp.task('watch', function () {
	watch(['./src/yaml/**/*.yml'], function() {
		gulp.start('json');
	});
	watch(['./src/coffee/**/*.coffee'], function() {
		gulp.start('coffee');
	});
	watch(['./src/js/**/*.js'], function() {
		gulp.start('js');
	});
	watch(['./src/stylus/**/*.styl'], function() {
		gulp.start('css');
	});
	watch(['./src/pug/**/*.pug'], function() {
		gulp.start('html');
	});
});

gulp.task('main', ['coffee'], function() {
	gulp.start('html');
	gulp.start('js');
	gulp.start('css');
	gulp.start('json');
});

gulp.task('default', ['main', 'watch', 'serve']);
