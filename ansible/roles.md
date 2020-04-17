# What is Ansible Roles ?

Roles provide a framework for fully independent, or interdependent collections of variables, tasks, files, templates, and modules.

In Ansible, the role is the primary mechanism for breaking a playbook into multiple files. This simplifies writing **complex playbooks**, and it makes them easier to reuse. The breaking of playbook allows you to logically break the playbook into reusable components.

Each role is basically limited to a particular functionality or desired output, with all the necessary steps to provide that result either within that role itself or in other roles listed as dependencies.

Roles are not playbooks. Roles are small functionality which can be independently used but have to be used within playbooks. There is no way to directly execute a role. Roles have no explicit setting for which host the role will apply to.

Top-level playbooks are the bridge holding the hosts from your inventory file to roles that should be applied to those hosts.

## How to create Roles ?

The built-in *ansible-galaxy* command has a sub command that will create our role skeleton for us.

Simply use `ansible-galaxy init ` to create a new role in your present working directory. You will see here that several directories and files are created within the new role:

![Ansible Roles example](https://linuxacademy.com/site-content/uploads/2019/05/roles11.png)

### Directory Structure

These many number of files and directories may appear to be difficult to work with, but they are fairly easy to understand. Above all, we always have the freedom to write our tasks and variable into other files but we must **include** directives into the directory’s *main.yml* file. Let us look into the use of these different directories in our role.

#### Defaults:

The *defaults* directory is for defining the variable defaults. The variables in *default* have the lowest priority thus becoming easy to override. If definition of a variable is nowhere else, the variable in *defaults/main.yml* will be used.

#### Files:

We use the *files* directory to add files that are needed by machine, without modification. Mostly, we use copy task for referencing files in the *files* directory.

#### Handlers:

The *handlers* directory is used for storing Ansible handlers.

A Handler is exactly the same as a Task, but it will run when called by another Task. A Handler will take an action when called by an event it listens for.
This is useful for secondary actions that might be required after running a Task, such as starting a new service after installation or reloading a service after a configuration change.

#### Meta:

We use the *meta* directory to store authorship information which is useful if we choose to publish our role on *galaxy.ansible.com*. The metadata of an Ansible role consists of author, supported platforms, and dependencies.

#### Tasks:

The *task* directory is where we write most of our roles which includes all the tasks our role will perform. We write each series of tasks in a separate file and include them into the *main.yml* file in the *tasks* directory.

#### Templates:

We use the *template* directory to add templates which can create the required file by replacing the variables . Only difference between *template* and *files* directories is that the *template* directory contains files which can be modified basically the templates. [Jinja2](https://jinja.palletsprojects.com/en/master/) language to used to create these alteration. Configuration files are basically the template files

#### Tests:

This directory contains a sample inventory and a *test.yml* file. This may contain the tests that we can do before hand in this automation process .

#### Vars:

This is where we create variable files that define necessary variables for our role.