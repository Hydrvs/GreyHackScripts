x = get_shell.host_computer.File("/home/rogu3/passw.txt") //change the file path here
y = x.content
z = y.split(",")

i=z.len
while i >= 1
	a = z.pull
	print(a)
	i = i - 1
end while
