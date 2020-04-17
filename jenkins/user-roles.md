# How to Create Users & Manage Permissions: Role Strategy Plugin

By default, Jenkins comes with very basic user creation options. You can create multiple users but can only assign the same global roles and privileges to them. This not ideal, especially for a large organization.

The **Role Strategy Plugin** enable you to assign different roles and privileges to different users**.** You will first need to install the plugin in your Jenkins mange environment.

## How to Create/Add a User

**Step 1)** Login to your Jenkins dashboard by visiting http://localhost:8080/ (in this case the Jenkins Instance i am running is in my local system)

**Step 2)**

- Under Manage Jenkins, Click Create User
- Enter User details like password, name, email etc.
- Click Create User

*Now you have a User with different id and password , but now how to assign them different permissions and access of different project . So for it Jenkins give us a plugin (**Role Strategy Plugin**)*

## Install Role Strategy Plugin

There are two methods for installing plugins in Jenkins:

1. Installing it through your Jenkins dashboard

2. Downloading the plugin from Jenkins website and installing it manually.

   

   **So lets walk through the easy process of installing it via Jenkins dashboard**

   Here is the Pictorial presentation of how to add a Plugin to your project

[![img](https://www.guru99.com/images/1/091318_0444_HowtoCreate4.png)](https://www.guru99.com/images/1/091318_0444_HowtoCreate4.png)



[![img](https://www.guru99.com/images/1/091318_0444_HowtoCreate5.png)](https://www.guru99.com/images/1/091318_0444_HowtoCreate5.png)



Now once you have installed the Plugin 

Click on **Go back to the top page.** 
Till now we Authorisation strategy as Legacy mode , Now we have to change it to Role Based Strategy 
So , for doing that 

 Go to **Manage Jenkins ->** Configure Global Security -> Under **Authorization,** select **Role Based Strategy**. Click on **Save**.

## Create Roles

In this step, we shall learn to certain roles to a single user or a group of users.

**Step 1)**

1. Go to **Manage Jenkins**

2. Select **Manage and Assign Roles**

[![img](https://www.guru99.com/images/1/091318_0444_HowtoCreate8.png)](https://www.guru99.com/images/1/091318_0444_HowtoCreate8.png)

**Note:** that the **Manage and Assign Roles** option will only be visible if you've installed the role strategy plugin.

**Step 2)** Click on **Manage Roles** to add new roles based on your organization.

[![img](https://www.guru99.com/images/1/091318_0444_HowtoCreate9.png)](https://www.guru99.com/images/1/091318_0444_HowtoCreate9.png)

**Step 3)** To create a new role called "developer",

1. Type "developer" under "role".
2. Click on "Add" to create a new role.
3. Now, select the permissions you want to assign to the "Developer" role.
4. Click Save

[![img](https://www.guru99.com/images/1/091318_0444_HowtoCreate10.png)](https://www.guru99.com/images/1/091318_0444_HowtoCreate10.png)

## Assign a Role

**Step 1)** Now that you have created roles, let us assign them to specific users.

1. Go to **Manage Jenkins**
2. Select Manage and Assign Roles

[![img](https://www.guru99.com/images/1/091318_0444_HowtoCreate11.png)](https://www.guru99.com/images/1/091318_0444_HowtoCreate11.png)

**Step 2)** We shall add the new role "developer" to user "the user that you made during the First Point"

1. Selector developer role checkbox
2. Click Save

You can assign any role to any user, as per your need.

## Project Roles

You can create project specific roles under **Project Roles.**

In Jenkin's Manage and Assign Roles

1. Enter a role as "tester"
2. Add a pattern to this by adding **test.\***, so that any username starting with "test" will be assigned the project role you specify.
3. Click Add
4. Select privileges
5. Click Save

