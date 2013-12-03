###
	Theme pack configs
###
mod = angular.module('anthCraftApp')

mod.factory 'themeConfig', ->
	return {

		themeFolder: "/resources/upload"

		# Preview scale for processing uploaded image
		getPreviewScale: (resType, resName)->
			switch resType
				when 'wallpaper'
					{
						width: 239
						height: 428
						force: true
					}
				when 'app_icon', 'dock_icon'
					{
						width: 37
						height: 37
						force: true
					}

		getRecommandScale: (resType, resName)->
			switch resType
				when 'wallpaper'
					{
						width: 1440
						height: 1280
						type: 'jpg'
					}
				when 'dock_icon'
					{
						width: 480
						height: 90
						type: 'png'
					}

		# Default packInfo for reset style
		defaultPackInfo: {
			wallpaper: {
				"wallpaper": "/default_theme/wallpaper/wallpaper960x800(72).jpg"
			}

			app_icon: {
				# "com_android_contacts_com_android_contacts_activities_dialtactsactivity":"/default_theme/app_icon/com_android_contacts_com_android_contacts_activities_dialtactsactivity.png"
				# "com_android_contacts_com_android_contacts_activities_peopleactivity":"/default_theme/app_icon/com_android_contacts_com_android_contacts_activities_peopleactivity.png"
				# "com_android_mms_com_android_mms_ui_conversationcomposer":"/default_theme/app_icon/com_android_mms_com_android_mms_ui_conversationcomposer.png"
				# "com_sec_android_app_sbrowser_com_sec_android_app_sbrowser_sbrowsermainactivity":"/default_theme/app_icon/com_sec_android_app_sbrowser_com_sec_android_app_sbrowser_sbrowsermainactivity.png"

				"com_android_browser_com_android_browser_browseractivity": "/default_theme/app_icon/com_android_browser_com_android_browser_browseractivity.png"
				"com_android_calculator2_com_android_calculator2_calculator": "/default_theme/app_icon/com_android_calculator2_com_android_calculator2_calculator.png"
				"com_android_calendar_com_android_calendar_allinoneactivity": "/default_theme/app_icon/com_android_calendar_com_android_calendar_allinoneactivity.png"
				"com_android_camera_com_android_camera_camera": "/default_theme/app_icon/com_android_camera_com_android_camera_camera.png"
				"com_android_contacts_com_android_contacts_activities_dialtactsactivity": "/default_theme/app_icon/com_android_contacts_com_android_contacts_activities_dialtactsactivity.png"
				"com_android_contacts_com_android_contacts_activities_peopleactivity": "/default_theme/app_icon/com_android_contacts_com_android_contacts_activities_peopleactivity.png"
				"com_android_deskclock_com_android_deskclock_deskclock": "/default_theme/app_icon/com_android_deskclock_com_android_deskclock_deskclock.png"
				"com_android_email_com_android_email_activity_welcome": "/default_theme/app_icon/com_android_email_com_android_email_activity_welcome.png"
				"com_android_gallery3d_com_android_gallery3d_app_gallery": "/default_theme/app_icon/com_android_gallery3d_com_android_gallery3d_app_gallery.png"
				"com_android_mms_com_android_mms_ui_conversationcomposer": "/default_theme/app_icon/com_android_mms_com_android_mms_ui_conversationcomposer.png"
				"com_android_mms_com_android_mms_ui_conversationlist": "/default_theme/app_icon/com_android_mms_com_android_mms_ui_conversationlist.png"
				"com_android_music_com_android_music_musicbrowseractivity": "/default_theme/app_icon/com_android_music_com_android_music_musicbrowseractivity.png"
				"com_android_music_com_android_music_videobrowseractivity": "/default_theme/app_icon/com_android_music_com_android_music_videobrowseractivity.png"
				"com_android_providers_downloads_ui_com_android_providers_downloads_ui_downloadlist": "/default_theme/app_icon/com_android_providers_downloads_ui_com_android_providers_downloads_ui_downloadlist.png"
				"com_android_quicksearchbox_com_android_quicksearchbox_searchactivity": "/default_theme/app_icon/com_android_quicksearchbox_com_android_quicksearchbox_searchactivity.png"
				"com_android_settings_com_android_settings_settings": "/default_theme/app_icon/com_android_settings_com_android_settings_settings.png"
				"com_google_android_apps_maps_com_google_android_maps_mapsactivity": "/default_theme/app_icon/com_google_android_apps_maps_com_google_android_maps_mapsactivity.png"
				"com_mediatek_videoplayer_com_mediatek_videoplayer_movielistactivity": "/default_theme/app_icon/com_mediatek_videoplayer_com_mediatek_videoplayer_movielistactivity.png"
				"com_sec_android_app_sbrowser_com_sec_android_app_sbrowser_sbrowsermainactivity": "/default_theme/app_icon/com_sec_android_app_sbrowser_com_sec_android_app_sbrowser_sbrowsermainactivity.png"

			}

			dock_icon: {
				"ic_allapps": "/default_theme/dock_icon/ic_allapps.png"
			}

		}

		appIcons: [
			{ id: "com_android_browser_com_android_browser_browseractivity", captial: "hello" }
			{ id: "com_android_calculator2_com_android_calculator2_calculator", captial: "hello" }
			{ id: "com_android_calendar_com_android_calendar_allinoneactivity", captial: "hello" }
			{ id: "com_android_camera_com_android_camera_camera", captial: "hello" }
			{ id: "com_android_contacts_com_android_contacts_activities_dialtactsactivity", captial: "hello" }
			{ id: "com_android_contacts_com_android_contacts_activities_peopleactivity", captial: "hello" }
			{ id: "com_android_deskclock_com_android_deskclock_deskclock", captial: "hello" }
			{ id: "com_android_email_com_android_email_activity_welcome", captial: "hello" }
			{ id: "com_android_gallery3d_com_android_gallery3d_app_gallery", captial: "hello" }
			{ id: "com_android_mms_com_android_mms_ui_conversationcomposer", captial: "hello" }
			{ id: "com_android_mms_com_android_mms_ui_conversationlist", captial: "hello" }
			{ id: "com_android_music_com_android_music_musicbrowseractivity", captial: "hello" }
			{ id: "com_android_music_com_android_music_videobrowseractivity", captial: "hello" }
			{ id: "com_android_providers_downloads_ui_com_android_providers_downloads_ui_downloadlist", captial: "hello" }
			{ id: "com_android_quicksearchbox_com_android_quicksearchbox_searchactivity", captial: "hello" }
			{ id: "com_android_settings_com_android_settings_settings", captial: "hello" }
			{ id: "com_google_android_apps_maps_com_google_android_maps_mapsactivity", captial: "hello" }
			{ id: "com_mediatek_videoplayer_com_mediatek_videoplayer_movielistactivity", captial: "hello" }
			{ id: "com_sec_android_app_sbrowser_com_sec_android_app_sbrowser_sbrowsermainactivity", captial: "hello" }

		]

	}
