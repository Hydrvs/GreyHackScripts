//Gets acces to a shell
//Usage[remote]
//Creds[nonroot]
//Target[libftp.so>=1.0.2]
//Required[2 users registered]


if params.len != 2 or params[0] == "-h" or params[0] == "--help" then exit("<b>Usage: exploit [ip_address] [port]</b>")
metaxploit = include_lib("metaxploit")
if not metaxploit then exit("Error: Missing metaxploit library")
address = params[0]
port = params[1].to_int
net_session = metaxploit.net_use( address, port )
if not net_session then exit("Error: can't connect to net session")
metaLib = net_session.dump_libs
result = metaLib.overflow("0x28822CB1", "magesaddpart(lin)")
if not result then exit("Program ended")
if typeof(result) == "shell" then
	result.start_terminal
else
	print("Error: expected shell, obtained: " + result)
end if