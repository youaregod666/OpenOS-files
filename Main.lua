-- to install on computer from opencomputers
-- Flashing EEPROM
	layout:removeChildren()
	addImage(1, 1, "EEPROM")
	workspace:draw()

EEPROMProxy.set(request(EFIURL))
	EEPROMProxy.setLabel("IMineOS EFI")
	EEPROMProxy.setData(selectedFilesystemProxy.address)
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
	end
