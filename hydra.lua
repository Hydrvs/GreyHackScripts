//Hydra 0.2 by Hyd

choice = function(str)
	if str == "p" then
		file = result.File("/etc/passwd")
		return str
	else if str == "m" then
		userx = user_input("Target: ")
		path = ("/home/" + userx + "/Config/Mail.txt")
		file = result.File(path)
		return str
	else if str == "b" then
		userx = user_input("Target: ")
		path = ("/home/" + userx + "/Config/Bank.txt")
		file = result.File(path)
		return str
	end if
end function

tipo = user_input("Exploit type [m:Mail,b:Bank,p:Pass]: ")
router = user_input("Public IP: ")
port = user_input("Port: ").to_int

metaxploit = include_lib("metaxploit")
net_session = metaxploit.net_use( router, port )
metaLib = net_session.dump_libs
namex = metaLib.lib_name
print("Library found: " + namex)

if namex == "libhttp.so" then
	
  result = metaLib.overflow("0x74F9F33C", "gionx")
  choice(tipo)
  print(file.content)

else
	result = print("No lib found!")
end if
