mod = angular.module("uploadApp")
mod.controller "dWallpaperFormCtrl", [
	"$scope", "$http",
	($scope, $http)->
		$scope.dWallpaper = {}
		$scope.submit = (event)->
			event.preventDefault()
			data = $scope.dWallpaper

			# TODO: Validate
			formData = new FormData()
			formData.append 'apkFile', data.apkFile, data.apkFile.name
			formData.append 'iconFile', data.iconFile
			formData.append 'thumbnailFile', data.thumbnailFile

			formData.append 'dWallpaper', JSON.stringify(data)

			$http.post(UPLOAD_URL + "/dwallpaper", formData, {
				transformRequest: angular.identity
				headers: {
					'content-type': undefined
				}
			}).success( (data)->
				console.log arguments
			)

]
