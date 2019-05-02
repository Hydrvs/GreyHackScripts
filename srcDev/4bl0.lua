metaxploit = include_lib("metaxploit")
if not metaxploit then exit("Error: Missing metaxploit library")
metaLib = metaxploit.load("/lib/libssh.so")
if not metaLib then exit("Can't find " + "/lib/libssh.so")
result = metaLib.overflow("0x6D0607C0", "text")
if not result then exit("Program ended")
if typeof(result) != "file" then exit("Error: expected file, obtained: " + result)
if not result.is_folder then exit("Error: expected folder, obtained file: " + result.path)
if not result.has_permission("r") then exit("Error: can't access to " + result.path + ". Permission denied." )
AccessMailFile = function(homeFolder)
	print("Accesing to Mail.txt files...\nSearching users...")
	folders = homeFolder.get_folders
	for user in folders
		print("User: " + user.name +" found...")
		subFolders = user.get_folders
		mailFound = false
		for subFolder in subFolders
			if subFolder.name == "Config" then
				files = subFolder.get_files
				for file in files
					if file.name == "Mail.txt" then
						if not file.has_permission("r") then print("failed. Can't access to file contents. Permission denied")
						print("success! Printing file contents...\n" + file.content)
						mailFound = true
					end if
				end for
			end if
		end for
		if not mailFound then print("Mail file not found.")
	end for
	if folders.len == 0 then print("No users found. Program aborted")
end function

if result.path == "/home" then
	AccessMailFile(result)
else
	print("Searching home folder...")
	while not result.path == "/"
		result = result.parent
	end while
	
	folders = result.get_folders
	for folder in folders
		if folder.path == "/home" then
			AccessMailFile(folder)
			exit
		end if
	end for
end if
