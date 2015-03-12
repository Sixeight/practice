var gulp = require("gulp");
var plumber = require("gulp-plumber");
var browserify = require("browserify");
var source = require("vinyl-source-stream");

gulp.task("compile", function() {
  browserify()
    .require("./src/app.js", {entry: true})
    .bundle()
    .on("error", function(e) { console.log(e.message) })
    .pipe(plumber())
    .pipe(source("app.js")) // dummy
    .pipe(gulp.dest("./dist"));
});

gulp.task("watch", function() {
  gulp.watch("src/*.js", ["compile"]);
});

gulp.task("default", ["compile"]);
