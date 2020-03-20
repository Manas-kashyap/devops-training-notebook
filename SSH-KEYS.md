# **SSH**



**The SSH protocol (also referred to as Secure Shell) is a method for secure remote login from one computer to another. It provides several alternative options for strong authentication, and it protects the communications security and integrity with strong encryption. It is a secure alternative to the non-protected login protocols (such as [telnet](https://www.ssh.com/ssh/telnet), rlogin) and insecure file transfer methods (such as [FTP](https://www.ssh.com/ssh/ftp/)).**

**The protocol is used in corporate networks for:** 

- 
- providing secure access for users and automated processes

- 
- interactive and automated file transfers

- 
- issuing remote commands

- 
- managing network infrastructure and other mission-critical system components.


 

SSH is significantly more secure than the other protocols such as telnet because of the encryption of the data. There are **three major encryption techniques** used by SSH:

- 
- **Symmetrical encryption:** This encryption works on the principle of the generation of a single key for encrypting as well as decrypting the data. The secret key generated is distributed among the clients and the hosts for a secure connection. Symmetrical encryption is the most basic encryption and performs best when data is encrypted and decrypted on a single machine.  

- 
- **Asymmetrical encryption:** This encryption is more secure because it generates two different keys: Public and Private key. A public key is distributed to different host machines while the private key is kept securely on the client machine. A secure connection is established using this public-private key pair.  

- 
- **Hashing:** One-way hashing is an authentication technique which ensures that the received data is unaltered and comes from a genuine sender. A hash function is used to generate a hash code from the data. It is impossible to regenerate the data from the hash value. The hash value is calculated at the sender as well as the receiver’s end. If the hash values match, the data is authentic.  


 


 

# SSH Config File

The [ssh](https://www.ssh.com/ssh/) program on a host receives its configuration from either the command line or from configuration files `~/.ssh/config` and `/etc/ssh/ssh_config`.



[Command-line](https://www.ssh.com/ssh/command) options take precedence over configuration files. The user-specific configuration file `~/.ssh/config` is used next. Finally, the global `/etc/ssh/ssh_config` file is used. The first obtained value for each configuration parameter will be used.

https://www.ssh.com/ssh/config


 

# SSH Keys

An *SSH key* is an access credential in the [SSH protocol](https://www.ssh.com/ssh/protocol/). Its function is similar to that of user names and passwords, but the keys are primarily used for automated processes and for implementing single sign-on by system administrators and power users.

SSH keys enable the automation that makes modern cloud services and other computer-dependent services possible and cost-effective. They offer convenience and improved security when properly managed.

Functionally SSH keys resemble passwords. They grant access and control who can access what. In [identity and access management](https://www.ssh.com/iam/), they need similar policies, provisioning, and termination as user accounts and passwords. One cannot have confidentiality, integrity, or any guarantees of continued availability of systems without controlling SSH keys.

Technically the keys are cryptographic keys using a [public key cryptosystem](https://www.ssh.com/cryptography). However, functionally they are authentication credentials and need to be managed as such.


 

## How does authentication in SSH work?

Initializing a connection in SSH consists of:

- 
- Negotiating the version of the protocol to use

- 
- Negotiating cryptographic algorithms and other options to use

- 
- Negotiating a one-time session key for encrypting the rest of the session

- 
- Authenticating the server host using its host key

- 
- Authenticating the user using a password, public key authentication, or other means.


 

### Public key authentication

The key-based authentication mechanism in SSH is called [public key authentication](https://www.ssh.com/ssh/public-key-authentication). Essentially, some session-specific data is signed using the private identity key. The signature is then sent to the server that checks if the key used for signing is configured as an authorized key. The server then verifies the digital signature using the public key in the authorized key. The identity key is never sent to the server.

The essential thing in public key authentication is that it allows one server to access another server without having to type in a password. This powerful feature is why it is so widely used for file transfers (using the [SFTP](https://www.ssh.com/ssh/sftp/) protocol) and configuration management. It is also commonly used by system administrators for single sign-on.


 

https://www.ssh.com/ssh/key


 

## **Changing the SSH port in the server**

By default, the SSH server still runs in port 22. However, there are occasions when it is run in a different port. Testing use is one reason. Running multiple configurations on the same host is another. Rarely, it may also be run without root privileges, in which case it must be run in a non-privileged port (i.e., port number >= 1024).

The port number can be configured by changing the `Port 22` directive in [/etc/ssh/sshd_config](https://www.ssh.com/ssh/sshd_config). It can also be specified using the `-p ` option to [sshd](https://www.ssh.com/ssh/sshd). The SSH client and [sftp](https://www.ssh.com/ssh/sftp) programs also support the `-p ` option.

## **Specifying SSH port number on the command line**

The `-p ` option can be used to specify the port number to connect to when using the `ssh` command on Linux. The `-P ` (note: capital P) option can be used with [SFTP](https://www.ssh.com/ssh/sftp) and `scp`. The SSH port number command line setting overrides any value configured in configuration files.





## Enabling SSH access via iptables

[Iptables](https://en.wikipedia.org/wiki/Iptables) is a host firewall built into the Linux kernel. It is typically configured to protect the server by preventing access to any ports that have not been expressly opened.

If `iptables` is enabled on the server, the following commands can be used to permit incoming SSH access. They must be run as root.

```
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
```

If you want to save the rules permanently, on some systems that can be done with the command:

```
service iptables save
```





# SSH Port Forwarding/Tunnelling



**SSH** sessions permit tunneling network connections by default and there are three types of SSH port forwarding: **local**, **remote** and **dynamic** port forwarding.



### Local SSH Port Forwarding

This type of port forwarding lets you connect from your local computer to a remote server. Assuming you are behind a restrictive firewall, or blocked by an outgoing firewall from accessing an application running on port **3000** on your remote server.

You can forward a local port (e.g **8080**) which you can then use to access the application locally as follows. The `-L` flag defines the port forwarded to the remote host and remote port.

```
$ ssh admin@server1.example.com -L 8080: server1.example.com:3000
```

### Remote SSH Port Forwarding

Remote port forwarding allows you to connect from your remote machine to the local computer. By default, SSH does not permit remote port forwarding. You can enable this using the **GatewayPorts** directive in you SSHD main configuration file **/etc/ssh/sshd_config** on the remote host.

Open the file for editing using your favorite command line editor.

```
$ sudo vim /etc/ssh/sshd_config 
```

Look for the required directive, uncomment it and set its value to `yes`, as shown in the screenshot.

```
GatewayPorts yes
```

Save the changes and exit. Next, you need to restart sshd to apply the recent change you made.

```
$ sudo systemctl restart sshd
OR
$ sudo service sshd restart 
```

Next run the following command to forward port **5000** on the remote machine to port **3000** on the local machine.

```
$ ssh -f -N admin@server1.example.com -R 5000:localhost:3000
```





Links:



https://www.ssh.com/ssh/tunneling/example



https://www.booleanworld.com/guide-ssh-port-forwarding-tunnelling/



## **Scp**



**SCP (secure copy) is a command-line utility that allows you to securely copy files and directories between two locations.**

With `scp`, you can copy a file or directory:

- 
- From your local system to a remote system.

- 
- From a remote system to your local system.

- 
- Between two remote systems from your local system.

When transferring data with `scp`, both the files and password are encrypted, so that anyone snooping on the traffic doesn’t get anything sensitive.



**`scp` provides a number of options that control every aspect of its behavior. The most widely used options are:**

- 
- `-P` Specifies the remote host ssh port.

- 
- `-p` Preserves files modification and access times.

- 
- `-q` Use this option if you want to suppress the progress meter and non-error messages.

- 
- `-C`. This option will force `scp` to compresses the data as it is sent to the destination machine.

- 
- `-r` This option will tell `scp` to copy directories recursively.





```
scp file.txt remote_username@10.10.0.2:/remote/directory
```