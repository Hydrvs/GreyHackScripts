print("SSH Brute 0.56")
print("by keke")

if params.len <= 1 or params[0] == "-h" or params[0] == "--help" then exit("<b>Usage: sshbrute [ip_address] [/dictionaryfile]</b>")	
address = params[0]
filu = params[1]

file = get_shell.host_computer.File(filu) //change the file path here
if file == null then exit("File not found!")
y = file.content
z = y.split("
")
i=z.len

while i >= 1
	a = z.pull
	shell = get_shell.connect_service(address, 22, "root",a, "ssh")
	print("trying password: " + a)
	if shell then
		print()
		print("Brute force succesfull")
		shell.start_terminal
	end if
	i = i - 1
end while
