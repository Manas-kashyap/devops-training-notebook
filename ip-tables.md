# Iptables



[Managing network traffic](https://www.tecmint.com/manage-and-limit-downloadupload-bandwidth-with-trickle-in-linux/) is one of the toughest jobs a system administrators has to deal with. He must [configure the firewall](https://www.tecmint.com/configure-iptables-firewall/) in such a way that it will meet the system and users requirements for both incoming and outgoing connections, without leaving the system vulnerable to attacks.

This is where `iptables` come in handy. **Iptables** is a Linux command line firewall that allows system administrators to manage incoming and outgoing traffic via a set of configurable table rules.


 

**Iptables** uses a set of tables which have chains that contain set of built-in or user defined rules. Thanks to them a system administrator can properly filter the network traffic of his system.


 

Iptable is the built-in linux firewall which includes some conditions, known as **rules**, according to which the traffic is allowed on the machine. It monitors the incoming and outgoing traffic and filter it according to the specified rules. 

The incoming and outgoing data is transferred in the form of packets. Linux provide an interface to filter these packets. Here, Iptables comes into picture, which is a command line tool to set-up and configure the firewall. **Iptables** contain **tables** to filter packets. These tables contain multiple **chains** which are nothing, but the set of **rules**. 



Per iptables manual, there are currently 3 types of tables:

1. 1. 1. 
      2. `FILTER` **– 		this is the default table, which contains the built in chains for:** 		 		

1. 1. 1. 
      2. **INPUT**  – 		packages destined for local sockets  		

      3. 
      4. **FORWARD** – 		packets routed through the system  		

      5. 
      6. **OUTPUT** – 		packets generated locally  		

   2. 

   3. `NAT` 	– a table that is consulted when a packet tries to create a new 	connection. It has the following built-in:  	

   4. 1. 
      2. **PREROUTING** – 		used for altering a packet as soon as it’s received  		

      3. 
      4. **OUTPUT** – 		used for altering locally generated packets  		

      5. 
      6. **POSTROUTING** – 		used for altering packets as they are about to go out  		

   5. 

   6. `MANGLE` 	– this table is used for packet altering. Until kernel version **2.4** this table had only two chains, but they are now 5:  	

   7. 1. 
      2. **PREROUTING** – 		for altering incoming connections  		

      3. 
      4. **OUTPUT** – 		for altering locally generated  packets  		

      5. 
      6. **INPUT** – for 		incoming packets  		

      7. 
      8. **POSTROUTING** – 		for altering packets as they are about to go out  		

      9. 
      10. **FORWARD** – for packets routed through 		the box  		

**-Rules**



The rules defines what to do with the packet if it matches any defined rule. If the rule is matched, it defines a **target** which can be another chain, or some special values mentioned below:

- 
- **ACCEPT:** It means that the packet is allowed to pass through the firewall.

- 
- **DROP:** It means that the packet is not allowed to pass through the firewall.

- 
- **RETURN:** It means to skip the current rule and jump back to the chain from which it was called.

There are 5 built-in tables in iptables namely **filter, nat, mangle, raw, security**. For this tutorial, we are going to work only with the default table of iptables which is **filter**.