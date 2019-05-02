metaxploit = include_lib("metaxploit")
address = params[0]
port = params[1].to_int
net_session = metaxploit.net_use( address, port )
metaLib = net_session.dump_libs
namex = metaLib.lib_name
verx = metaLib.version
print(namex)
print(verx)
