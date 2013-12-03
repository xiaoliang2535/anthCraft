
angular.module('LocalStorageModule').value('prefix', 'anthCraft');
mod = angular.module('anthCraftApp', [
	'ngProgress'
	'ngRoute'
	'ngCookies'
	'ngResource'
	'imageupload'
	'LocalStorageModule'
]).config [ '$routeProvider', '$compileProvider', ($routeProvider, $compileProvider)->

	# Compile white list for image preview since angular-v1.2.1
	$compileProvider.imgSrcSanitizationWhitelist(/^\s*(https?|ftp|file|blob):|data:image\//)

	$routeProvider
		.when('/', {
			templateUrl: 'views/index.html'
		})
		.when('/dockbar', {
			templateUrl: 'views/dockbar.html'
		})
		.when('/wallpaper', {
			templateUrl: 'views/wallpaper.html'
		})
		.when('/systemIcons', {
			templateUrl: 'views/systemicons.html'
		})
		.when('/packForm', {
			templateUrl: 'views/packform.html'
		})
		.otherwise {
			redirectTo: '/'
		}

	return
]

# mod = angular.module('anthCraftApp')
# mod.controller 'MainCtrl', ($http, $scope)->


# TODO:
# 	> Time alert
# 	> auto-close alert
# 	> return alert handler id
mod.controller 'AlertCtrl', [ '$scope', ($scope)->
	$scope.alerts = []

	$scope.addAlert = ()-> $scope.alerts.push({msg: "Another alert!"})

	$scope.closeAlert = (index)-> $scope.alerts.splice(index, 1)

	$scope.$on 'app.alert', (event, type, msg)->
		$scope.alerts.push { type: type, msg: msg }
]

mod.controller 'indexCtrl', [
	'$rootScope', '$scope', '$location', 'localStorageService'
	'themeService',
	(
		$rootScope, $scope, $location, localStorage, themeService
	)->
		$scope.createTheme = ()->
			themeService.init (err)->
				return $rootScope.$broadcast 'app.alert', 'error', 'Server Error!' if err
				$location.url('/wallpaper')

		$scope.hasUnpub = themeService.hasUnpub()
		$scope.continueTheme = ()->
			themeService.continueWork()
			$location.url('/wallpaper')
]

mod.controller 'controlButton', [
	'$scope', 'themeService'
	(
		$scope, themeService
	)->
		$scope.createNewTheme = ()->
			themeService.init()
]


