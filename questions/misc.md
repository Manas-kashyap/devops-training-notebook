Network

<details>
<summary>What do you need in order to communicate?</summary><br><b>

  - A common language (for the two ends to understand)
  - A way to address who do you want to communicate with
  - A Connection (so the content of of the communication can reach the recipients)
</b></details>

<details>
<summary>What is TCP/IP?</summary><br><b>

A set of protocols that define how two or more devices can communicate with each other.
To learn more about TCP/IP, read [here](http://www.penguintutor.com/linux/basic-network-reference)
</b></details>

<details>
<summary>What is Ethernet?</summary><br><b>

Ethernet simply refers to the most common type of Local Area Network (LAN) used today. A LAN—in contrast to a WAN (Wide Area Network), which spans a larger geographical area—is a connected network of computers in a small area, like your office, college campus, or even home.
</b></details>

<details>
<summary>What is a MAC address? What is it used for?</summary><br><b>

A MAC address is a unique identification number or code used to identify individual devices on the network.

Packets that are sent on the ethernet are always coming from a MAC address and sent to a MAC address. If a network adapter is receiving a packet, it is comparing the packet’s destination MAC address to the adapter’s own MAC address.

</b></details>

<details>
<summary>When is this MAC address used?: ff:ff:ff:ff:ff:ff</summary><br><b>

When a device sends a packet to the broadcast MAC address (FF:FF:FF:FF:FF:FF​), it is delivered to all stations on the local network. Ethernet broadcasts are used to resolve IP addresses to MAC addresses (by ARP) at the datalink layer .
</b></details>

<details>
<summary>What is an IP address?</summary><br><b>

An Internet Protocol address (IP address) is a numerical label assigned to each device connected to a computer network that uses the Internet Protocol for communication.An IP address serves two main functions: host or network interface identification and location addressing.
</b></details>

<details>
<summary>Explain subnet mask and given an example</summary><br><b>

A Subnet mask is a 32-bit number that masks an IP address, and divides the IP address into network address and host address. Subnet Mask is made by setting network bits to all "1"s and setting host bits to all "0"s. Within a given network, two host addresses are reserved for special purpose, and cannot be assigned to hosts. The "0" address is assigned a network address and "255" is assigned to a broadcast address, and they cannot be assigned to hosts.

**For Example**

```
| Address Class | No of Network Bits | No of Host Bits | Subnet mask     | CIDR notation |
| ------------- | ------------------ | --------------- | --------------- | ------------- |
| A             | 8                  | 24              | 255.0.0.0       | /8            |
| A             | 9                  | 23              | 255.128.0.0     | /9            |
| A             | 12                 | 20              | 255.240.0.0     | /12           |
| A             | 14                 | 18              | 255.252.0.0     | /14           |
| B             | 16                 | 16              | 255.255.0.0     | /16           |
| B             | 17                 | 15              | 255.255.128.0   | /17           |
| B             | 20                 | 12              | 255.255.240.0   | /20           |
| B             | 22                 | 10              | 255.255.252.0   | /22           |
| C             | 24                 | 8               | 255.255.255.0   | /24           |
| C             | 25                 | 7               | 255.255.255.128 | /25           |
| C             | 28                 | 4               | 255.255.255.240 | /28           |
| C             | 30                 | 2               | 255.255.255.252 | /30           |

```
</b></details>

<details>
<summary>What is a private IP address? In which scenarios/system designs, one should use it?</summary><br><b>
</b></details>

<details>
<summary>What is a public IP address? In which scenarios/system designs, one should use it?</summary><br><b>
</b></details>

<details>
<summary>Explain the OSI model. What layers there are? What each layer is responsible for?</summary><br><b>

- Application: user end (HTTP is here)
- Presentation: establishes context between application-layer entities (Encryption is here)
- Session: establishes, manages and terminates the connections
- Transport: transfers variable-length data sequences from a source to a destination host (TCP & UDP are here)
- Network: transfers datagrams from one network to another (IP is here)
- Data link: provides a link between two directly connected nodes (MAC is here)
- Physical: the electrical and physical spec the data connection (Bits are here)

You can read more about the OSI model in [penguintutor.com](http://www.penguintutor.com/linux/basic-network-reference)
</b></details>

<details>
<summary>For each of the following determine to which OSI layer it belongs:

  * Error correction
  * Packets routing
  * Cables and electrical signals
  * MAC address
  * IP address
  * Terminate connections
  * 3 way handshake</summary><br><b>
  * Error correction
  * Packets routing - Network
  * Cables and electrical signals - Physical
  * MAC address - Data link
  * IP address - Network
  * Terminate connections - Session
  * 3 way handshake - Transport
</b></details>

<details>
<summary>What delivery schemes are you familiar with?</summary><br><b>

Unitcast: One to one communication where there is one sender and one receiver.

Broadcast: Sending a message to everyone in the network. The address ff:ff:ff:ff:ff:ff is used for broadcasting.
           Two common protocols which use broadcast are ARP and DHCP.

Multicast: Sending a message to a group of subscribers. It can be one-to-many or many-to-many.
</b></details>

<details>
<summary>What is CSMA/CD? Is it used in modern ethernet networks?</summary><br><b>

CSMA/CD stands for Carrier Sense Multiple Access / Collision Detection.
Its primarily focus it to manage access to shared medium/bus where only one host can transmit at a given point of time.

CSMA/CD algorithm:

1. Before sending a frame, it checks whether another host already transmitting a frame.
2. If no one transmitting, it starts transmitting the frame.
3. If two hosts transmitted at the same time, we have a collision.
4. Both hosts stop sending the frame and they send to everyone a 'jam signal' notifying everyone that a collision occurred
5. They are waiting for a random time before sending again
6. Once each host waited for a random time, they try to send the frame again and so the
</b></details>

<details>
<summary>Describe the following network devices and the difference between them:

  * router
  * switch
  * hub</summary><br><b>
</b></details>

<details>
<summary>How does a router works?</summary><br><b>

A router is a physical or virtual appliance that passes information between two or more packet-switched computer networks. A router inspects a given data packet's destination Internet Protocol address (IP address), calculates the best way for it to reach its destination and then forwards it accordingly.

</b></details>

<details>
<summary>What is NAT?</summary><br><b>

 Network Address Translation (NAT) is a process in which one or more local IP address is translated into one or more Global IP address and vice versa in order to provide Internet access to the local hosts.

</b></details>

<details>
<summary>What is a proxy? How does it works? What do we need it for?</summary><br><b>

A proxy server acts as a gateway between you and the internet. It’s an intermediary server separating end users from the websites they browse.

If you’re using a proxy server, internet traffic flows through the proxy server on its way to the address you requested. The request then comes back through that same proxy server (there are exceptions to this rule), and then the proxy server forwards the data received from the website to you.

roxy servers provide varying levels of functionality, security, and privacy depending on your use case, needs, or company policy.
</b></details>

<details>
<summary>What is TCP? How does it works? What is the 3 way handshake?</summary><br><b>

TCP 3-way handshake or three-way handshake is a process which is used in a TCP/IP network to make a connection between server and client.

A three-way handshake is primarily used to create a TCP socket connection. It works when:

- A client node sends a SYN data packet over an IP network to a server on the same or an external network. The objective of this packet is to ask/infer if the server is open for new connections.
- The target server must have open ports that can accept and initiate new connections. When the server receives the SYN packet from the client node, it responds and returns a confirmation receipt – the ACK packet or SYN/ACK packet.
- The client node receives the SYN/ACK from the server and responds with an ACK packet.
</b></details>

<details>
<summary>What is round-trip delay or round-trip time?</summary><br><b>

From [wikipedia](https://en.wikipedia.org/wiki/Round-trip_delay): "the length of time it takes for a signal to be sent plus the length of time it takes for an acknowledgement of that signal to be received"

Bonus question: what is the RTT of LAN?
</b></details>

<details>
<summary>How does SSL handshake work?</summary><br><b>
</b></details>

<details>
<summary>What is the difference between TCP and UDP?</summary><br><b>

TCP establishes a connection between the client and the server to guarantee the order of the packages, on the other hand, UDP does not establish a connection between client and server and doesn't handle package order. This makes UDP more lightweight than TCP and a perfect candidate for services like streaming.

[Penguintutor.com](http://www.penguintutor.com/linux/basic-network-reference) provides a good explanation.
</b></details>

<details>
<summary>What TCP/IP protocols are you familiar with?</summary><br><b>
</b></details>

<details>
<summary>Explain "default gateway"</summary><br><b>

A default gateway serves as an access point or IP router that a networked computer uses to send information to a computer in another network or the internet.
</b></details>

<details>
<summary>What is ARP? How does it works?</summary><br><b>

ARP stands for Address Resolution Protocol. When you try to ping an IP address on your local network, say 192.168.1.1, your system has to turn the IP address 192.168.1.1 into a MAC address. This involves using ARP to resolve the address, hence its name.

Systems keep an ARP look-up table where they store information about what IP addresses are associated with what MAC addresses. When trying to send a packet to an IP address, the system will first consult this table to see if it already knows the MAC address. If there is a value cached, ARP is not used.
</b></details>

<details>
<summary>What is TTL? What does it helps to prevent?</summary><br><b>
</b></details>

<details>
<summary>What is DHCP? How does it works?</summary><br><b>

It stands for Dynamic Host Configuration Protocol, and allocates IP addresses, subnet masks and gateways to hosts. This is how it works:

* A host upon entering a network, broadcasts a message in search of a DHCP server (DHCP DISCOVER)
* An offer message is sent back by the DHCP server as a packet containing lease time, subnet mask, IP addresses, etc (DHCP OFFER)
* Depending on which offer accepted, the client sends back a reply broadcast letting all DHCP servers know (DHCP REQUEST)
* Server sends an acknowledgment (DHCP ACK)

Read more [here](https://linuxjourney.com/lesson/dhcp-overview)
</b></details>

<details>
<summary>Can you have two DHCP servers in the same network? How it works?</summary><br><b>
</b></details>

<details>
<summary>What is SSL tunneling? How does it works?</summary><br><b>
</b></details>

<details>
<summary>What is a socket? Where can you see the list of sockets in your system?</summary><br><b>
</b></details>

<details>
<summary>What is IPv6? Why should we consider using it if we have IPv4?</summary><br><b>
</b></details>

<details>
<summary>What is VLAN?</summary><br><b>
</b></details>

<details>
<summary>What is MTU?</summary><br><b>
</b></details>

<details>
<summary>What happens if you send a packet that is bigger than the MTU?</summary><br><b>
</b></details>

<details>
<summary>True or False?. Ping is using UDP because it doesn't care about reliable connection</summary><br><b>
</b></details>

<details>
<summary>What is SDN?</summary><br><b>
</b></details>

<details>
<summary>What is ICMP? What is it used for?</summary><br><b>
</b></details>

<details>
<summary>What is NAT? How does it work?</summary><br><b>

NAT stands for network address translation. It’s a way to map multiple local private addresses to a public one before transferring the information. Organizations that want multiple devices to employ a single IP address use NAT, as do most home routers.
For example, your computer's private IP could be 192.168.1.100, but your router maps the traffic to it's public IP (e.g. 1.1.1.1). Any device on the internet would see the traffic coming from your public IP (1.1.1.1) instead of your private IP (192.168.1.100).
</b></details>

<details>
<summary>Which factors affect network performances</summary><br><b>
</b></details>

<details>
<summary>Which port number is used in each of the following protocols?:

  * SSH
  * SMTP
  * HTTP
  * DNS
  * HTTPS
  * FTP
  * SFTP
</summary><br><b>

  * SSH - 22
  * SMTP - 25
  * HTTP - 80
  * DNS - 53
  * HTTPS - 443
  * FTP - 21
  * SFTP - 22
</b></details>

#### Network - Data and Control planes

<details>
<summary>What "control plane" refers to?</summary><br><b>

The control plane is the part of the network that decides how to route and forward packets to a different location.
</b></details>

<details>
<summary>What "data plane" refers to?</summary><br><b>

The data plane is the part of the network that actually forwards the data/packets.
</b></details>

<details>
<summary>What "management plane" refers to?</summary><br><b>

Refers to monitoring and management functions.
</b></details>

<details>
<summary>To which plane (data, control, ...) is creating routing tables belongs to?</summary><br><b>

Control Plane.
</b></details>

<details>
<summary>Explain Spanning Tree Protocol (STP)</summary><br><b>
</b></details>

<details>
<summary>What is link aggregation? Why is it used?</summary><br><b>
</b></details>

<details>
<summary>What is Asymmetric Routing? How do deal with it?</summary><br><b>
</b></details>

<details>
<summary>What overlay (tunnel) protocols are you familiar with?</summary><br><b>
</b></details>

<details>
<summary>What is GRE? How does it works?</summary><br><b>
</b></details>

<details>
<summary>What is VXLAN? How does it works?</summary><br><b>
</b></details>

<details>
<summary>What is SNAT?</summary><br><b>
</b></details>

<details>
<summary>Explain OSPF</summary><br><b>
</b></details>

<details>
<summary>What is latency?</summary><br><b>
</b></details>

<details>
<summary>What is bandwidth?</summary><br><b>
</b></details>

<details>
<summary>What is throughput?</summary><br><b>
</b></details>

<details>
<summary>When performing a search query, what is more important, latency or throughput? And how to assure that what managing global infrastructure?</summary><br><b>

Latency. To have a good latency, a search query should be forwarded to the closest datacenter.
</b></details>

<details>
<summary>When uploading a video, what is more important, latency or throughput? And how to assure that?</summary><br><b>

Throughput. To have a good throughput, the upload stream should be routed to an underutilized link.
</b></details>

<details>
<summary>What other considerations (except latency and throughput) are there when forwarding requests?</summary><br><b>

* Keep caches updated (which means the request could be forwarded not to the closest datacenter)
</b></details>

<details>
<summary>Explain Spine & Leaf</summary><br><b>
</b></details>

<details>
<summary>What is Network Congestion? What can cause it?</summary><br><b>
</b></details>

<details>
<summary>What can you tell me about UDP packet format? What about TCP packet format? How is it different?</summary><br><b>
</b></details>

<details>
<summary>What is the exponential backoff algorithm? Where is it used?</summary><br><b>
</b></details>

<details>
<summary>Using Hamming code, what would be the code word for the following data word 100111010001101?</summary><br><b>

00110011110100011101
</b></details>

<details>
<summary>Give examples of protocols found in the application layer</summary><br><b>

* Hypertext Transfer Protocol (HTTP) - used for the webpages on the internet
* Simple Mail Transfer Protocol (SMTP) - email transmission
* Telecommunications Network - (TELNET) - terminal emulation to allow client access to telnet server
* File Transfer Protocol (FTP) - facilitates transfer of files between any two machines
* Domain Name System (DNS) - domain name translation
* Dynamic Host Configuration Protocol (DHCP) - allocates IP addresses, subnet masks and gateways to hosts
* Simple Network Management Protocol (SNMP) - gathers data of devices on the network
</b></details>

<details>
<summary>Give examples of protocols found in the network Layer</summary><br><b>

* Internet Protocol (IP) - assists in routing packets from one machine to another
* Internet Control Message Protocol (ICMP) - lets one know what is going such as error messages and debugging information
</b></details>

<details>
<summary>What is HSTS?</summary><br><b>
HTTP Strict Transport Security is a web server directive that informs user agents and web browsers how to handle its connection through a response header sent at the very beginning and back to the browser. This forces connections over HTTPS encryption, disregarding any script's call to load any resource in that domain over HTTP.

Read more [here](https://www.globalsign.com/en/blog/what-is-hsts-and-how-do-i-use-it#:~:text=HTTP%20Strict%20Transport%20Security%20(HSTS,and%20back%20to%20the%20browser.)
</b></details>

#### Network - Misc

<details>
<summary>What is the Internet? Is it the same as the World Wide Web?</summary><br><b>

The internet refers to network of networks, transferring huge amounts of data around the globe.<br>
The World Wide Web is an application running on millions of server, on top of the internet, accessed through what is know as the web browser
</b></details>

<details>
<summary>What is the ISP?</summary><br><b>

ISP (Internet Service Provider) is the local internet company provider.
</b></details>

## Linux

### Linux Self Assessment

<details>
<summary>What is your experience with Linux?</summary><br><b>

Only you know :)

For example:
* Administration
* Troubleshooting & Debugging
* Storage
* Networking
* Development
* Deployments
</b></details>

<details>
<summary>Explain what each of the following commands does and give an example on how to use it:

  * touch
  * ls
  * rm
  * cat
  * cp
  * mkdir
  * pwd
  * cd
</summary><br><b>

  * touch - update file's timestamp. More commonly used for creating files
  * ls - listing files and directories
  * rm - remove files and directories
  * cat - create, view and concatenate files
  * cp - copy files and directories
  * mkdir - create directories
  * pwd - print current working directory (= at what path the user currently located)
  * cd - change directory
</b></details>

<details>
<summary>What each of the following commands does?

  * cd /
  * cd ~
  * cd
  * cd ..
  * cd .
  * cd -
</summary><br><b>

  * cd / -> change to the root directory
  * cd ~ -> change to your home directory
  * cd -> change to your home directory
  * cd .. -> change to the directory above your current i.e parent directory
  * cd . -> change to the directory you currently in
  * cd - -> change to the last visited path
</b></details>

<details>
<summary>Some of the commands in the previous question can be run with the -r/-R flag. What does it do? Give an example to when you would use it</summary><br><b>

The -r (or -R in some commands) flag allows the user to run a certain command recursively. For example, listing all the files under the following tree is possible when done recursively (`ls -R`):

/dir1/
  dir2/
    file1
    file2
  dir3/
    file3

To list all the files, one can run `ls -R /dir1`
</b></details>

<details>
<summary>Explain each field in the output of `ls -l` command</summary><br><b>
It shows a detailed list of files in a long format. From the left:

* file permissions, number of links, owner name, owner group, file size, timestamp of last modification and directory/file name
</b></details>

<details>
<summary>What are hidden files/directories? How to list them?</summary><br><b>

These are files directly not displayed after performing a standard ls direct listing. An example of these files are .bashrc which are used to execute some scripts. Some also store configuration about services on your host like .KUBECONFIG. The command used to list them is, `ls -a`
</b></details>

<details>
<summary>What do > and < do in terms of input and output for programs?</summary><br><b>
They take in input (<) and output for a given file (>) using stdin and stdout.

`myProgram < input.txt > executionOutput.txt`
</b></details>

<details>
<summary>Explain what each of the following commands does and give an example on how to use it:

  * sed
  * grep
  * cut
  * awk
</summary><br><b>

  - sed: a stream editor. Can be used for various purposes like replacing a word in a file: `sed -i s/salad/burger/g`
  - grep: a search tool. Used to search, count or match a text in a file:
    - searching for any line that contains a word in a file: `grep 'word' file.md`
    - or displaying the total number of times a string appears in a file: `grep -c 'This is a string' file.md`
  - cut: a tool for cutting out selected portions of each line of a file:
    - syntax: `cut OPTION [FILE]`
      - cutting first two bytes from a word in a file: `cut -b 1-2 file.md`, output: `wo`
      </b></details>

<details>
<summary>How to rename the name of a file or a directory?</summary><br><b>

Using the `mv` command.
</b></details>

<details>
<summary>Specify which command would you use (and how) for each of the following scenarios 

  * Remove a directory with files
  * Display the content of a file
  * Provides access to the file /tmp/x for everyone
  * Change working directory to user home directory
  * Replace every occurrence of the word "good" with "great" in the file /tmp/y</summary><br><b>

  - `rm -rf dir`
  - `cat or less`
  - `chmod 777 /tmp/x`
  - `cd ~`
  - `sed -i s/good/great/g /tmp/y`
</b></details>

<details>
<summary>How can you check what is the path of a certain command?</summary><br><b>

  * whereis
  * which
</b></details>

<details>
<summary>What is the difference between these two commands? Will it result in the same output?

```
echo hello world
echo "hello world"
```
</summary><br><b>

The echo command receives two separate arguments in the first execution and in the second execution it gets one argument which is the string "hello world". The output will be the same.
</b></details>

<details>
<summary>Explain piping. How do you perform piping?</summary><br><b>

Using a pipe in Linux, allows you to send the output of one command to the input of another command. For example: `cat /etc/services | wc -l`
</b></details>

<details>
<summary>Fix the following commands:

  * sed "s/1/2/g' /tmp/myFile
  * find . -iname \*.yaml -exec sed -i "s/1/2/g" {} ;
</summary><br><b>

```
sed 's/1/2/g' /tmp/myFile  # sed "s/1/2/g" is also fine
find . -iname "*.yaml" -exec sed -i "s/1/2/g" {} \;
```
</b></details>

<details>
<summary>How to check which commands you executed in the past?</summary><br><b>

history command or .bash_history file
</b></details>

<details>
<summary>Running the command <code>df</code> you get "command not found". What could be wrong and how to fix it?</summary><br><b>
</b>
<p><b>
Most likely the default/generated $PATH was somehow modified or overridden thus not containing <code>/bin/</code> where df would normally go.
This issue could also happen if bash_profile or any configuration file of your interpreter was wrongly modified, causing erratics behaviours.
You would solve this by fixing your $PATH variable:

As to fix it there are several options:

1. Manually adding what you need to your $PATH <code>PATH="$PATH":/user/bin:/..etc</code>
2. You have your weird env variables backed up.
3. You would look for your distro default $PATH variable, copy paste using method #1

Note: There are many ways of getting errors like this: if bash_profile or any configuration file of your interpreter was wrongly modified; causing erratics behaviours,
permissions issues, bad compiled software (if you compiled it by yourself)... there is no answer that will be true 100% of the time.
</b>
</p>
</details>

<details>
<summary>How do you schedule tasks periodically?</summary><br><b>

You can use the commands <code>cron</code> and <code>at</code>.
With cron, tasks are scheduled using the following format:

<code>*/30 * * * * bash myscript.sh</code> Executes the script every 30 minutes.

<minute> <hour> <day of month> <month> <day of week> <command to execute>

The tasks are stored in a cron file, you can write in it using <code>crontab -e</code>

Alternatively if you are using a distro with systemd it's recommended to use systemd timers.
</b></details>

#### Linux - I/O Redirection

<details>
<summary>Explain Linux I/O redirection</summary><br><b>
</b></details>

<details>
<summary>Demonstrate Linux output redirection</summary><br><b>

ls > ls_output.txt
</b></details>

<details>
<summary>Demonstrate Linux stderr output redirection</summary><br><b>

yippiekaiyay 2> ls_output.txt
</b></details>

<details>
<summary>Demonstrate Linux stderr to stdout redirection</summary><br><b>

yippiekaiyay 1>&2 
</b></details>

<details>
<summary>What is the result of running the following command? <code>yippiekaiyay 1>&2 die_hard</code></code></summary><br><b>

An output similar to: `yippikaiyay: command not found...`<br>
The file `die_hard` will not be created
</b></details>

#### Linux FHS

<details>
<summary>In Linux FHS (Filesystem Hierarchy Standard) what is the <code>/</code>?</summary><br><b>

The root of the filesystem. The beginning of the tree.
</b></details>

<details>
<summary>What is stored in each of the following paths?

  - /bin, /sbin, /usr/bin and /usr/sbin
  - /etc
  - /home
  - /var
  - /tmp</summary><br><b>

  * binaries
  * configuration files
  * home directories of the different users
  * files that tend to change and be modified like logs
  * temporary files
</b></details>

<details>
<summary>What is special about the /tmp directory when compared to other directories?</summary><br><b>

`/tmp` folder is cleaned automatically, usually upon reboot.
</b></details>

<details>
<summary>What kind of information one can find in /proc?</summary><br><b>
</b></details>

<details>
<summary>What makes /proc different from other filesystems?</summary><br><b>
</b></details>

<details>
<summary>True or False? only root can create files in /proc</summary><br><b>

False. No one can create file in /proc directly (certain operations can lead to files being created in /proc by the kernel).
</b></details>

<details>
<summary>What can be found in /proc/cmdline?</summary><br><b>

The command passed to the boot loader to run the kernel
</b></details>

<details>
<summary>In which path can you find the system devices (e.g. block storage)?</summary><br><b>
</b></details>

#### Linux - Permissions

<details>
<summary>How to change the permissions of a file?</summary><br><b>

Using the `chmod` command.
</b></details>

<details>
<summary>What does the following permissions mean?:

  * 777
  * 644
  * 750</summary><br><b>

<pre>
777 - You give the owner, group and other: Execute (1), Write (2) and Read (4); 4+2+1 = 7.
644 - Owner has Read (4), Write (2), 4+2 = 6; Group and Other have Read (4).
750 - Owner has x+r+w, Group has Read (4) and Execute (1); 4+1 = 5. Other have no permissions.
</pre>
</b></details>

<details>
<summary>What this command does? <code>chmod +x some_file</code></summary><br><b>
It adds execute permissions to all sets i.e user, group and others
</b></details>

<details>
<summary>Explain what is setgid and setuid</summary><br><b>

* setuid is a linux file permission that permits a user to run a file or program with the permissions of the owner of that file. This is possible by elevation of current user privileges.
* setgid is a process when executed will run as the group that owns the file.
</b></details>

<details>
<summary>What is the purpose of sticky bit?</summary><br><b>
Its a bit that only allows the owner or the root user to delete or modify the file.
</b></details>

<details>
<summary>What the following commands do?

  - chmod
  - chown
  - chgrp</summary><br><b>

  * chmod - changes access permissions to files system objects
  * chown - changes the owner of file system files and directories
  * chgrp - changes the group associated with a file system object
</b></details>

<details>
<summary>What is sudo? How do you set it up?</summary><br><b>
</b></details>

<details>
<summary>True or False? In order to install packages on the system one must be the root user or use the sudo command</summary><br><b>

True
</b></details>

<details>
<summary>Explain what are ACLs. For what use cases would you recommend to use them?</summary><br><b>
</b></details>

<details>
<summary>You try to create a file but it fails. Name at least three different reason as to why it could happen</summary><br><b>

* No more disk space
* No more inodes
* No permissions
</b></details>

<details>
<summary>A user accidentally executed the following <code>chmod -x $(which chmod)</code>. How to fix it?</summary><br><b>
</b></details>

#### Linux - systemd

<details>
<summary>What is systemd?</summary><br>
<b>
Systemd is a daemon (System 'd', d stands for daemon).

A daemon is a program that runs in the background without direct control of the user, although the user can at any time
talk to the daemon.

systemd has many features such as user processes control/tracking, snapshot support, inhibitor locks..

If we visualize the unix/linux system in layers, systemd would fall directly after the linux kernel.<br>
Hardware -> Kernel -> <u>Daemons</u>, System Libraries, Server Display.
</b>
</details>

<details>
<summary>How to start or stop a service?</summary><br><b>

To start a service: `systemctl start <service name>`
To stop a service: `systemctl stop <service name>`
</b></details>

<details>
<summary>How to check the status of a service?</summary><br><b>

`systemctl status <service name>`
</b></details>

<details>
<summary>On a system which uses systemd, how would you display the logs?</summary><br><b>

<code>journalctl</code>
</b></details>

<details>
<summary>Describe how to make a certain process/app a service</summary><br><b>
</b></details>

##### Linux - Troubleshooting & Debugging

<details>
<summary>Where system logs are located?</summary><br><b>

/var/log
</b></details>

<details>
<summary>How to follow file's content as it being appended without opening the file every time?</summary><br><b>

tail -f <file_name>
</b></details>

<details>
<summary>What are you using for troubleshooting and debugging <b>network</b> issues?</summary><br><b>

<code>dstat -t</code> is great for identifying network and disk issues.
<code>netstat -tnlaup</code> can be used to see which processes are running on which ports.
<code>lsof -i -P</code> can be used for the same purpose as netstat.
<code>ngrep -d any metafilter</code> for matching regex against payloads of packets.
<code>tcpdump</code> for capturing packets
<code>wireshark</code> same concept as tcpdump but with GUI (optional).
</b></details>

<details>
<summary>What are you using for troubleshooting and debugging <b>disk & file system</b> issues?</summary><br><b>

<code>dstat -t</code> is great for identifying network and disk issues.
<code>opensnoop</code> can be used to see which files are being opened on the system (in real time).
</b></details>

<details>
<summary>What are you using for troubleshooting and debugging <b>process</b> issues?</summary><br><b>

<code>strace</code> is great for understanding what your program does. It prints every system call your program executed.
</b></details>

<details>
<summary>What are you using for debugging CPU related issues?</summary><br><b>

<code>top</code> will show you how much CPU percentage each process consumes
<code>perf</code> is a great choice for sampling profiler and in general, figuring out what your CPU cycles are "wasted" on
<code>flamegraphs</code> is great for CPU consumption visualization (http://www.brendangregg.com/flamegraphs.html)
</b></details>

<details>
<summary>You get a call from someone claiming "my system is SLOW". What do you do?</summary><br><b>

* Check with `top` for anything unusual
* Run `dstat -t` to check if it's related to disk or network.
* Check if it's network related with `sar`
* Check I/O stats with `iostat`
</b></details>

<details>
<summary>Explain iostat output</summary><br><b>
</b></details>

<details>
<summary>How to debug binaries?</summary><br><b>
</b></details>

<details>
<summary>What is the difference between CPU load and utilization?</summary><br><b>
</b></details>

<details>
<summary>How you measure time execution of a program?</summary><br><b>
</b></details>

#### Linux - Kernel

<details>
<summary>What is a kernel, and what does it do?</summary><br><b>

The kernel is part of the operating system and is responsible for tasks like:

  * Allocating memory
  * Schedule processes
  * Control CPU
</b></details>

<details>
<summary>How do you find out which Kernel version your system is using?</summary><br><b>

`uname -a` command
</b></details>

<details>
<summary>What is a Linux kernel module and how do you load a new module?</summary><br><b>
</b></details>

<details>
<summary>Explain user space vs. kernel space</summary><br><b>

The operating system executes the kernel in protected memory to prevent anyone from changing (and risking it crashing). This is what is known as "Kernel space".
"User space" is where users executes their commands or applications. It's important to create this separation since we can't rely on user applications to not tamper with the kernel, causing it to crash.

Applications can access system resources and indirectly the kernel space by making what is called "system calls".
</b></details>

<details>
<summary>In what phases of kernel lifecycle, can you change its configuration?</summary><br><b>

  * Build time (when it's compiled)
  * Boot time (when it starts)
  * Runtime (once it's already running)
</b></details>

<details>
<summary>Where can you find kernel's configuration?</summary><br><b>

Usually it will reside in `/boot/config-<kernel version>.<os release>.<arch>`
</b></details>

<details>
<summary>Where can you find the file that contains the command passed to the boot loader to run the kernel?</summary><br><b>

`/proc/cmdline`
</b></details>

<details>
<summary>How to list kernel's runtime parameters?</summary><br><b>

`sysctl -a`
</b></details>

<details>
<summary>Will running <code>sysctl -a</code> as a regular user vs. root, produce different result?</summary><br><b>

Yes, you might notice that in most systems, when running `systctl -a` with root, you'll get more runtime parameters compared to executing the same command with a regular user.
</b></details>

<details>
<summary>You would like to enable IPv4 forwarding in the kernel, how would you do it?</summary><br><b>

`sudo sysctl net.ipv4.ip_forward=1`

To make it persistent (applied after reboot for example): insert `net.ipv4.ip_forward = 1` into `/etc/sysctl.conf`

Another way to is to run `echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward`
</b></details>

<details>
<summary>How <code>sysctl</code> applies the changes to kernel's runtime parameters the moment you run sysctl command?</summary><br><b>

If you `strace` the sysctl command you can see it does it by changing the file under /proc/sys/...

In the past it was done with sysctl system call, but it was deprecated at some point.
</b></details>

<details>
<summary>How changes to kernel runtime parameters persist? (applied even after reboot to the system for example)</summary><br><b>

There is a service called `systemd-sysctl` that takes the content of /etc/sysctl.conf and applies it. This is how changes persist, even after reboot, when they are written in /etc/sysctl.conf
</b></details>

<details>
<summary>Are the changes you make to kernel parameters in a container, affects also the kernel parameters of the host on which the container runs?</summary><br><b>

No. Containers have their own /proc filesystem so any change to kernel parameters inside a container, are not affecting the host or other containers running on that host.
</b></details>

#### Linux - SSH

<details>
<summary>What is SSH? How to check if a Linux server is running SSH?</summary><br><b>

[Wikipedia Definition](https://en.wikipedia.org/wiki/SSH_(Secure_Shell)): "SSH or Secure Shell is a cryptographic network protocol for operating network services securely over an unsecured network."

[Hostinger.com Definition](https://www.hostinger.com/tutorials/ssh-tutorial-how-does-ssh-work): "SSH, or Secure Shell, is a remote administration protocol that allows users to control and modify their remote servers over the Internet."

An SSH server will have SSH daemon running. Depends on the distribution, you should be able to check whether the service is running (e.g. systemctl status sshd).
</b></details>

<details>
<summary>Why SSH is considered better than telnet?</summary><br><b>

Telnet also allows you to connect to a remote host but as opposed to SSH where the communication is encrypted, in telnet, the data is sent in clear text, so it doesn't considered to be secured because anyone on the network can see what exactly is sent, including passwords.
</b></details>

<details>
<summary>What is stored in <code>~/.ssh/known_hosts</code>?</summary><br><b>
</b></details>

<details>
<summary>You try to ssh to a server and you get "Host key verification failed". What does it mean?</summary><br><b>

It means that the key of the remote host was changed and doesn't match the one that stored on the machine (in ~/.ssh/known_hosts).
</b></details>

<details>
<summary>What is the difference between SSH and SSL?</summary><br><b>
</b></details>

<details>
<summary>What <code>ssh-keygen</code> is used for?</summary><br><b>
</b></details>

<details>
<summary>What is SSH port forwarding?</summary><br><b>
</b></details>

#### Linux - Globbing, Wildcards

<details>
<summary>What is Globbing?</summary><br><b>
</b></details>

<details>
<summary>What are wildcards? Can you give an example of how to use them?</summary><br><b>
</b></details>

<details>
<summary>Explain what will <code>ls [XYZ]</code> match</summary><br><b>
</b></details>

<details>
<summary>Explain what will <code>ls [^XYZ]</code> match</summary><br><b>
</b></details>

<details>
<summary>Explain what will <code>ls [0-5]</code> match</summary><br><b>
</b></details>

<details>
<summary>What each of the following matches

  - ?
  - *</summary><br><b>

  * The ? matches any single character
  * The * matches zero or more characters
</b></details>

<details>
<summary>What do we grep for in each of the following commands?:

  * <code>grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' some_file</code>
  * <code>grep -E "error|failure" some_file</code>
  * <code>grep '[0-9]$' some_file</code>
</summary><br><b>

1. An IP address
2. The word "error" or "failure"
3. Lines which end with a number
</b></details>

<details>
<summary>Which line numbers will be printed when running `grep '\baaa\b'` on the following content:

aaa
bbb
ccc.aaa
aaaaaa</summary><br><b>

lines 1 and 3.
</b></details>

<details>
<summary>What is the difference single and double quotes?</summary><br><b>
</b></details>

<details>
<summary>What is escaping? What escape character is used for escaping?</summary><br><b>
</b></details>

<details>
<summary>What is an exit code? What exit codes are you familiar with?</summary><br><b>

An exit code (or return code) represents the code returned by a child process to its
parent process.

0 is an exit code which represents success while anything higher than 1 represents error.
Each number has different meaning, based on how the application was developed.

I consider this as a good blog post to read more about it: https://shapeshed.com/unix-exit-codes
</b></details>

#### Linux Boot Process

<details>
<summary>Tell me everything you know about the Linux boot process</summary><br><b>

Another way to ask this: what happens from the moment you turned on the server until you get a prompt
</b></details>

<details>
<summary>What is GRUB2?</summary><br><b>
</b></details>

<details>
<summary>What is Secure Boot?</summary><br><b>
</b></details>

<details>
<summary>What can you find in /boot?</summary><br><b>
</b></details>

##### Linux Disk & Filesystem

<details>
<summary>What's an inode?</summary><br><b>

For each file (and directory) in Linux there is an inode, a data structure which stores meta data
related to the file like its size, owner, permissions, etc.
</b></details>

<details>
<summary>Which of the following is not included in inode:

  * Link count
  * File size
  * File name
  * File timestamp</summary><br><b>

File name (it's part of the directory file)
</b></details>

<details>
<summary>How to check which disks are currently mounted?</summary><br><b>

Run `mount`
</b></details>

<details>
<summary>You run the <code>mount</code> command but you get no output. How would you check what mounts you have on your system?</summary><br><b>

`cat /proc/mounts`
</b></details>

<details>
<summary>What is the difference between a soft link and hard link?</summary><br><b>

Hard link is the same file, using the same inode.
Soft link is a shortcut to another file, using a different inode.
</b></details>

<details>
<summary>True or False? You can create an hard link for a directory</summary><br><b>

False
</b></details>

<details>
<summary>True or False? You can create a soft link between different filesystems</summary><br><b>

True
</b></details>

<details>
<summary>True or False? Directories always have by minimum 2 links</summary><br><b>

True.
</b></details>

<details>
<summary>What happens when you delete the original file in case of soft link and hard link?</summary><br><b>
</b></details>

<details>
<summary>Can you check what type of filesystem is used in /home?</summary><br><b>

There are many answers for this question. One way is running `df -T`
</b></details>

<details>
<summary>What is a swap partition? What is it used for?</summary><br><b>
</b></details>

<details>
<summary>How to create a

  * new empty file
  * a file with text (without using text editor)
  * a file with given size</summary><br><b>
</b></details>

<details>
<summary>You are trying to create a new file but you get "File system is full". You check with df for free space and you see you used only 20% of the space. What could be the problem?</summary><br><b>
</b></details>

<details>
<summary>How would you check what is the size of a certain directory?</summary><br><b>

`du -sh`
</b></details>

<details>
<summary>What is LVM?</summary><br><b>
</b></details>

<details>
<summary>Explain the following in regards to LVM:

  * PV
  * VG
  * LV</summary><br><b>


</b></details>

<details>
<summary>What is NFS? What is it used for?</summary><br><b>
</b></details>

<details>
<summary>What RAID is used for? Can you explain the differences between RAID 0, 1, 5 and 10?</summary><br><b>
</b></details>

<details>
<summary>Describe the process of extending a filesystem disk space</summary><br><b>
</b></details>

<details>
<summary>What is lazy umount?</summary><br><b>
</b></details>

<details>
<summary>What is tmpfs?</summary><br><b>
</b></details>

<details>
<summary>What is stored in each of the following logs?

  * /var/log/messages
  * /var/log/boot.log</summary><br><b>
</b></details>

<details>
<summary>True or False? both /tmp and /var/tmp cleared upon system boot</summary><br><b>

False. /tmp is cleared upon system boot while /var/tmp is cleared every a couple of days or not cleared at all (depends on distro).
</b></details>

#### Linux Performance Analysis

<details>
<summary>How to check what is the current load average?</summary><br><b>

One can use `uptime` or `top`
</b></details>

<details>
<summary>You know how to see the load average, great. but what each part of it means? for example 1.43, 2.34, 2.78</summary><br><b>

[This article](http://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html) summarizes the load average topic in a great way
</b></details>

<details>
<summary>How to check process usage?</summary><br><b>

pidstat
</b></details>

<details>
<summary>How to check disk I/O?</summary><br><b>

`iostat -xz 1`
</b></details>

<details>
<summary>How to check how much free memory a system has? How to check memory consumption by each process?</summary><br><b>

You can use the commands <code>top</code> and <code>free</code>
</b></details>

<details>
<summary>How to check TCP stats?</summary><br><b>

sar -n TCP,ETCP 1
</b></details>

#### Linux Processes

<details>
<summary>how to list all the processes running in your system?</summary><br><b>

`ps -ef`
</b></details>

<details>
<summary>How to run a process in the background and why to do that in the first place?</summary><br><b>

You can achieve that by specifying & at the end of the command.
As to why, since some commands/processes can take a lot of time to finish
execution or run forever, you may want to run them in the background instead of waiting for them to finish before gaining control again in current session.
</b></details>

<details>
<summary>How can you find how much memory a specific process consumes?</summary><br><b>
<code>
mem()
{                                                                                                      
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}
</code>
[Source](https://stackoverflow.com/questions/3853655/in-linux-how-to-tell-how-much-memory-processes-are-using)
</b></details>

<details>
<summary>What signal is used by default when you run 'kill *process id*'?</summary><br><b>
<pre>
The default signal is SIGTERM (15). This signal kills
process gracefully which means it allows it to save current
state configuration.
</pre>
</b></details>

<details>
<summary>What signals are you familiar with?</summary><br><b>

SIGTERM - default signal for terminating a process
SIGHUP - common usage is for reloading configuration
SIGKILL - a signal which cannot caught or ignored

To view all available signals run `kill -l`
</b></details>

<details>
<summary>What <code>kill 0</code> does?</summary><br><b>
</b></details>

<details>
<summary>What <code>kill -0 <PID></code> does?</summary><br><b>
</b></details>

<details>
<summary>What is a trap?</summary><br><b>
</b></details>

<details>
<summary>Every couple of days, a certain process stops running. How can you look into why it's happening?</summary><br><b>
</b></details>

<details>
<summary>What happens when you press ctrl + c?</summary><br><b>
</b></details>

<details>
<summary>What is a Daemon in Linux?</summary><br><b>

A background process. Most of these processes are waiting for requests or set of conditions to be met before actually running anything.
Some examples: sshd, crond, rpcbind.
</b></details>

<details>
<summary>What are the possible states of a process in Linux?</summary><br><b>
<pre>
Running (R)
Uninterruptible Sleep (D) - The process is waiting for I/O
Interruptible Sleep (S)
Stopped (T)
Dead (x)
Zombie (z)
</pre>
</b></details>

<details>
<summary>How do you kill a process in D state?</summary><br><b>
</b></details>

<details>
<summary>What is a zombie process?</summary><br><b>

A process which has finished to run but has not exited.

One reason it happens is when a parent process is programmed incorrectly. Every parent process should execute wait() to get the exit code from the child process which finished to run. But when the parent isn't checking for the child exit code, the child process can still exists although it finished to run.
</b></details>

<details>
<summary>How to get rid of zombie processes?</summary><br><b>

You can't kill a zombie process the regular way with `kill -9` for example as it's already dead.

One way to kill zombie process is by sending SIGCHLD to the parent process telling it to terminate its child processes. This might not work if the parent process wasn't programmed properly. The invocation is `kill -s SIGCHLD [parent_pid]`

You can also try closing/terminating the parent process. This will make the zombie process a child of init (1) which does periodic cleanups and will at some point clean up the zombie process.
</b></details>

<details>
<summary>How to find all the

  * Processes executed/owned by a certain user
  * Process which are Java processes
  * Zombie Processes
</summary><br><b>

If you mention at any point ps command with arugments, be familiar with what these arguments does exactly.
</b></details>

<details>
<summary>What is the init process?</summary><br><b>
It is the first process executed by the kernel during the booting of a system. It is a daemon process which runs till the system is shutdown. That is why, it is the parent of all the processes
</b></details>

<details>
<summary>Can you describe how processes are being created?</summary><br><b>
</b></details>

<details>
<summary>How to change the priority of a process? Why would you want to do that?</summary><br><b>
</b></details>

<details>
<summary>Can you explain how network process/connection is established and how it's terminated?></summary><br></b>
</b></details>

<details>
<summary>What <code>strace</code> does? What about <code>ltrace</code>?</summary><br><b>
</b></details>

<details>
<summary>Find all the files which end with '.yml' and replace the number 1 in 2 in each file</summary><br><b>

find /some_dir -iname \*.yml -print0 | xargs -0 -r sed -i "s/1/2/g"
</b></details>

<details>
<summary>You run ls and you get "/lib/ld-linux-armhf.so.3 no such file or directory". What is the problem?</summary><br><b>

The ls executable is built for an incompatible architecture.
</b></details>

<details>
<summary>How would you split a 50 lines file into 2 files of 25 lines each?</summary><br><b>

You can use the <code>split</code> command this way: <code>split -l 25 some_file</code>
</b></details>

<details>
<summary>What is a file descriptor? What file descriptors are you familiar with?</summary><br><b>
Kerberos
File descriptor, also known as file handler, is a unique number which identifies an open file in the operating system.

In Linux (and Unix) the first three file descriptors are:

  * 0 - the default data stream for input
  * 1 - the default data stream for output
  * 2 - the default data stream for output related to errors

This is a great article on the topic: https://www.computerhope.com/jargon/f/file-descriptor.htm
</b></details>

<details>
<summary>What is NTP? What is it used for?</summary><br><b>
</b></details>

<details>
<summary>Explain Kernel OOM</summary><br><b>
</b></details>

##### Linux Security

<details>
<summary>What is chroot? In what scenarios would you consider using it?</summary><br><b>
</b></details>

<details>
<summary>What is SELiunx?</summary><br><b>
</b></details>

<details>
<summary>What is Kerberos?</summary><br><b>
</b></details>

<details>
<summary>What is nftables?</summary><br><b>
</b></details>

<details>
<summary>What firewalld daemon is responsible for?</summary><br><b>
</b></details>

<details>
<summary>Do you have experience with hardening servers? Can you describe the process?</summary><br><b>
</b></details>

##### Linux - Networking

<details>
<summary>How to list all the interfaces?</summary><br><b>

```
ip link show
```
</b></details>

<details>
<summary>What is the loopback (lo) interface?</summary><br><b>

The loopback interface is a special, virtual network interface that your computer uses to communicate with itself. It is used mainly for diagnostics and troubleshooting, and to connect to servers running on the local machine.
</b></details>

<details>
<summary>What the following commands are used for?

  * ip addr
  * ip route
  * ip link
  * ping
  * netstat
  * traceroute</summary><br><b>
</b></details>

<details>
<summary>What is a network namespace? What is it used for?</summary><br><b>
</b></details>

<details>
<summary>How to check if a certain port is being used?</summary><br><b>

One of the following would work:

```
netstat -tnlp | grep <port_number>
lsof -i -n -P | grep <port_number>
```
</b></details>

<details>
<summary>How can you turn your Linux server into a router?</summary><br><b>
</b></details>

<details>
<summary>What is a virtual IP? In what situation would you use it?</summary><br><b>
</b></details>

<details>
<summary>True or False? The MAC address of an interface is assigned/set by the OS</summary><br><b>

False
</b></details>

<details>
<summary>Can you have more than one default gateway in a given system?</summary><br><b>

Technically, yes.
</b></details>

<details>
<summary>What is telnet and why is it a bad idea to use it in production? (or at all)</summary><br><b>

Telnet is a type of client-server protocol that can be used to open a command line on a remote computer, typically a server.
By default, all the data sent and received via telnet is transmitted in clear/plain text, therefore it should not be used as it does not encrypt any data between the client and the server.
</b></details>

<details>
<summary>What is the routing table? How do you view it?</summary><br><b>
</b></details>

<details>
<summary>How can you send an HTTP request from your shell?</summary><br><b>
<br>
Using nc is one way<br>
</b></details>

<details>
<summary>What are packet sniffers? Have you used one in the past? If yes, which packet sniffers have you used and for what purpose?</summary><br><b>
It is a network utility that analyses and may inject tasks into the data-stream travelling over the targeted network.
</b></details>

<details>
<summary>How to list active connections?</summary><br><b>
</b></details>

<details>
<summary>How to trigger neighbor discovery in IPv6?</summary><br><b>

One way would be `ping6 ff02::1`
</b></details>

<details>
<summary>What is network interface bonding and do you know how it's performed in Linux?</summary><br><b>
</b></details>

<details>
<summary>What network bonding modes are there?</summary><br><b>

There a couple of modes:

  * balance-rr: round robing bonding
  * active-backup: a fault tolerance mode where only one is active
  * balance-tlb: Adaptive transmit load balancing
  * balance-alb: Adaptive load balancing
</b></details>

<details>
<summary>What is a bridge? How it's added in Linux OS?</summary><br><b>
</b></details>

##### Linux - DNS

<details>
<summary>How to check what is the hostname of the system?</summary><br><b>

`cat /etc/hostname`

You can also run `hostnamectl` or `hostname` but that might print only a temporary hostname. The one in the file is the permanent one.
</b></details>

<details>
<summary>What the file <code>/etc/resolv.conf</code> is used for? What does it include?</summary><br><b>
</b></details>

<details>
<summary>What commands are you using for performing DNS queries (or troubleshoot DNS related issues)?</summary><br><b>

You can specify one or more of the following:

 * <code>dig</code>
 * <code>host</code>
 * <code>nslookup</code>
</b></details>

<details>
<summary>You run <code>dig codingshell.com</code> and get the following result: 

```
ANSWER SECTION:
codingshell.com.	3515	IN	A	185.199.109.153
```

What is the meaning of the number 3515?
</summary><br><b>

This is the TTL. When you lookup for an address using a domain/host name, your OS is performing DNS resolution by contacting DNS name servers to get the IP address of the host/domain you are looking for.<br>
When you get a reply, this reply in cached in your OS for a certain period of time. This is period of time is also known as TTL and this is the meaning of 3515 number - it will be cached for 3515 seconds before removed from the cache and during that period of time, you'll get the value from the cache instead of asking DNS name servers for the address again.
</b></details>

##### Linux - Packaging

<details>
<summary>Do you have experience with packaging? (as in building packages) Can you explain how does it works?</summary><br><b>
</b></details>

<details>
<summary>How packages installation/removal is performed on the distribution you are using?</summary><br><b>

The answer depends on the distribution being used.

In Fedora/CentOS/RHEL/Rocky it can be done with `rpm` or `dnf` commands.
In Ubuntu it can be done with the `apt` command.
</b></details>

<details>
<summary>RPM: explain the spec format (what it should and can include)</summary><br><b>
</b></details>

<details>
<summary>How do you list the content of a package without actually installing it?</summary><br><b>
</b></details>

<details>
<summary>How to know to which package a file on the system belongs to? Is it a problem if it doesn't belongs to any package?</summary><br><b>
</b></details>

<details>
<summary>Where repositories are stored? (based on the distribution you are using)</summary><br><b>
</b></details>

<details>
<summary>What is an archive? How do you create one in Linux?</summary><br><b>
</b></details>

<details>
<summary>How to extract the content of an archive?</summary><br><b>
</b></details>

<details>
<summary>Why do we need package managers? Why not simply creating archives and publish them?</summary><br><b>

Package managers allow you to manage packages lifecycle as in installing, removing and updating the packages.<br>
In addition, you can specify in a spec how a certain package will be installed - where to copy the files, which commands to run prior to the installation, post the installation, etc.
</b></details>

#### Linux DNF

<details>
<summary>What is DNF?</summary><br><b>

From the [repo](https://github.com/rpm-software-management/dnf):

"Dandified YUM (DNF) is the next upcoming major version of YUM. It does package management using RPM, libsolv and hawkey libraries."

Official [docs](https://dnf.readthedocs.io/en/latest/)

</b></details>

<details>
<summary>How to look for a package that provides the command /usr/bin/git? (the package isn't necessarily installed)</summary><br><b>

dnf provides /usr/bin/git
</b></details>

##### Linux Applications and Services

<details>
<summary>What can you find in /etc/services?</summary><br><b>
</b></details>

<details>
<summary>How to make sure a Service starts automatically after a reboot or crash?</summary><br><b>

Depends on the init system.

Systemd: <code> systemctl enable [service_name] </code>
System V: <code> update-rc.d [service_name] </code> and add this line <code> id:5678:respawn:/bin/sh /path/to/app </code> to /etc/inittab
Upstart: add Upstart init script at /etc/init/service.conf
</b></details>

<details>
<summary>You run <code>ssh 127.0.0.1</code> but it fails with "connection refused". What could be the problem?</summary><br><b>

1. SSH server is not installed
2. SSH server is not running
</b></details>

<details>
<summary>How to print the shared libraries required by a certain program? What is it useful for?</summary><br><b>
</b></details>

<details>
<summary>What is CUPS?</summary><br><b>
</b></details>

<details>
<summary>What types of web servers are you familiar with?</summary><br><b>

Nginx, Apache httpd.
</b></details>

##### Linux Users and Groups

<details>
<summary>What is a "superuser" (or root user)? How is it different from regular users?</summary><br><b>
</b></details>

<details>
<summary>How do you create users? Where user information is stored?</summary><br>

Command to create users is `useradd` 

Syntax:
`useradd [options] Username`

There are 2 configuration files, which stores users information

1. `/etc/passwd` - Users information like, username, shell etc is stored in this file 

2. `/etc/shadow` - Users password is stored in encrypted format 
</details>

<details>
<summary>Which file stores information about groups?</summary><br>

`/etc/groups` file stores the group name, group ID, usernames which are in secondary group.
</details>

<details>
<summary>How do you change/set the password of a user?</summary><br>

`passwd <username>` is the command to set/change password of a user.
</details>

<details>
<summary>Which file stores users passwords? Is it visible for everyone?</summary><br>

`/etc/shadow` file holds the passwords of the users in encryted format. NO, it is only visble to the `root` user
</details>

<details>
<summary>Do you know how to create a new user without using adduser/useradd command?</summary><br>

YES, we can create new user by manually adding an entry in the `/etc/passwd` file. 

For example, if we need to create a user called `john`. 

Step 1: Add an entry to `/etc/passwd` file, so user gets created.

`echo "john:x:2001:2001::/home/john:/bin/bash" >> /etc/passwd` 

Step 2: Add an entry to `/etc/group` file, because every user belong to the primary group that has same name as the username.

`echo "john:x:2001:" >> /etc/group`

Step 3: Verify if the user got created

`id john`

</details>

<details>
<summary>What information is stored in /etc/passwd? explain each field</summary><br>

`/etc/passwd` is a configuration file, which contains users information. Each entry in this file has, 7 fields,

`username:password:UID:GID:Comment:home directory:shell`

`username` - The name of the user.

`password` - This field is actually a placeholder of the password field. Due to security concerns, this field does not contain the password, just a placeholder (x) to the encrypted password stored in `/etc/shadow` file.

`UID` - User ID of the user.

`GID` - Group ID 

`Comment` - This field is to provide description about the user.

`home directory` - Abousulte path of the user's home directory. This directory gets created once the user is added.

`shell` - This field contains the absolute path of the shell that will be used by the respective user.
</details>

<details>
<summary>How to add a new user to the system without providing him the ability to log-in into the system?</summary><br><b>

`adduser user_name --shell=/bin/false --no-create-home`
You can also add a user and then edit /etc/passwd.
</b></details>

<details>
<summary>How to switch to another user? How to switch to the root user?</summary><br><b>

su command.
Use su - to switch to root
</b></details>

<details>
<summary>What is the UID the root user? What about a regular user?</summary><br>

UID of root user is 0

Default values of UID_MIN and UID_MAX in `/etc/login.defs`
`UID_MIN` is `1000`
`UID_MAX` is `60000`

Actually, we can change this value. But UID < 1000 are reserved for system accounts.
Therefore, as per the default configuration, for regular user UID starts from `1000`. 
</details>

<details>
<summary>What can you do if you lost/forogt the root password?</summary><br><b>

Re-install the OS IS NOT the right answer :)
</b></details>

<details>
<summary>What is /etc/skel?</summary><br>

`/etc/skel` is a directory, that contains files or directories, so when a new user is created, these files/directories created under `/etc/skel` will be copied to user's home directory.
</details>

<details>
<summary>How to see a list of who logged-in to the system?</summary><br><b>

Using the `last` command.
</b></details>

<details>
<summary>Explain what each of the following commands does:

  * useradd
  * usermod
  * whoami
  * id</summary><br><b>

  `useradd` - Command for creating new users 
  `usermod` - Modify the users setting
  `whoami`  - Outputs, the username that we are currently logged in
  `id`      - Prints the  
</b></details>

<details>
<summary>You run <code>grep $(whoami) /etc/passwd</code> but the output is empty. What might be a possible reason for that?</summary><br><b>

The user you are using isn't defined locally but originates from services like LDAP.<br>
You can verify with: `getent passwd`
</b></details>

#### Linux Hardware

<details>
<summary>Where can you find information on the processor (like number of CPUs)?</summary><br><b>

/proc/cpuinfo

You can also use `nproc` for number of processors
</b></details>

<details>
<summary>How can you print information on the BIOS, motherboard, processor and RAM?</summary><br><b>

dmidecoode
</b></details>

<details>
<summary>How can you print all the information on connected block devices in your system?</summary><br><b>

lsblk
</b></details>

<details>
<summary>True or False? In user space, applications don't have full access to hardware resources</summary><br><b>

True. Only in kernel space they have full access to hardware resources.
</b></details>

#### Linux - Security

<details>
<summary>How do you create a private key for a CA (certificate authority)?</summary><br><b>

One way is using openssl this way:

`openssl genrsa -aes256 -out ca-private-key.pem 4096`
</b></details>

<details>
<summary>How do you create a public key for a CA (certificate authority)?</summary><br><b>

`openssl req -new -x509 -days 730 -key [private key file name] -sha256 -out ca.pem`

If using the private key from the previous question then the command would be:

`openssl req -new -x509 -days 730 -key ca-private-key.pem -sha256 -out ca.pem`
</b></details>

#### Linux - Namespaces

<details>
<summary>What types of namespaces are there in Linux?</summary><br><b>

  - Process ID namespaces: these namespaces include independent set of process IDs
  - Mount namespaces: Isolation and control of mountpoints
  - Network namespaces: Isolates system networking resources such as routing table, interfaces, ARP table, etc.
  - UTS namespaces: Isolate host and domains
  - IPC namespaces: Isolates interprocess communications
  - User namespaces: Isolate user and group IDs
  - Time namespaces: Isolates time machine
</b></details>

<details>
<summary>True or False? In every PID (Process ID) namespace the first process assigned with the process id number 1</summary><br><b>

True. Inside the namespace it's PID 1 while to the parent namespace the PID is a different one.
</b></details>

<details>
<summary>True or False? In a child PID namespace all processes are aware of parent PID namespace and processes and the parent PID namespace has no visibility of child PID namespace processes</summary><br><b>

False. The opposite is true. Parent PID namespace is aware and has visibility of processes in child PID namespace and child PID namespace has no visibility as to what is going on in the parent PID namespace.
</b></details>

<details>
<summary>True or False? By default, when creating two separate network namespaces, a ping from one namespace to another will work fine</summary><br><b>

False. Network namespace has its own interfaces and routing table. There is no way (without creating a bridge for example) for one network namespace to reach another.
</b></details>

<details>
<summary>True or False? With UTS namespaces, processes may appear as if they run on different hosts and domains while running on the same host</summary><br><b>

True
</b></details>

<details>
<summary>True or False? It's not possible to have a root user with ID 0 in child user namespaces</summary><br><b>

False. In every child user namespace, it's possible to have a separate root user with uid of 0.
</b></details>

<details>
<summary>What time namespaces are used for?</summary><br><b>

In time namespaces processes can use different system time.
</b></details>

#### Linux - Virtualization

<details>
<summary>What virtualization solutions are available for Linux?</summary><br><b>

  * [KVM](https://www.linux-kvm.org/page/Main_Page)
  * [XEN](http://www.xen.org/)
  * [VirtualBox](https://www.virtualbox.org/)
  * [Linux-VServer](http://linux-vserver.org/Welcome_to_Linux-VServer.org)
  * [User-mode Linux](http://user-mode-linux.sourceforge.net/)
  * ...
</b></details>

<details>
<summary>What is KVM?</summary><br><b>

Is an open source virtualization technology used to operate on x86 hardware. 

From the official [docs](https://www.linux-kvm.org/page/Main_Page)
Recommended read:
  * [Red Hat Article - What is KVM?](https://www.redhat.com/en/topics/virtualization/what-is-KVM)
</b></details>

<details>
<summary>What is Libvirt?</summary><br><b>

It's an open source collection of software used to manage virtual machines. It can be used with: KVM, Xen, LXC and others. It's also called Libvirt Virtualization API.

From the official [docs](https://libvirt.org/)
Hypervisor supported [docs](https://libvirt.org/drivers.html)
</b></details>

#### Linux - AWK

<details>
<summary>What the <code>awk</code> command does? Have you used it? What for?</summary><br><b>

From Wikipedia: "AWK is domain-specific language designed for text processing and typically used as a data extraction and reporting tool"
</b></details>

<details>
<summary>How to print the 4th column in a file?</summary><br><b>

`awk '{print $4}' file`
</b></details>

<details>
<summary>How to print every line that is longer than 79 characters?</summary><br><b>

`awk 'length($0) > 79' file`
</b></details>

<details>
<summary>What the <code>lsof</code> command does? Have you used it? What for?</summary><br><b>
</b></details>

<details>
<summary>What is the difference between find and locate?</summary><br><b>
</b></details>

<details>
<summary>How a user process performs a privileged operation, such as reading from the disk?</summary><br><b>

Using system calls
</b></details>

#### Linux - System Calls

<details>
<summary>What is a system call? What system calls are you familiar with?</summary><br><b>
</b></details>

<details>
<summary>How a program executes a system call?</summary><br><b>

- A program executes a trap instruction. The instruction jump into the kernel while raising the privileged level to kernel space.
- Once in kernel space, it can perform any privileged operation
- Once it's finished, it calls a "return-from-trap" instruction which returns to user space while reducing back the privilege level to user space.
</b></details>

<details>
<summary>Explain the fork() system call</summary><br><b>

fork() is used for creating a new process. It does so by cloning the calling process but the child process has its own PID and any memory locks, I/O operations and semaphores are not inherited.
</b></details>

<details>
<summary>What is the return value of fork()?</summary><br><b>

  - On success, the PID of the child process in parent and 0 in child process
  - On error, -1 in the parent
</b></details>

<details>
<summary>Name one reason for fork() to fail</summary><br><b>

Not enough memory to create a new process
</b></details>

<details>
<summary>Why do we need the wait() system call?</summary><br><b>

wait() is used by a parent process to wait for the child process to finish execution.
If wait is not used by a parent process then a child process might become a zombie process.
</b></details>

<details>
<summary>How the kernel notifies the parent process about child process termination?</summary><br><b>

The kernel notifies the parent by sending the SIGCHLD to the parent.
</b></details>

<details>
<summary>How the waitpid() is different from wait()?</summary><br><b>

The waitpid() is a non-blocking version of the wait() function.<br>
It also supports using library routine (e.g. system()) to wait a child process without messing up with other children processes for which the process has not waited.
</b></details>

<details>
<summary>True or False? The wait() system call won't return until the child process has run and exited</summary><br><b>

True in most cases though there are cases where wait() returns before the child exits.
</b></details>

<details>
<summary>Explain the exec() system call</summary><br><b>

It transforms the current running program into another program.<br>
Given the name of an executable and some arguments, it loads the code and static data from the specified executable and overwrites its current code segment and current static code data. After initializing its memory space (like stack and heap) the OS runs the program passing any arguments as the argv of that process.
</b></details>

<details>
<summary>True or False? A successful call to exec() never returns</summary><br><b>

True<br>
Since a succesful exec replace the current process, it can't return anything to the process that made the call.
</b></details>

<details>
<summary>What system call is used for listing files?</summary><br><b>
</b></details>

<details>
<summary>What system calls are used for creating a new process?</summary><br><b>

fork(), exec() and the wait() system call is also included in this workflow.
</b></details>

<details>
<summary>What execve() does?</summary><br><b>

Executes a program. The program is passed as a filename (or path) and must be a binary executable or a script.
</b></details>

<details>
<summary>What is the return value of malloc?</summary><br><b>
</b></details>

<details>
<summary>Explain the pipe() system call. What does it used for?</summary><br><b>

[Unix pipe implementation](https://toroid.org/unix-pipe-implementation)

"Pipes provide a unidirectional interprocess communication channel. A pipe has a read end and a write end. Data written to the write end of a pipe can be read from the read end of the pipe.
A pipe is created using pipe(2), which returns two file descriptors, one referring to the read end of the pipe, the other referring to the write end."
</b></details>

<details>
<summary>What happens when you execute <code>ls -l</code>?</summary><br><b>

* Shell reads the input using getline() which reads the input file stream and stores into a buffer as a string
* The buffer is broken down into tokens and stored in an array this way: {"ls", "-l", "NULL"}
* Shell checks if an expansion is required (in case of ls *.c)

* Once the program in memory, its execution starts. First by calling readdir()

Notes:

* getline() originates in GNU C library and used to read lines from input stream and stores those lines in the buffer
</b></details>

<details>
<summary>What happens when you execute <code>ls -l *.log</code>?</summary><br><b>
</b></details>

<details>
<summary>What readdir() system call does?</summary><br><b>
</b></details>

<details>
<summary>What exactly the command <code>alias x=y</code> does?</summary><br><b>
</b></details>

<details>
<summary>Why running a new program is done using the fork() and exec() system calls? why a different API wasn't developed where there is one call to run a new program?</summary><br><b>

This way provides a lot of flexibility. It allows the shell for example, to run code after the call to fork() but before the call to exec(). Such code can be used to alter the environment of the program it about to run.
</b></details>

<details>
<summary>Describe shortly what happens when you execute a command in the shell</summary><br><b>

The shell figures out, using the PATH variable, where the executable of the command resides in the filesystem. It then calls fork() to create a new child process for running the command. Once the fork was executed successfully, it calls a variant of exec() to execute the command and finally, waits the command to finish using wait(). When the child completes, the shell returns from wait() and prints out the prompt again.
</b></details>

#### Linux Filesystem & Files

<details>
<summary>How to create a file of a certain size?</summary><br><b>

There are a couple of ways to do that:

  * dd if=/dev/urandom of=new_file.txt bs=2MB count=1
  * truncate -s 2M new_file.txt
  * fallocate -l 2097152 new_file.txt
</b></details>

<details>
<summary>What does the following block do?:

```
open("/my/file") = 5
read(5, "file content")
```
</summary><br><b>

These system calls are reading the file <code>/my/file</code> and 5 is the file descriptor number.
</b></details>

<details>
<summary>Describe three different ways to remove a file (or its content)</summary><br><b>
</b></details>

<details>
<summary>What is the difference between a process and a thread?</summary><br><b>
</b></details>

<details>
<summary>What is context switch?</summary><br><b>

From [wikipedia](https://en.wikipedia.org/wiki/Context_switch): a context switch is the process of storing the state of a process or thread, so that it can be restored and resume execution at a later point
</b></details>

<details>
<summary>You found there is a server with high CPU load but you didn't find a process with high CPU. How is that possible?</summary><br><b>
</b></details>

##### Linux Advanced - Networking

<details>
<summary>When you run <code>ip a</code> you see there is a device called 'lo'. What is it and why do we need it?</summary><br><b>
</b></details>

<details>
<summary>What the <code>traceroute</code> command does? How does it works?</summary><br><b>

Another common way to task this questions is "what part of the tcp header does traceroute modify?"
</b></details>

<details>
<summary>What is network bonding? What types are you familiar with?</summary><br><b>
</b></details>

<details>
<summary>How to link two separate network namespaces so you can ping an interface on one namespace from the second one?</summary><br><b>
</b></details>

<details>
<summary>What are cgroups?</summary><br><b>
</b></details>

<details>
<summary>Explain Process Descriptor and Task Structure</summary><br><b>
</b></details>

<details>
<summary>What are the differences between threads and processes?</summary><br><b>
</b></details>

<details>
<summary>Explain Kernel Threads</summary><br><b>
</b></details>

<details>
<summary>What happens when socket system call is used?</summary><br><b>

This is a good article about the topic: https://ops.tips/blog/how-linux-creates-sockets
</b></details>

<details>
<summary>You executed a script and while still running, it got accidentally removed. Is it possible to restore the script while it's still running?</summary><br><b>
</b></details>

#### Linux Memory

<details>
<summary>What is the difference between MemFree and MemAvailable in /proc/meminfo?</summary><br><b>

MemFree - The amount of unused physical RAM in your system
MemAvailable - The amount of available memory for new workloads (without pushing system to use swap) based on MemFree, Active(file), Inactive(file), and SReclaimable.
</b></details>

<details>
<summary>What is the difference between paging and swapping?</summary><br><b>
</b></details>

<details>
<summary>Explain what is OOM killer</summary><br><b>
</b></details>

#### Distribution

<details>
<summary>What is a Linux distribution?</summary><br><b>
</b></details>

<details>
<summary>What Linux distributions are you familiar with?</summary><br><b>
</b></details>

<details>
<summary>What are the components of a Linux distribution?</summary><br><b>

* Kernel
* Utilities
* Services
* Software/Packages Management
</b></details>

#### Linux - Sed

<details>
<summary>Using sed, extract the date from the following line: <code>201.7.19.90 - - [05/Jun/1985:13:42:99 +0000] "GET /site HTTP/1.1" 200 32421</code></summary><br><b>

`echo $line | sed 's/.*\[//g;s/].*//g;s/:.*//g'`
</b></details>


#### Linux - Misc

<details>
<summary>How to generate a random string?</summary><br><b>

One way is to run the following: `cat /proc/sys/kernel/random/uuid`
</b></details>

<details>
<summary>What is a Linux distribution?</summary><br><b>

* A collection of packages - kernel, GNU, third party apps, ...
* Sometimes distributions store some information on the distribution in `/etc/*-release` file
    * For example for Red Hat distribution it will be `/etc/redhat-release` and for Amazon it will be `/etc/os-release`
    * `lsb_release` is a common command you can use in multiple different distributions
    </b></details>

<details>
<summary>Name 5 commands which are two letters long</summary><br><b>

ls, wc, dd, df, du, ps, ip, cp, cd ...
</b></details>

<details>
<summary>What ways are there for creating a new empty file?</summary><br><b>

  * touch new_file
  * echo "" > new_file
</b></details>

<details>
<summary>How `cd -` works? How does it knows the previous location?</summary><br><b>

$OLDPWD
</b></details>

<details>
<summary>List three ways to print all the files in the current directory</summary><br><b>

* ls
* find .
* echo *
</b></details>

<details>
<summary>How to count the number of lines in a file? What about words?</summary><br><b>
</b></details>

<details>
<summary>You define x=2 in /etc/bashrc and x=6 ~/.bashrc you then login to the system. What would be the value of x?</summary><br><b>
</b></details>

<details>
<summary>What is the difference between man and info?</summary><br><b>

A good answer can be found [here](https://askubuntu.com/questions/9325/what-is-the-difference-between-man-and-info-documentation)
</b></details>

<details>
<summary>Explain "environment variables". How do you list all environment variables?</summary><br><b>
</b></details>

<details>
<summary>What is a TTY device?</summary><br><b>
</b></details>

<details>
<summary>How to create your own environment variables?</summary><br><b>

`X=2` for example. But this will persist to new shells. To have it in new shells as well, use `export X=2`
</b></details>

<details>
<summary>What a double dash (--) mean?</summary><br><b>

It's used in commands to mark the end of commands options. One common example is when used with git to discard local changes: `git checkout -- some_file`
</b></details>

<details>
<summary>Wildcards are implemented on user or kernel space?</summary><br><b>
</b></details>

<details>
<summary>If I plug a new device into a Linux machine, where on the system, a new device entry/file will be created?</summary><br><b>

/dev
</b></details>

<details>
<summary>Why there are different sections in man? What is the difference between the sections?</summary><br><b>
</b></details>

<details>
<summary>What is User-mode Linux?</summary><br><b>
</b></details>

<details>
<summary>Under which license Linux is distributed? </summary><br><b>

GPL v2
</b></details>

## Operating System

### Operating System Exercises

|Name|Topic|Objective & Instructions|Solution|Comments|
|--------|--------|------|----|----|
|Fork 101|Fork|[Link](exercises/os/fork_101.md)|[Link](exercises/os/solutions/fork_101_solution.md)
|Fork 102|Fork|[Link](exercises/os/fork_102.md)|[Link](exercises/os/solutions/fork_102_solution.md)

### Operating System - Self Assessment

<details>
<summary>What is an operating system?</summary><br><b>

From the book "Operating Systems: Three Easy Pieces":

"responsible for making it easy to run programs (even allowing you to seemingly run many at the same time), allowing programs to share memory, enabling programs to interact with devices, and other fun stuff like that".
</b></details>

#### Operating System - Process

<details>
<summary>Can you explain what is a process?</summary><br><b>

A process is a running program. A program is one or more instructions and the program (or process) is executed by the operating system.
</b></details>

<details>
<summary>If you had to design an API for processes in an operating system, what would this API look like?</summary><br><b>

It would support the following:

* Create - allow to create new processes
* Delete - allow to remove/destroy processes
* State - allow to check the state of the process, whether it's running, stopped, waiting, etc.
* Stop - allow to stop a running process
</b></details>

<details>
<summary>How a process is created?</summary><br><b>

* The OS is reading program's code and any additional relevant data
* Program's code is loaded into the memory or more specifically, into the address space of the process.
* Memory is allocated for program's stack (aka run-time stack). The stack also initialized by the OS with data like argv, argc and parameters to main()
* Memory is allocated for program's heap which is required for dynamically allocated data like the data structures linked lists and hash tables
* I/O initialization tasks are performed, like in Unix/Linux based systems where each process has 3 file descriptors (input, output and error)
* OS is running the program, starting from main()
</b></details>

<details>
<summary>True or False? The loading of the program into the memory is done eagerly (all at once)</summary><br><b>

False. It was true in the past but today's operating systems perform lazy loading which means only the relevant pieces required for the process to run are loaded first.
</b></details>

<details>
<summary>What are different states of a process?</summary><br><b>

* Running - it's executing instructions
* Ready - it's ready to run but for different reasons it's on hold
* Blocked - it's waiting for some operation to complete. For example I/O disk request
</b></details>

<details>
<summary>What are some reasons for a process to become blocked?</summary><br><b>

  - I/O operations (e.g. Reading from a disk)
  - Waiting for a packet from a network
</b></details>

<details>
<summary>What is Inter Process Communication (IPC)?</summary><br><b>
</b></details>

<details>
<summary>What is "time sharing"?</summary><br><b>

Even when using a system with one physical CPU, it's possible to allow multiple users to work on it and run programs. This is possible with time sharing where computing resources are shared in a way it seems to the user the system has multiple CPUs but in fact it's simply one CPU shared by applying multiprogramming and multi-tasking.
</b></details>

<details>
<summary>What is "space sharing"?</summary><br><b>

Somewhat the opposite of time sharing. While in time sharing a resource is used for a while by one entity and then the same resource can be used by another resource, in space sharing the space is shared by multiple entities but in a way where it's not being transferred between them.<br>
It's used by one entity until this entity decides to get rid of it. Take for example storage. In storage, a file is yours until you decide to delete it.
</b></details>

<details>
<summary>What component determines which process runs at a given moment in time?</summary><br><b>

CPU scheduler
</b></details>

#### Operating System - Memory

<details>
<summary>What is "virtual memory" and what purpose it serves?</summary><br><b>
</b></details>

<details>
<summary>What is demand paging?</summary><br><b>
</b></details>

<details>
<summary>What is copy-on-write or shadowing?</summary><br><b>
</b></details>

<details>
<summary>What is a kernel, and what does it do?</summary><br><b>

The kernel is part of the operating system and is responsible for tasks like:

  * Allocating memory
  * Schedule processes
  * Control CPU
</b></details>

<details>
<summary>True or False? Some pieces of the code in the kernel are loaded into protected areas of the memory so applications can't overwritten them</summary><br><b>

True
</b></details>

<details>
<summary>What is POSIX?</summary><br><b>
</b></details>

<details>
<summary>Explain what is Semaphore and what its role in operating systems</summary><br><b>
</b></details>

<details>
<summary>What is cache? What is buffer?</summary><br><b>

Buffer: Reserved place in RAM which is used to hold data for temporary purposes
Cache: Cache is usually used when processes reading and writing to the disk to make the process faster by making similar data used by different programs easily accessible.
</b></details>

## Virtualization

<details>
<summary>What is Virtualization?</summary><br><b>

Virtualization uses software to create an abstraction layer over computer hardware that allows the hardware elements of a single computer—processors, memory, storage and more - to be divided into multiple virtual computers, commonly called virtual machines (VMs).
</b></details>

<details>
<summary>What is a hypervisor?</summary><br><b>

Red Hat: "A hypervisor is software that creates and runs virtual machines (VMs). A hypervisor, sometimes called a virtual machine monitor (VMM), isolates the hypervisor operating system and resources from the virtual machines and enables the creation and management of those VMs."

Read more [here](https://www.redhat.com/en/topics/virtualization/what-is-a-hypervisor)
</b></details>

<details>
<summary>What types of hypervisors are there?</summary><br><b>

Hosted hypervisors and bare-metal hypervisors.
</b></details>

<details>
<summary>What are the advantages and disadvantges of bare-metal hypervisor over a hosted hypervisor?</summary><br><b>

Due to having its own drivers and a direct access to hardware components, a baremetal hypervisor will often have better performances along with stability and scalability.

On the other hand, there will probably be some limitation regarding loading (any) drivers so a hosted hypervisor will usually benefit from having a better hardware compatibility.
</b></details>

<details>
<summary>What types of virtualization are there?</summary><br><b>

Operating system virtualization
Network functions virtualization
Desktop virtualization
</b></details>

<details>
<summary>Is containerization is a type of Virtualization?</summary><br><b>

Yes, it's a operating-system-level virtualization, where the kernel is shared and allows to use multiple isolated user-spaces instances.
</b></details>

<details>
<summary>How the introduction of virtual machines changed the industry and the way applications were deployed?</summary><br><b>
The introduction of virtual machines allowed companies to deploy multiple business applications on the same hardware while each application is separated from each other in secured way, where each is running on its own separate operating system.
</b></details>


## Monitoring

<details>
<summary>Explain monitoring. What is it? What its goal?</summary><br><b>

Google: "Monitoring is one of the primary means by which service owners keep track of a system’s health and availability".
</b></details>

<details>
<summary>What is wrong with the old approach of watching for a specific value and trigger an email/phone alert while value is exceeded?</summary><br><b>

This approach require from a human to always check why the value exceeded and how to handle it while today, it is more effective to notify people only when they need to take an actual action.
If the issue doesn't require any human intervention, then the problem can be fixed by some processes running in the relevant environment.
</b></details>

<details>
<summary>What types of monitoring outputs are you familiar with and/or used in the past?</summary><br><b>

Alerts<br>
Tickets<br>
Logging<br>
</b></details>

<details>
<summary>What is the difference between infrastructure monitoring and application monitoring? (methods, tools, ...)</summary><br><b>
</b></details>

## Prometheus

<details>
<summary>What is Prometheus? What are some of Prometheus's main features?</summary><br><b>
</b></details>

<details>
<summary>In what scenarios it might be better to NOT use Prometheus?</summary><br><b>

From Prometheus documentation: "if you need 100% accuracy, such as for per-request billing".
</b></details>

<details>
<summary>Describe Prometheus architecture and components</summary><br><b>
</b></details>

<details>
<summary>Can you compare Prometheus to other solutions like InfluxDB for example?</summary><br><b>
</b></details>

<details>
<summary>What is an Alert?</summary><br><b>
</b></details>

<details>
<summary>Describe the following Prometheus components:

  * Prometheus server
  * Push Gateway
  * Alert Manager</summary><br><b>

Prometheus server is responsible for scraping and storing the data<br>
Push gateway is used for short-lived jobs<br>
Alert manager is responsible for alerts ;)
</b></details>

<details>
<summary>What is an Instance? What is a Job?</summary><br><b>
</b></details>

<details>
<summary>What core metrics types Prometheus supports?</summary><br><b>
</b></details>

<details>
<summary>What is an exporter? What is it used for?</summary><br><b>
</b></details>

<details>
<summary>Which Prometheus best practices are you familiar with?. Name at least three</summary><br><b>
</b></details>

<details>
<summary>How to get total requests in a given period of time?</summary><br><b>
</b></details>

<details>
<summary>What HA in Prometheus means?</summary><br><b>
</b></details>

<details>
<summary>How do you join two metrics?</summary><br><b>
</b></details>

<details>
<summary>How to write a query that returns the value of a label?</summary><br><b>
</b></details>

<details>
<summary>How do you convert cpu_user_seconds to cpu usage in percentage?</summary><br><b>
</b></details>


## Mongo

<details>
<summary>What are the advantages of MongoDB? Or in other words, why choosing MongoDB and not other implementation of NoSQL?</summary><br><b>

MongoDB advantages are as followings:
- Schemaless
- Easy to scale-out
- No complex joins
- Structure of a single object is clear

</b></details>

<details>
<summary>What is the difference between SQL and NoSQL?</summary><br><b>

The main difference is that SQL databases are structured (data is stored in the form of
tables with rows and columns - like an excel spreadsheet table) while NoSQL is
unstructured, and the data storage can vary depending on how the NoSQL DB is set up, such
as key-value pair, document-oriented, etc.
</b></details>

<details>
<summary>In what scenarios would you prefer to use NoSQL/Mongo over SQL?</summary><br><b>

  * Heterogeneous data which changes often
  * Data consistency and integrity is not top priority
  * Best if the database needs to scale rapidly
</b></details>

<details>
<summary>What is a document? What is a collection?</summary><br><b>
</b></details>

<details>
<summary>What is an aggregator?</summary><br><b>
</b></details>

<details>
<summary>What is better? Embedded documents or referenced?</summary><br><b>
</b></details>

<details>
<summary>Have you performed data retrieval optimizations in Mongo? If not, can you think about ways to optimize a slow data retrieval?</summary><br><b>
</b></details>

##### Queries

<details>
<summary>Explain this query: <code>db.books.find({"name": /abc/})</code></summary><br><b>
</b></details>

<details>
<summary>Explain this query: <code>db.books.find().sort({x:1})</code></summary><br><b>
</b></details>

<details>
<summary>What is the difference between find() and find_one()?</code></summary><br><b>
</b></details>

<details>
<summary>How can you export data from Mongo DB?</code></summary><br><b>

* mongoexport
* programming languages
</b></details>

## SQL

### SQL Self Assessment

<details>
<summary>What is SQL?</summary><br><b>

SQL (Structured Query Language) is a standard language for relational databases (like MySQL, MariaDB, ...).<br>
It's used for reading, updating, removing and creating data in a relational database.
</b></details>

<details>
<summary>How is SQL Different from NoSQL</summary><br><b>

The main difference is that SQL databases are structured (data is stored in the form of
tables with rows and columns - like an excel spreadsheet table) while NoSQL is
unstructured, and the data storage can vary depending on how the NoSQL DB is set up, such
as key-value pair, document-oriented, etc.
</b></details>

<details>
<summary>When is it best to use SQL? NoSQL?</summary><br><b>

SQL - Best used when data integrity is crucial. SQL is typically implemented with many
businesses and areas within the finance field due to it's ACID compliance.

NoSQL - Great if you need to scale things quickly. NoSQL was designed with web applications
in mind, so it works great if you need to quickly spread the same information around to
multiple servers

Additionally, since NoSQL does not adhere to the strict table with columns and rows structure
that Relational Databases require, you can store different data types together.
</b></details>

##### Practical SQL - Basics

For these questions, we will be using the Customers and Orders tables shown below:

**Customers**

Customer_ID | Customer_Name | Items_in_cart | Cash_spent_to_Date
------------ | ------------- | ------------- | -------------
100204 | John Smith | 0 | 20.00
100205 | Jane Smith | 3 | 40.00
100206 | Bobby Frank | 1 | 100.20

**ORDERS**

Customer_ID | Order_ID | Item | Price | Date_sold
------------ | ------------- | ------------- | ------------- | -------------
100206 | A123 | Rubber Ducky | 2.20 | 2019-09-18
100206 | A123 | Bubble Bath | 8.00 | 2019-09-18
100206 | Q987 | 80-Pack TP | 90.00 | 2019-09-20
100205 | Z001 | Cat Food - Tuna Fish | 10.00 | 2019-08-05
100205 | Z001 | Cat Food - Chicken | 10.00 | 2019-08-05
100205 | Z001 | Cat Food - Beef | 10.00 | 2019-08-05
100205 | Z001 | Cat Food - Kitty quesadilla | 10.00 | 2019-08-05
100204 | X202 | Coffee | 20.00 | 2019-04-29

<details>
<summary>How would I select all fields from this table?</summary><br><b>

Select * <br>
From Customers;
</b></details>

<details>
<summary>How many items are in John's cart?</summary><br><b>

Select Items_in_cart <br>
From Customers <br>
Where Customer_Name = "John Smith";
</b></details>

<details>
<summary>What is the sum of all the cash spent across all customers?</summary><br><b>

Select SUM(Cash_spent_to_Date) as SUM_CASH <br>
From Customers;
</b></details>

<details>
<summary>How many people have items in their cart?</summary><br><b>

Select count(1) as Number_of_People_w_items <br>
From Customers <br>
where Items_in_cart > 0;
</b></details>

<details>
<summary>How would you join the customer table to the order table?</summary><br><b>

You would join them on the unique key. In this case, the unique key is Customer_ID in
both the Customers table and Orders table
</b></details>

<details>
<summary>How would you show which customer ordered which items?</summary><br><b>

Select c.Customer_Name, o.Item <br>
From Customers c <br>
Left Join Orders o <br>
  On c.Customer_ID = o.Customer_ID;

</b></details>

<details>
<summary>Using a with statement, how would you show who ordered cat food, and the total amount of money spent?</summary><br><b>

with cat_food as ( <br>
Select Customer_ID, SUM(Price) as TOTAL_PRICE <br>
From Orders <br>
Where Item like "%Cat Food%" <br>
Group by Customer_ID <br>
) <br>
Select Customer_name, TOTAL_PRICE <br>
From Customers c <br>
Inner JOIN cat_food f <br>
  ON c.Customer_ID = f.Customer_ID <br>
where c.Customer_ID in (Select Customer_ID from cat_food);

Although this was a simple statement, the "with" clause really shines when
a complex query needs to be run on a table before joining to another. With statements are nice,
because you create a pseudo temp when running your query, instead of creating a whole new table.

The Sum of all the purchases of cat food weren't readily available, so we used a with statement to create
the pseudo table to retrieve the sum of the prices spent by each customer, then join the table normally.
</b></details>

<details>
<summary>Which of the following queries would you use?

```
SELECT count(*)                             SELECT count(*)
FROM shawarma_purchases                     FROM shawarma_purchases
WHERE                               vs.     WHERE
  YEAR(purchased_at) == '2017'              purchased_at >= '2017-01-01' AND
                                            purchased_at <= '2017-31-12'
```
</summary><br><b>

```
SELECT count(*)
FROM shawarma_purchases
WHERE
  purchased_at >= '2017-01-01' AND
  purchased_at <= '2017-31-12'
```

When you use a function (`YEAR(purchased_at)`) it has to scan the whole database as opposed to using indexes and basically the column as it is, in its natural state.
</b></details>


## Elastic

<details>
<summary>What is the Elastic Stack?</summary><br><b>

The Elastic Stack consists of:

  * Elasticsearch
  * Kibana
  * Logstash
  * Beats
  * Elastic Hadoop
  * APM Server

Elasticserach, Logstash and Kibana are also known as the ELK stack.
</b></details>

<details>
<summary>Explain what is Elasticsearch</summary><br><b>

From the official [docs](https://www.elastic.co/guide/en/elasticsearch/reference/current/documents-indices.html):

"Elasticsearch is a distributed document store. Instead of storing information as rows of columnar data, Elasticsearch stores complex data structures that have been serialized as JSON documents"
</b></details>

<details>
<summary>What is Logstash?</summary><br><b>

From the [blog](https://logit.io/blog/post/the-top-50-elk-stack-and-elasticsearch-interview-questions):

"Logstash is a powerful, flexible pipeline that collects, enriches and transports data. It works as an extract, transform & load (ETL) tool for collecting log messages."
</b></details>

<details>
<summary>Explain what beats are</summary><br><b>

Beats are lightweight data shippers. These data shippers installed on the client where the data resides.
Examples of beats: Filebeat, Metricbeat, Auditbeat. There are much more.<br>
</b></details>

<details>
<summary>What is Kibana?</summary><br><b>

From the official docs:

"Kibana is an open source analytics and visualization platform designed to work with Elasticsearch. You use Kibana to search, view, and interact with data stored in Elasticsearch indices. You can easily perform advanced data analysis and visualize your data in a variety of charts, tables, and maps."
</b></details>

<details>
<summary>Describe what happens from the moment an app logged some information until it's displayed to the user in a dashboard when the Elastic stack is used</summary><br><b>

The process may vary based on the chosen architecture and the processing you may want to apply to the logs. One possible workflow is:

1. The data logged by the application is picked by filebeat and sent to logstash
2. Logstash process the log based on the defined filters. Once done, the output is sent to Elasticsearch
2. Elasticsearch stores the document it got and the document is indexed for quick future access
4. The user creates visualizations in Kibana which based on the indexed data
5. The user creates a dashboard which composed out of the visualization created in the previous step
</b></details>

##### Elasticsearch

<details>
<summary>What is a data node?</summary><br><b>

This is where data is stored and also where different processing takes place (e.g. when you search for a data).
</b></details>

<details>
<summary>What is a master node?</summary><br><b>

Par of a master node responsibilites:
  * Track the status of all the nodes in the cluster
  * Verify replicas are working and the data is available from every data node.
  * No hot nodes (no data node that works much harder than other nodes)

While there can be multiple master nodes in reality only of them is the elected master node.
</b></details>

<details>
<summary>What is an ingest node?</summary><br><b>

A node which responsible for parsing the data. In case you don't use logstash then this node can recieve data from beats and parse it, similarly to how it can be parsed in Logstash.
</b></details>

<details>
<summary>What is Coordinating node?</summary><br><b>

A Coordinating node responsible for routing requests out and in to the cluser (data nodes).
</b></details>

<details>
<summary>How data is stored in elasticsearch?</summary><br><b>

* Data is stored in an index
* The index is spread across the cluster using shards
</b></details>

<details>
<summary>What is an Index?</summary><br><b>

Index in Elastic is in most cases compared to a whole database from the SQL/NoSQL world.<br>
You can choose to have one index to hold all the data of your app or have multiple indices where each index holds different type of your app (e.g. index for each service your app is running).

The official docs also offer a great explanation (in general, it's really good documentation, as every project should have):

"An index can be thought of as an optimized collection of documents and each document is a collection of fields, which are the key-value pairs that contain your data"
</b></details>

<details>
<summary>Explain Shards</summary><br><b>

An index is split into shards and documents are hashed to a particular shard. Each shard may be on a different node in a cluster and each one of the shards is a self contained index.<br>
This allows Elasticsearch to scale to an entire cluster of servers.
</b></details>

<details>
<summary>What is an Inverted Index?</summary><br><b>

From the official docs:

"An inverted index lists every unique word that appears in any document and identifies all of the documents each word occurs in."
</b></details>

<details>
<summary>What is a Document?</summary><br><b>

Continuing with the comparison to SQL/NoSQL a Document in Elastic is a row in table in the case of SQL or a document in a collection in the case of NoSQL.
As in NoSQL a Document is a JSON object which holds data on a unit in your app. What is this unit depends on the your app. If your app related to book then each document describes a book. If you are app is about shirts then each document is a shirt.
</b></details>

<details>
<summary>You check the health of your elasticsearch cluster and it's red. What does it mean? What can cause the status to be yellow instead of green?</summary><br><b>

Red means some data is unavailable.
Yellow can be caused by running single node cluster instead of multi-node.
</b></details>

<details>
<summary>True or False? Elasticsearch indexes all data in every field and each indexed field has the same data structure for unified and quick query ability</summary><br><b>

False.
From the official docs:

"Each indexed field has a dedicated, optimized data structure. For example, text fields are stored in inverted indices, and numeric and geo fields are stored in BKD trees."
</b></details>

<details>
<summary>What reserved fields a document has?</summary><br><b>

  * _index
  * _id
  * _type
</b></details>

<details>
<summary>Explain Mapping</summary><br><b>
</b></details>

<details>
<summary>What are the advantages of defining your own mapping? (or: when would you use your own mapping?)</summary><br><b>

* You can optimize fields for partial matching
* You can define custom formats of known fields (e.g. date)
* You can perform language-specific analysis
</b></details>

<details>
<summary>Explain Replicas</summary><br><b>

In a network/cloud environment where failures can be expected any time, it is very useful and highly recommended to have a failover mechanism in case a shard/node somehow goes offline or disappears for whatever reason.
To this end, Elasticsearch allows you to make one or more copies of your index’s shards into what are called replica shards, or replicas for short.
</b></details>

<details>
<summary>Can you explain Term Frequency & Document Frequency?</summary><br><b>

Term Frequency is how often a term appears in a given document and Document Frequency is how often a term appears in all documents. They both are used for determining the relevance of a term by calculating Term Frequency / Document Frequency.
</b></details>

<details>
<summary>You check "Current Phase" under "Index lifecycle management" and you see it's set to "hot". What does it mean?</summary><br><b>

"The index is actively being written to".
More about the phases [here](https://www.elastic.co/guide/en/elasticsearch/reference/7.6/ilm-policy-definition.html)
</b></details>

<details>
<summary>What this command does? <code>curl -X PUT "localhost:9200/customer/_doc/1?pretty" -H 'Content-Type: application/json' -d'{ "name": "John Doe" }'</code></summary><br><b>

It creates customer index if it doesn't exists and adds a new document with the field name which is set to "John Dow". Also, if it's the first document it will get the ID 1.
</b></details>

<details>
<summary>What will happen if you run the previous command twice? What about running it 100 times?</code></summary><br><b>

1. If name value was different then it would update "name" to the new value
2. In any case, it bumps version field by one
</b></details>

<details>
<summary>What is the Bulk API? What would you use it for?</code></summary><br><b>

Bulk API is used when you need to index multiple documents. For high number of documents it would be significantly faster to use rather than individual requests since there are less network roundtrips.
</b></details>

##### Query DSL

<details>
<summary>Explain Elasticsearch query syntax (Booleans, Fields, Ranges)</summary><br><b>
</b></details>

<details>
<summary>Explain what is Relevance Score</summary><br><b>
</b></details>

<details>
<summary>Explain Query Context and Filter Context</summary><br><b>

From the official docs:

"In the query context, a query clause answers the question “How well does this document match this query clause?” Besides deciding whether or not the document matches, the query clause also calculates a relevance score in the _score meta-field."

"In a filter context, a query clause answers the question “Does this document match this query clause?” The answer is a simple Yes or No — no scores are calculated. Filter context is mostly used for filtering structured data"
</b></details>

<details>
<summary>Describe how would an architecture of production environment with large amounts of data would be different from a small-scale environment</summary><br><b>

There are several possible answers for this question. One of them is as follows:

A small-scale architecture of elastic will consist of the elastic stack as it is. This means we will have beats, logstash, elastcsearch and kibana.<br>
A production environment with large amounts of data can include some kind of buffering component (e.g. Reddis or RabbitMQ) and also security component such as Nginx.
</b></details>

##### Logstash

<details>
<summary>What are Logstash plugins? What plugins types are there?</summary><br><b>

  * Input Plugins - how to collect data from different sources
  * Filter Plugins - processing data
  * Output Plugins - push data to different outputs/services/platforms
</b></details>

<details>
<summary>What is grok?</summary><br><b>

A logstash plugin which modifies information in one format and immerse it in another.
</b></details>

<details>
<summary>How grok works?</summary><br><b>
</b></details>

<details>
<summary>What grok patterns are you familiar with?</summary><br><b>
</b></details>

<details>
<summary>What is `_grokparsefailure?`</summary><br><b>
</b></details>

<details>
<summary>How do you test or debug grok patterns?</summary><br><b>
</b></details>

<details>
<summary>What are Logstash Codecs? What codecs are there?</summary><br><b>
</b></details>

##### Kibana

<details>
<summary>What can you find under "Discover" in Kibana?</summary><br><b>

The raw data as it is stored in the index. You can search and filter it.
</b></details>

<details>
<summary>You see in Kibana, after clicking on Discover, "561 hits". What does it mean?</summary><br><b>

Total number of documents matching the search results. If not query used then simply the total number of documents.
</b></details>

<details>
<summary>What can you find under "Visualize"?</summary><br><b>

"Visualize" is where you can create visual representations for your data (pie charts, graphs, ...)
</b></details>

<details>
<summary>What visualization types are supported/included in Kibana?</summary><br><b>
</b></details>

<details>
<summary>What visualization type would you use for statistical outliers</summary><br><b>
</b></details>

<details>
<summary>Describe in detail how do you create a dashboard in Kibana</summary><br><b>
</b></details>

#### Filebeat

<details>
<summary>What is Filebeat?</summary><br><b>
</b></details>

<details>
<summary>If one is using ELK, is it a must to also use filebeat? In what scenarios it's useful to use filebeat?</summary><br><b>
</b></details>

<details>
<summary>What is a harvester?</summary><br><b>

Read [here](https://www.elastic.co/guide/en/beats/filebeat/current/how-filebeat-works.html#harvester)
</b></details>

<details>
<summary>True or False? a single harvester harvest multiple files, according to the limits set in filebeat.yml</summary><br><b>

False. One harvester harvests one file.
</b></details>

<details>
<summary>What are filebeat modules?</summary><br><b>
</b></details>

#### Elastic Stack

<details>
<summary>How do you secure an Elastic Stack?</summary><br><b>

You can generate certificates with the provided elastic utils and change configuration to enable security using certificates model.
</b></details>




## Kafka

<details>
<summary>What is Kafka?</summary><br><b>
</b></details>

<details>
<summary>In Kafka, how to automatically balance brokers leadership of partitions in a cluster?

  * Enable auto leader election and reduce the imbalance
percentage ratio
  * Manually rebalance by using kafkat
  * Configure group.initial.rebalance.delay.ms to 3000
  * All of the above
</summary><br><b>
</b></details>

## Cassandra

<details>
<summary>When running a cassandra cluster, how often do you need to run nodetool repair in order to keep the cluster consistent?

  * Within the columnFamily GC-grace Once a week
  * Less than the compacted partition minimum bytes
  * Depended on the compaction strategy
</summary><br><b>
</b></details>

## HTTP

<details>
<summary>What is HTTP?</summary><br><b>
</b></details>

<details>
<summary>Describe HTTP request lifecycle</summary><br><b>

* Resolve host by request to DNS resolver
* Client SYN
* Server SYN+ACK
* Client SYN
* HTTP request
* HTTP response
</b></details>

<details>
<summary>True or False? HTTP is stateful</summary><br><b>

False. It doesn't maintain state for incoming request.
</b></details>

<details>
<summary>How HTTP request looks like?</summary><br><b>

It consists of:

 * Request line - request type
 * Headers - content info like length, enconding, etc.
 * Body (not always included)
</b></details>

<details>
<summary>What HTTP method types are there?</summary><br><b>

* GET
* POST
* HEAD
* PUT
* DELETE
* CONNECT
* OPTIONS
* TRACE
</b></details>

<details>
<summary>What HTTP response codes are there?</summary><br><b>

* 1xx - informational
* 2xx - Success
* 3xx - Redirect
* 4xx - Error, client fault
* 5xx - Error, server fault
</b></details>

<details>
<summary>What is HTTPS?</summary><br><b>
</b></details>

<details>
<summary>Explain HTTP Cookies</summary><br><b>

HTTP is stateless. To share state, we can use Cookies.

TODO: explain what is actually a Cookie
</b></details>

<details>
<summary>What is HTTP Pipelining?</summary><br><b>
</b></details>

<details>
<summary>You get "504 Gateway Timeout" error from an HTTP server. What does it mean?</summary><br><b>

The server didn't receive a response from another server it communicates with in a timely manner.
</b></details>

<details>
<summary>What is a proxy?</summary><br><b>
</b></details>

<details>
<summary>What is a reverse proxy?</summary><br><b>
</b></details>

<details>
<summary>What is CDN?</summary><br><b>
</b></details>

<details>
<summary>When you publish a project, you usually publish it with a license. What types of licenses are you familiar with and which one do you prefer to use?</summary><br><b>
</b></details>

<details>
<summary>Explain what is "X-Forwarded-For"</summary><br><b>

[Wikipedia](https://en.wikipedia.org/wiki/X-Forwarded-For): "The X-Forwarded-For (XFF) HTTP header field is a common method for identifying the originating IP address of a client connecting to a web server through an HTTP proxy or load balancer."
</b></details>

#### Load Balancers

<details>
<summary>What is a load balancer?</summary><br><b>

A load balancer accepts (or denies) incoming network traffic from a client, and based on some criteria (application related, network, etc.) it distributes those communications out to servers (at least one).
</b></details>

<details>
<summary>Why to used a load balancer?</summary><br><b>

* Scalability - using a load balancer, you can possibly add more servers in the backend to handle more requests/traffic from the clients, as opposed to using one server.
* Redundancy - if one server in the backend dies, the load balancer will keep forwarding the traffic/requests to the second server so users won't even notice one of the servers in the backend is down.
</b></details>

<details>
<summary>What load balancer techniques/algorithms are you familiar with?</summary><br><b>

  * Round Robin
  * Weighted Round Robin
  * Least Connection
  * Weighted Least Connection
  * Resource Based
  * Fixed Weighting
  * Weighted Response Time
  * Source IP Hash
  * URL Hash
</b></details>

<details>
<summary>What are the drawbacks of round robin algorithm in load balancing?</summary><br><b>

  * A simple round robin algorithm knows nothing about the load and the spec of each server it forwards the requests to. It is possible, that multiple heavy workloads requests will get to the same server while other servers will got only lightweight requests which will result in one server doing most of the work, maybe even crashing at some point because it unable to handle all the heavy workloads requests by its own.
  * Each request from the client creates a whole new session. This might be a problem for certain scenarios where you would like to perform multiple operations where the server has to know about the result of operation so basically, being sort of aware of the history it has with the client. In round robin, first request might hit server X, while second request might hit server Y and ask to continue processing the data that was processed on server X already.
</b></details>

<details>
<summary>What is an Application Load Balancer?</summary><br><b>
</b></details>

<details>
<summary>In which scenarios would you use ALB?</summary><br><b>
</b></details>

<details>
<summary>At what layers a load balancer can operate?</summary><br><b>

L4 and L7
</b></details>

<details>
<summary>Can you perform load balancing without using a dedicated load balancer instance?</summary><br><b>

Yes, you can use DNS for performing load balancing.
</b></details>

<details>
<summary>What is DNS load balancing? What its advantages? When would you use it?</summary><br><b>
</b></details>

#### Load Balancers - Sticky Sessions

<details>
<summary>What are sticky sessions? What are their pros and cons?</summary><br><b>

Recommended read:
  * [Red Hat Article](https://access.redhat.com/solutions/900933)

Cons:
  * Can cause uneven load on instance (since requests routed to the same instances)
Pros:
  * Ensures in-proc sessions are not lost when a new request is created
</b></details>

<details>
<summary>Name one use case for using sticky sessions</summary><br><b>

You would like to make sure the user doesn't lose the current session data.
</b></details>

<details>
<summary>What sticky sessions use for enabling the "stickiness"?</summary><br><b>

Cookies. There are application based cookies and duration based cookies.
</b></details>

<details>
<summary>Explain application-based cookies</summary><br><b>

* Generated by the application and/or the load balancer
* Usually allows to include custom data
</b></details>

<details>
<summary>Explain duration-based cookies</summary><br><b>

* Generated by the load balancer
* Session is not sticky anymore once the duration elapsed
</b></details>

#### Load Balancers - Load Balancing Algorithms

<details>
<summary>Explain each of the following load balancing techniques

  * Round Robin
  * Weighted Round Robin
  * Least Connection
  * Weighted Least Connection
  * Resource Based
  * Fixed Weighting
  * Weighted Response Time
  * Source IP Hash
  * URL Hash
</summary><br><b>
</b></details>

<details>
<summary>Explain use case for connection draining?</summary><br><b>
To ensure that a Classic Load Balancer stops sending requests to instances that are de-registering or unhealthy, while keeping the existing connections open, use connection draining. This enables the load balancer to complete in-flight requests made to instances that are de-registering or unhealthy.

**The maximum timeout value can be set between 1 and 3,600 seconds on both GCP and AWS.**

</b></details>