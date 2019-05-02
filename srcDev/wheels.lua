metaxploit = include_lib("metaxploit")
if not metaxploit then exit("Error: Missing metaxploit library")
metaLib = metaxploit.load("/lib/libssh.so")
if not metaLib then exit("Can't find " + "/lib/libssh.so")
result = metaLib.overflow("0x1072D71A", "fsetpivot(ge)")
if not result then exit("Program ended")
if typeof(result) != "file" then exit("Error: expected file, obtained: " + result)
if not result.is_folder then exit("Error: expected folder, obtained file: " + result.path)
if not result.has_permission("r") then exit("Error: can't access to " + result.path + ". Permission denied." )
print("Obtained access to " + result.path +". Listing files...")
files = result.get_files
for file in files
	print("File: " + file.name + ". Printing content...")
	if not file.has_permission("r") then
		print("failed. Permission denied.")

	else if file.is_binary then
		print("failed. Binary file.")

	else
		print(file.content)
	end if
end for
