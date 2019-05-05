if params.len <= 1 or params[0] == "-h" or params[0] == "--help" then exit("<b>Usage: metamap [ip_address] [port] </b>")
print("MetaMAP 0.4")
print("METAXPLOIT VULNERABILITY SCANNER")
print("Password forced for users: pass")
print("For empty string slots type: -")
print(" ")

memoryzone = user_input("Memory zone: ")
payload1 = user_input("unsafe string 1: ")
payload2 = user_input("unsafe string 2: ")
payload3 = user_input("unsafe string 3: ")
payload4 = user_input("unsafe string 4: ")
payload5 = user_input("unsafe string 5: ")
payload6 = user_input("unsafe string 6: ")
print(" ")
print("Starting scan...")
print(" ")

metaxploit = include_lib("metaxploit")
if not metaxploit then exit("Error: Missing metaxploit library")
address = params[0]
port = params[1].to_int
net_session = metaxploit.net_use( address, port)
if not net_session then exit("Error: can't connect to net session")
metaLib = net_session.dump_libs

// payload1
result = metaLib.overflow(memoryzone, payload1, "pass")
if not result then print("Scanned payload: " + memoryzone + " " + payload1)
if typeof(result) == "shell" then
	result.start_terminal
else
	if typeof(result) == "port" then print("Obtained port: " + result)
	if typeof(result) == "string" then print("Obtained string: " + result)
	if typeof(result) == "router" then print("Obtained router: " + result)
	if typeof(result) == "computer" then print("Obtained computer: " + result)
	if typeof(result) == "file" then
		print("Obtained Folder: "+result.path)
		subFiles = result.get_folders + result.get_files
		for subFile in subFiles
			nameFile = subFile.name
			data = "file: " + nameFile 
			data = data + "\n" + "owner: " + result.owner + "\n" + "permissions: " + result.permissions//define our data, each column data separated by a space
			print(format_columns(data))		
		end for
	end if
end if
print(" ")
//payload2
result = metaLib.overflow(memoryzone, payload2, "pass")
if not result then print("Scanned payload: " + memoryzone + " " + payload2)
if typeof(result) == "shell" then
	result.start_terminal
else
	if typeof(result) == "port" then print("Obtained port: " + result)
	if typeof(result) == "string" then print("Obtained string: " + result)
	if typeof(result) == "router" then print("Obtained router: " + result)
	if typeof(result) == "computer" then print("Obtained computer: " + result)
	if typeof(result) == "file" then
		print("Obtained Folder: "+result.path)
		subFiles = result.get_folders + result.get_files
		for subFile in subFiles
			nameFile = subFile.name
			data = "file: " + nameFile 
			data = data + "\n" + "owner: " + result.owner + "\n" + "permissions: " + result.permissions//define our data, each column data separated by a space
			print(format_columns(data))		
		end for
	end if
end if
print(" ")
//payload3
result = metaLib.overflow(memoryzone, payload3, "pass")
if not result then print("Scanned payload: " + memoryzone + " " + payload3)
if typeof(result) == "shell" then
	result.start_terminal
else
	if typeof(result) == "port" then print("Obtained port: " + result)
	if typeof(result) == "string" then print("Obtained string: " + result)
	if typeof(result) == "router" then print("Obtained router: " + result)
	if typeof(result) == "computer" then print("Obtained computer: " + result)
	if typeof(result) == "file" then
		print("Obtained Folder: "+result.path)
		subFiles = result.get_folders + result.get_files
		for subFile in subFiles
			nameFile = subFile.name
			data = "file: " + nameFile 
			data = data + "\n" + "owner: " + result.owner + "\n" + "permissions: " + result.permissions//define our data, each column data separated by a space
			print(format_columns(data))		
		end for
	end if
end if
print(" ")
//payload4
result = metaLib.overflow(memoryzone, payload4, "pass")
if not result then print("Scanned payload: " + memoryzone + " " + payload4)
if typeof(result) == "shell" then
	result.start_terminal
else
	if typeof(result) == "port" then print("Obtained port: " + result)
	if typeof(result) == "string" then print("Obtained string: " + result)
	if typeof(result) == "router" then print("Obtained router: " + result)
	if typeof(result) == "computer" then print("Obtained computer: " + result)
	if typeof(result) == "file" then
		print("Obtained Folder: "+result.path)
		print(" ")
		subFiles = result.get_folders + result.get_files
		for subFile in subFiles
			nameFile = subFile.name
			data = "file: " + nameFile 
			data = data + "\n" + "owner: " + result.owner + "\n" + "permissions: " + result.permissions//define our data, each column data separated by a space
			print(format_columns(data))		
		end for
	end if
end if
print(" ")
//payload5
result = metaLib.overflow(memoryzone, payload5, "pass")
if not result then print("Scanned payload: " + memoryzone + " " + payload5)
if typeof(result) == "shell" then
	result.start_terminal
else
	if typeof(result) == "port" then print("Obtained port: " + result)
	if typeof(result) == "string" then print("Obtained string: " + result)
	if typeof(result) == "router" then print("Obtained router: " + result)
	if typeof(result) == "computer" then print("Obtained computer: " + result)
	if typeof(result) == "file" then
		print("Obtained Folder: "+result.path)
		print(" ")
		subFiles = result.get_folders + result.get_files
		for subFile in subFiles
			nameFile = subFile.name
			data = "file: " + nameFile 
			data = data + "\n" + "owner: " + result.owner + "\n" + "permissions: " + result.permissions//define our data, each column data separated by a space
			print(format_columns(data))		
		end for
	end if
end if
print(" ")
//payload6
result = metaLib.overflow(memoryzone, payload6, "pass")
if not result then print("Scanned payload: " + memoryzone + " " + payload6)
if typeof(result) == "shell" then
	result.start_terminal
else
	if typeof(result) == "port" then print("Obtained port: " + result)
	if typeof(result) == "string" then print("Obtained string: " + result)
	if typeof(result) == "router" then print("Obtained router: " + result)
	if typeof(result) == "computer" then print("Obtained computer: " + result)
	if typeof(result) == "file" then
		print("Obtained Folder: "+result.path)
		print(" ")
		subFiles = result.get_folders + result.get_files
		for subFile in subFiles
			nameFile = subFile.name
			data = "file: " + nameFile 
			data = data + "\n" + "owner: " + result.owner + "\n" + "permissions: " + result.permissions//define our data, each column data separated by a space
			print(format_columns(data))		
		end for
	end if
end if
















