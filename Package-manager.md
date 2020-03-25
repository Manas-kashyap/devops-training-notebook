# **Package manager**


 

##### How package management systems work

If a certain package requires a certain resource such as a shared library, or another package, it is said to have a dependency. All modern package management systems provide some method of dependency resolution to ensure that when a package is installed, all of its dependencies are installed as well.


 

##### Packaging Systems

Almost all the software that is installed on a modern Linux system will be found on the Internet. It can either be provided by the distribution vendor through central repositories (which can contain several thousands of packages, each of which has been specifically built, tested, and maintained for the distribution) or be available in source code that can be downloaded and installed manually.

Because different distribution families use different packaging systems (Debian: ***.deb** / CentOS: ***.rpm** / openSUSE: ***.rpm** built specially for openSUSE), a package intended for one distribution will not be compatible with another distribution. However, most distributions are likely to fall into one of the three distribution families covered by the LFCS certification


 

##### High and low-level package tools

In order to perform the task of package management effectively, you need to be aware that you will have two types of available utilities: **low-level** tools (which handle in the backend the actual installation, upgrade, and removal of package files), and **high-level** tools (which are in charge of ensuring that the tasks of dependency resolution and metadata searching -”data about the data”- are performed).


 

| **DISTRIBUTION**       | **LOW-LEVEL TOOL** | **HIGH-LEVEL TOOL** |
| ---------------------- | ------------------ | ------------------- |
| Debian and derivatives | dpkg               | apt-get / aptitude  |
| CentOS                 | rpm                | yum                 |
| openSUSE               | rpm                | zypper              |


 

**dpkg** is a low-level package manager for Debian-based systems. It can install, remove, provide information about and build *.deb packages but it can’t automatically download and install their corresponding dependencies.

**apt-get** is a high-level package manager for Debian and derivatives, and provides a simple way to retrieve and install packages, including dependency resolution, from multiple sources using the command line. Unlike dpkg, apt-get does not work directly with *.deb files, but with the package proper name.

**aptitude** is another high-level package manager for Debian-based systems, and can be used to perform management tasks (installing, upgrading, and removing packages, also handling dependency resolution automatically) in a fast and easy way. It provides the same functionality as apt-get and additional ones, such as offering access to several versions of a package.

**rpm** is the package management system used by Linux Standard Base (LSB)-compliant distributions for low-level handling of packages. Just like dpkg, it can query, install, verify, upgrade, and remove packages, and is more frequently used by Fedora-based distributions, such as RHEL and CentOS.

**yum** adds the functionality of automatic updates and package management with dependency management to RPM-based systems. As a high-level tool, like apt-get or aptitude, yum works with repositories.


 

### Common Usage of Low-Level Tools


 

###### 1. Installing a package from a compiled (*.deb or *.rpm) file

The downside of this installation method is that no dependency resolution is provided. You will most likely choose to install a package from a compiled file when such package is not available in the distribution’s repositories and therefore cannot be downloaded and installed through a high-level tool. Since low-level tools do not perform dependency resolution, they will exit with an error if we try to install a package with unmet dependencies.

```
# dpkg -i file.deb              [Debian and derivative]
# rpm -i file.rpm               [CentOS / openSUSE]
```

###### 2. Upgrading a package from a compiled file

Again, you will only upgrade an installed package manually when it is not available in the central repositories.

```
# dpkg -i file.deb              [Debian and derivative]
# rpm -U file.rpm               [CentOS / openSUSE]
```

######    

###### 3. Listing installed packages

When you first get your hands on an already working system, chances are you’ll want to know what packages are installed.

```
# dpkg -l               [Debian and derivative]
# rpm -qa               [CentOS / openSUSE]

If you want to know whether a specific package is installed, you can pipe the output of the above commands to grep,

# dpkg -l | grep mysql-common
```


 

Another way to determine if a package is installed.

```
# dpkg --status package_name            [Debian and derivative]
# rpm -q package_name                   [CentOS / openSUSE]
```


 

### Common Usage of High-Level Tools

The most frequent tasks that you will do with high level tools are as follows.

###### 1. Searching for a package

**aptitude update** will update the list of available packages, and **aptitude search** will perform the actual search for **package_name**.

