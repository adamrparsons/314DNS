## LABDNS

### What is this

Curtin used to have all the 314.2xx lab machines on a nice little subnet with proper hostnames that were named in a somewhat sane manner (lab232-01, for example) but after the great vmware mess of '14 this was ruined, and CITS seem to have no intention to fix this or help us out, so instead we can maintain this communal list of "I cant believe its not DNS!" 

### Why is this usefull

SSH'ing into the labs, basically. May be useful for your CG assignment if you wish to use the labs as a ghetto render farm. Personally I want to check if I accidentally forget to log out of the console.

### What does each file do
  * "ip" is a bash script that takes one argument, the 'hostname' (read, not really a hostname, but a communal agreed name) that you wanna call the machine you run it on. It then adds this to the two csv's 

  * list is just a csv with MAC ADDRESS,HOSTNAME
sicklist is kinda less reliable, it's the same as list but with an IP field, that is not at all to be trusted (the labs use DHCP)

