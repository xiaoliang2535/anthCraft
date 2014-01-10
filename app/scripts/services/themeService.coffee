
mod = angular.module('anthCraftApp')


# Theme Service
mod.factory 'themeService', [
	'$rootScope', '$resource', 'localStorageService', 'themeConfig',
	(
		$rootScope, $resource, localStorage, themeConfig
	)->

		actions = {
			create: { method: 'POST', url: '/api/themes/create' }
			save: { method: 'POST', url: '/api/themes' }
			packageUp: { method: 'PUT', url: '/api/themes/:themeId/package' }
			preview: { method: 'PUT', url: '/api/themes/preview?id=:themeId' }
		}
		Theme = $resource('/api/themes/:themeId', { themeId: '@_id' }, actions)

		service = {

			# theme modified or not
			dirty: false

			# Theme Model
			themeModel: {}
			# Theme Package info
			# Init default?
			packInfo: angular.copy(themeConfig.defaultPackInfo)

			# Get themeModel model from server side
			init: (callback)->
				# TODO: Warn user if need continue last theme
				# Clear localStorage
				localStorage.remove('unpublished_theme_model')
				localStorage.remove('unpublished_theme_packInfo')

				service.themeModel = Theme.create {}, (doc)->

					# Save to local storage
					localStorage.set('unpublished_theme_model', doc)
					localStorage.set('unpublished_theme_packInfo', service.packInfo)
					callback?()
				, callback


				# init default packInfo
				service.packInfo = angular.copy(themeConfig.defaultPackInfo)
				service.updateView()
				service.dirty = false

				# Restore uploader image preview data
				$rootScope.$broadcast "uploader.refresh"
				# TODO: FAILD?

			hasUnpub: ()-> !!localStorage.get('unpublished_theme_model')
			continueWork: ()->
				return false if not service.hasUnpub()

				# Check localStorage,
				# 	recover data if exists

				unpublished_theme_model = localStorage.get('unpublished_theme_model')
				unpublished_theme_packInfo = localStorage.get('unpublished_theme_packInfo')
				if unpublished_theme_model
					service.packInfo = unpublished_theme_packInfo
					service.themeModel = unpublished_theme_model
					# Because there is no data persisted to database until theme upload, so..
					# unpublished_theme_model = Theme.get { themeId: unpublished_theme_model._id }, (themeModel)->
					# 	service.themeModel = themeModel


				return true


			# Return image preview scale from factory themeConfig
			getPreviewScale: (resType, resName)-> themeConfig.getPreviewScale(resType, resName)

			# Update view
			updateView: (updateData)->
				if updateData
					service.packInfo[updateData.resType][updateData.resName].src = updateData.src

				# Update localStorage if dirty
				if service.dirty
					localStorage.set('unpublished_theme_packInfo', service.packInfo)

				service.dirty = true

				# TBD: Not save every time?
				# service.theme.$save()
				$rootScope.$broadcast('theme.update', service.packInfo, updateData)

			themeUpdate: ()->
				$rootScope.$broadcast 'theme.update', service.packInfo

			# Reset value to default
			resetValue: (resType, resName)->
				service.packInfo[resType][resName] = themeConfig.defaultPackInfo[resType][resName]


			previewTheme: (callback)->
				Theme.preview { themeId: service.themeModel._id }, service.packInfo, (data)->
					service.themeModel.preview = data.preview
					service.themeModel.thumbnail = data.thumbnail
					callback(data);

			# Package theme and get theme Url
			packageTheme: (callback)->
				return callback(false) if not service.dirty
				# save themeModel
				# delete service.themeModel.thumbnail
				# service.themeModel.$save {}, (doc)->
				Theme.save service.themeModel, (doc)->
					# package up
					Theme.packageUp { themeId: doc._id }, service.packInfo, (data)->

						service.themeModel.updateTime = data.theme.updateTime
						service.themeModel.packageFile = data.theme.packageFile
						callback.apply(null, arguments)

						# Clear localStorage
						localStorage.remove('unpublished_theme_model')
						localStorage.remove('unpublished_theme_packInfo')

						service.dirty = false

		}

		service.continueWork()

		return service
]