```
# aptitude update && aptitude search package_name 
```

In the search all option, **yum** will search for package_name not only in package names, but also in package descriptions.

```
# yum search package_name
# yum search all package_name
# yum whatprovides “*/package_name”
```

Let’s supposed we need a file whose name is **sysdig**. To know that package we will have to install, let’s run.

```
# yum whatprovides “*/sysdig”
```

###### 2. Installing a package from a repository

While installing a package, you may be prompted to confirm the installation after the package manager has resolved all dependencies. Note that running update or refresh (according to the package manager being used) is not strictly necessary, but keeping installed packages up to date is a good sysadmin practice for security and dependency reasons.

```
# aptitude update && aptitude install package_name              [Debian and derivatives]
# yum update && yum install package_name                        [CentOS]
# zypper refresh && zypper install package_name                 [openSUSE]
```

###### 3. Removing a package

The option **remove** will uninstall the package but leaving configuration files intact, whereas purge will erase every trace of the program from your system.
 \# aptitude remove / purge package_name
 \# yum erase package_name

```
---Notice the minus sign in front of the package that will be uninstalled, openSUSE ---

# zypper remove -package_name 
```

Most (if not all) package managers will prompt you, by default, if you’re sure about proceeding with the uninstall before actually performing it. So read the onscreen messages carefully to avoid running into unnecessary trouble!


 

###### 4. Displaying information about a package

The following command will display information about the **birthday** package.

```
# aptitude show birthday 
# yum info birthday
# zypper info birthday
```


 


 



 **the main differences between aptitude and apt-get are:** 

1. 
2. `aptitude` adds explicit per-package flags, indicating whether a package was automatically installed to satisfy a dependency: you can manipulate those flags (`aptitude markauto` or `aptitude unmarkauto`) to change the way aptitude treats the package.

3. `apt-get` keeps track of the same information, but will not show it explicitly. `apt-mark` can be used for manipulating the flags.

4. 
5. `aptitude` will offer to remove unused packages each time you remove an installed package, whereas `apt-get` will only do that if explicitly asked to with `apt-get autoremove` or specify `--auto-remove`.

6. 
7. `aptitude` acts as a single command-line front-end to most of the functionalities in both `apt-get` and `apt-cache`. **Note**: As of 16.04, there is an `apt` command that includes the most commonly used commands from `apt-get` and `apt-cache` and a few extra features.

