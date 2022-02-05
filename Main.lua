-- Downloading files from created list
	local versions, path, id, version, shortcut = {}
	for i = 1, #downloadList do
		path, id, version, shortcut = getData(downloadList[i])

		-- Download file
		download(path, OSPath .. path)
	
		-- Adding system versions data
		if id then
			versions[id] = {
				path = OSPath .. path,
				version = version or 1,
			}
		end
	
		-- Create shortcut if possible
		if shortcut then
			switchProxy(function()
				system.createShortcut(
					userPaths.desktop .. filesystem.hideExtension(filesystem.name(filesystem.path(path))),
					OSPath .. filesystem.path(path)
				)
			end)
		end
	end
