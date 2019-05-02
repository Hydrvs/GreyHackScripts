//Ipcat 0.1 by KEKE

if params.len != 3 then exit("<b>Usage: ipcat [ip_address] [port] /file</b>")
metaxploit = include_lib("metaxploit")
if not metaxploit then exit("Error: Missing metaxploit library")
address = params[0]
port = params[1].to_int
net_session = metaxploit.net_use( address, port )
if not net_session then exit("Error: can't connect to net session")
metaLib = net_session.dump_libs
result = metaLib.overflow("0x28372C05", "true")
if not result then exit("Program ended")

if(typeof(result) != "computer") then exit("Error: expected computer, obtained " + result)
			
homeFolder = result.File(params[2])

if not homeFolder then exit("Error: file not found")
if not homeFolder.has_permission("r") then exit("Error: can't read file contents. Permission deniend")
print(" ")
print(homeFolder.content)
