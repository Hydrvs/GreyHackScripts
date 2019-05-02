//Take advantage of a vulnerability in the ssh service to inject
//a new password to a registered user
//Usage[remote]
//Creds[root]
//Target[libssh.so>=1.0.1]
//Required[1 user registered|init.so at 1.0.0|root user logged]


if params.len != 2 or params[0] == "-h" or params[0] == "--help" then exit("<b>Usage: exploit [ip_address] [port]</b>")
metaxploit = include_lib("metaxploit")
if not metaxploit then exit("Error: Missing metaxploit library")
address = params[0]
port = params[1].to_int
net_session = metaxploit.net_use( address, port )
if not net_session then exit("Error: can't connect to net session")
metaLib = net_session.dump_libs
newPass = user_input("Enter new password: ")
result = metaLib.overflow("0x28372C05", "color_titleftunt-1", newPass)
if not result then exit("Program ended")
