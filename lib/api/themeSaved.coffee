
ThemeSaved = require '../models/SavedTheme'
anthpack = require 'anthpack'

module.exports = (app)->

	ThemeSaved.route('archive.post', {
		detail: true,
		handler: (req, res, next)->
			data = req.body

			anthpack.archive data, (err, archivePath)->
				if err
					res.send 500, err
					return
				res.json {
					success: true
					archive: archivePath
				}

	})

	ThemeSaved.route('unarchive.post', {
		detail: true,
		handler: (req, res, next)->
			archiveFile = req.files.archive.path

			anthpack.unarchive archiveFile, (err, data)->
				if err
					res.send 500, err
					return

				# set userId as current user
				data.meta.userId = req.cookies.userid

				res.json data
	})


	ThemeSaved.register app, '/api/savedTheme'
