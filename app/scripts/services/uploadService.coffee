
mod = angular.module 'anthCraftApp'

mod.directive 'uploadImg', [ '$http', 'ngProgress', ($http, ngProgress)-> {
	restrict: 'E'
	scope: {
		themeId: "@"
		resType: "="
		resName: "@"
		resCaptial: "@"

		defaultData: "&"
		scale: "&"
		srcPrefix: "@"

		recHeight: "@"
		recWidth: "@"
		recType: "@"

		callback: "&"
	}
	templateUrl: "/views/partials/uploader.html"
	controller: ['$scope', '$attrs', '$http', ($scope, $attrs, $http)->
		$scope.resName = $attrs.resName
		$scope.upload = (image)->

			ngProgress.start()

			themeId = $attrs.themeId
			resType = $attrs.resType
			resName = $attrs.resName
			previewScale = $attrs.scale

			callback = $attrs.callback

			formData = new FormData()
			formData.append('image', image, image.name)
			formData.append('themeId', themeId)
			formData.append('resType', resType)
			formData.append('resName', resName)
			formData.append('previewScale', JSON.stringify(previewScale))

			$http.post('/api/upload', formData, {
				transformRequest: angular.identity
				headers: {
					'content-type': undefined
				}
			}).success((result)->
				packInfo = {}
				packInfo[resType] = {}
				packInfo[resType][resName] = result.src

				ngProgress.complete()

				callback(packInfo)


			).error ()->
	]
	link: (scope, elem, attr)->
		attr.defaultData = scope.defaultData()[attr.resType][attr.resName]
		attr.scale = scope.scale()(attr.resType, attr.resName)
		attr.callback = scope.callback()

		scope.image = {
			url: attr.srcPrefix + attr.defaultData
		}
}]