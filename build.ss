#! eqela ss-0.14
#

lib sling:0.18.0
import jk.fs
import jk.lang
import jk.script
import jk.process

var script = new Script()
var file = new FileKit(script.ctx)

script.command("build", func(args) {
	var name = script.requireParameter(args, 0, "name")
	var version = script.requireParameter(args, 1, "version")
	var context = File.forPath(name).entry(version)
	if not context.isDirectory():
		Error.throw("noSuchDirectory", context)
	var dockerFile = context.entry("Dockerfile")
	if not dockerFile.isFile():
		Error.throw("noSuchFile", dockerFile)
	var pl = ProcessLauncher.forCommand("docker")
	if not pl:
		Error.throw("commantNotFound", "docker")
	pl.addToParams("build")
	pl.addToParams(".")
	pl.addToParams("-f")
	pl.addToParams("Dockerfile")
	pl.addToParams("-t")
	var tagName = "eqela/" .. name .. ":" .. version
	pl.addToParams(tagName)
	pl.setCwd(context)
	var r = pl.execute()
	if r != 0:
		Error.throw("dockerBuildFailed", String.forInteger(r))
	println tagName
})

script.main(args)