8. 
9. In contrast to `apt-cache`'s "search", `aptitude`'s "search" output also shows the installed/removed/purged status of a package (plus aptitude's own status flags). Also, the "install" output marks which packages are being installed to satisfy a dependency, and which are being removed because unused.

10. 
11. `aptitude` has a (text-only) interactive UI.


 


 

A package manager or package-management system is a collection of software tools that automates the process of installing, upgrading, configuring, and removing computer programs for a **[computer](https://en.wikipedia.org/wiki/Computer)**'s **[operating system](https://en.wikipedia.org/wiki/Operating_system)** in a consistent manner.**[[1\]](https://en.wikipedia.org/wiki/Package_manager#cite_note-1)**

A package manager deals with [*packages*](https://en.wikipedia.org/wiki/Package_format), distributions of software and data in [archive files](https://en.wikipedia.org/wiki/Archive_file). Packages contain [metadata](https://en.wikipedia.org/wiki/Metadata), such as the software's name, description of its purpose, version number, vendor, [checksum](https://en.wikipedia.org/wiki/Checksum) (preferably a [cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)), and a list of [dependencies](https://en.wikipedia.org/wiki/Coupling_(computer_programming)) necessary for the software to run properly. Upon installation, metadata is stored in a local package database. Package managers typically maintain a database of software dependencies and version information to prevent software mismatches and missing prerequisites. They work closely with [software repositories](https://en.wikipedia.org/wiki/Software_repository), [binary repository managers](https://en.wikipedia.org/wiki/Binary_repository_manager), and [app stores](https://en.wikipedia.org/wiki/App_store). 

Package managers are designed to eliminate the need for manual installs and updates. This can be particularly useful for large enterprises whose operating systems are based on [Linux](https://en.wikipedia.org/wiki/Linux) and other [Unix-like](https://en.wikipedia.org/wiki/Unix-like) systems, typically consisting of hundreds or even tens of thousands of distinct software packages.[[](https://en.wikipedia.org/wiki/Package_manager#cite_note-2)

Package managers are charged with the task of finding, installing, maintaining or uninstalling software packages upon the user's command. Typical functions of a package management system include: 

- 
- Working with [file 	archivers](https://en.wikipedia.org/wiki/File_archiver) to extract package archives  

- 
- Ensuring the integrity and authenticity of the package by verifying their [digital 	certificates](https://en.wikipedia.org/wiki/Digital_certificate) and [checksums](https://en.wikipedia.org/wiki/Checksum) 	

- 
- Looking up, downloading, installing, or updating existing software from a [software 	repository](https://en.wikipedia.org/wiki/Software_repository) or [app 	store](https://en.wikipedia.org/wiki/App_store)  

- 
- Grouping packages by function to reduce user confusion  

- 
- Managing dependencies to ensure a package is installed with all packages it requires, thus avoiding "[dependency 	hell](https://en.wikipedia.org/wiki/Dependency_hell)"


 

**Different package managers** 


 

- 
- **[Advanced 	Packaging Tool](https://fusion809.github.io/comparison-of-package-managers/#apt)** (**APT**), the default package manager of Debian and its various derivatives. I will also discuss the related package managers aptitude and Synaptic in this section.  

- 
- **[Dandified 	Yum](https://fusion809.github.io/comparison-of-package-managers/#dnf)** (**DNF**), the default package manager of Fedora ≥22 and its up-to-date derivatives (e.g. Chapeau and Korora) and the successor to yum.  

- 
- **[Entropy](https://fusion809.github.io/comparison-of-package-managers/#entropy)**, the default package manager of Sabayon Linux.  

- 
- **[pacman](https://fusion809.github.io/comparison-of-package-managers/#pacman)**, the default package manager of Arch Linux and its derivatives.  

- 
- **[Portage](https://fusion809.github.io/comparison-of-package-managers/#portage)**, the package manager of Gentoo Linux and its derivatives such as Calculate and Sabayon.  

- 
- **[Yellowdog 	Updater, Modified](https://fusion809.github.io/comparison-of-package-managers/#yum)** (**yum**), the default package manager of CentOS, Fedora ≤21 and the predecessor of DNF.  

- 
- **[ZYpp](https://fusion809.github.io/comparison-of-package-managers/#zypp)** (**zypper**), the default package manager of openSUSE and its derivatives.  


 

###    

**Debian packages** are software packages with the file extension `.deb`. They are archives formed with the `ar` utility, inside them are three files:

- 
- tar archive called `data`, that is optionally bz2, gz, lzma or xz-compressed. It contains the installed files.  

- 
- tar archive called `control`, that is optionally compressed with any of the aforementioned algorithms and it contains package metadata.  

- 
- `debian-binary` text file that contains the deb format number, the latest is presently 2.0.  

They are probably the single most popular type of Linux binary package out there, as they are used by three of the most popular Linux distributions, according to *DistroWatch* (Debian, Linux Mint and Ubuntu).


 

**[dpkg](https://wiki.debian.org/Teams/Dpkg)** is a low-level package management tool that installs, removes, upgrades and provides information about Debian packages. dpkg was first developed by Ian Murdock in 1994 and is written in C, C++ and Perl.


 

### RPM Packages

The **RPM Packages** are the binary package format that the RPM package manager works with. They have the `.rpm` file extension. They are archive files, you can extract their contents with the `bsdtar -xf $package.rpm` command, where `$package` is the package’s name, without the `.rpm` file extension. There is also a source code version of the RPM Package format, with the file extension `.src.rpm`.


 

## APT

The **[Advanced Packaging Tool](https://wiki.debian.org/Apt)** (**APT**) is the default front-end for the dpkg package manager used by Debian-based systems. See what APT does is it performs dependency resolution, repository management, and assorted other higher-level functions while dpkg is what actually installs and removes packages. So in essence what APT does for dpkg is it gives it some intelligence; package management with dpkg by itself is not an experience I would like to have as you would have to do just about everything yourself. It is the eldest package manager mentioned in this review and was first developed in 1998. APT is written in C++ and Bash script.


 


 


 