## What is Ansible

Ansible is an open-source automation tool, or platform, used for IT tasks such as configuration management, application deployment, intraservice orchestration, and provisioning.

Automation is crucial these days, with IT environments that are too complex and often need to scale too quickly for system administrators and developers to keep up if they had to do everything manually. Automation simplifies complex tasks, not just making developers’ jobs more manageable but allowing them to focus attention on other tasks that add value to an organization. In other words, it frees up time and increases efficiency. And Ansible, as noted above, is rapidly rising to the top in the world of automation tools. 

### Uses of Ansible

Another important aspect under-emphasis before ansible advantages refers to the applications of ansible. The applications of Ansible can help in obtaining brief insights into their benefits for DevOps. The different applications of Ansible include provisioning, configuration management, deploying applications, security and compliance, and orchestration. The long list of applications clearly shows that Ansible is not just another configuration management tool. So, we can note that the advantages of Ansible come primarily from its applications.

## Advantages of Ansible

- **Free**: Ansible is an open-source tool.
- **Very simple to set up and use**: No special coding skills are necessary to use Ansible’s playbooks (more on playbooks later).
- **Powerful**: Ansible lets you model even highly complex IT workflows. 
- **Flexible**: You can orchestrate the entire application environment no matter where it’s deployed. You can also customize it based on your needs.
- **Agentless**: You don’t need to install any other software or firewall ports on the client systems you want to automate. You also don’t have to set up a separate management structure.
- **Efficient**: Because you don’t need to install any extra software, there’s more room for application resources on your server.

#### Ansible in the DevOps Movement

The fit of Ansible in the DevOps lifecycle can also provide viable insight into the benefits of Ansible. Ansible provides support for integrating development and operations in contemporary test-driven application design. It provides a stable environment for the development and operations team, thereby leading to smooth orchestration. Ansible automation helps considerably with the representation of Infrastructure as Code (IAC).

IAC involves provisioning and management of computing infrastructure and related configuration through machine-processable definition files. Therefore, administrators could find opportunities to work in collaboration with developers that improves development speed. Also, the benefits of ansible help in focusing more on performance tuning and experimenting rather than fixing issues.



## Ansible Architecture

Now let’s talk a bit about the pieces that make up the Ansible environment.

### Modules

Modules are like small programs that Ansible pushes out from a control machine to all the nodes or remote hosts. The modules are executed using playbooks , and they control things such as services, packages, and files. Ansible executes all the modules for installing updates or whatever the required task is, and then removes them when finished. Ansible provides more than 450 modules for everyday tasks.

### Plugins

As you probably already know from many other tools and platforms, plugins are extra pieces of code that augment functionality. Ansible comes with a number of its plugins, but you can write your own as well. Action, cache, and callback plugins are three examples.

### Inventories

All the machines you’re using with Ansible (the control machine plus nodes) are listed in a single simple file, along with their IP addresses, databases, servers and so on. Once you register the inventory, you can assign variables to any of the hosts using a simple text file. 

### Playbooks

Ansible playbooks are like instruction manuals for tasks. They are simple files written in YAML, which stands for YAML Ain’t Markup Language, a human-readable data serialization language. Playbooks are really at the heart of what makes Ansible so popular is because they describe the tasks to be done quickly and without the need for the user to know or remember any particular syntax. Not only can they declare configurations, but they can orchestrate the steps of any manually ordered task, and can execute tasks at the same time or at different times.

Each playbook is composed of one or multiple plays, and the goal of a play is to map a group of hosts to well-defined roles, represented by tasks.

### APIs

Various APIs (application programming interfaces) are available so you can extend Ansible’s connection types (meaning more than just SSH for transport), callbacks and more.