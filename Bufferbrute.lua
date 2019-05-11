if params.len <= 2 or params[0] == "-h" or params[0] == "--help" then
print("<color=red>____  _   _  ___  ___ ___  ___    ___              _</color>")
print("<color=red>| _ )| | | || __|| __| __|| _ \  | _ )  _ _  _  _ | |_  ___</color>")
print("<color=red>| _ \| |_| || _| | _|| _| |   /  | _ \ | '_|| +| ||  _|/ -_)</color>")
print("<color=red>|___/ \___/ |_|__|_|_|___||_|_\ @|___/_|_|_  \_,_|_\__|\___|</color>")
print("<b><color=white>-By KEKE</color></b>")
print()
print("Dictionary based buffer overflow brute-force attack tool")

exit("<b>Usage: buffer.brute [ip_address] [port] [/payloadfile]</b>")	
end if

file = get_shell.host_computer.File(params[2])
if file == null then exit("file not found")

memoryzone = user_input("Memory zone: ")
if not memoryzone then exit("Error: Missing memory zone")

metaxploit = include_lib("metaxploit")
if not metaxploit then exit("Error: Missing metaxploit library")
address = params[0]
port = params[1].to_int
net_session = metaxploit.net_use( address, port)
if not net_session then exit("Error: can't connect to net session")
metaLib = net_session.dump_libs

y = file.content
z = y.split("
")
i=z.len

while i >= 1
	a = z.pull
	result = metaLib.overflow(memoryzone, a, "pass")
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
i = i - 1
end while
