# How to create package from scratch 

**For this purpose i am using a simple c++ program that prints hello world** 

So lets start  by creating a folder 
the folder where you will keep all your files and debian folder 

`mkdir /home/$USER/packaging-tutorial && cd /home/$USER/packaging-tutorial/ && mkdir hello-1.0.0` this naming is based on semantic versioning i,e, x.y.z 

**Step 1 :**

Create a c++ program as hello.cpp



\#include<iostream>

int main(){

using namespace std;

cout<<"Hello world\n";

return 0;

}



compile it :  g++ -o hello hello.cpp

try running it : ./hello





**Step 2 :**

create package structure

​	

mkdir hello-1.0.0 

mkdir hello-1.0.0 /DEBIAN

mkdirhello-1.0.0 /usr

mkdir hello-1.0.0 /usr/bin	



**Step 3 :**

create control file and paste the same file



Package: hello

Version: 1.0.0

Section: custom

Priority: optional

Depends: g++

Architecture: all

Essential: no

Installed-Size: 1024

Maintainer: testPackage.org

Description: print hello world





**Step 4 :** 

copy binary file 



cp hello hello-1.0.0/usr/bin/





**Step  5:**



**execute `dpkg-deb --build hello-1.0.0`** 



you will be able to see hello-1.0.0.deb 





**Step  6:**

**install package**



**sudo dpkg -i ./hello-1.0.0.deb**



**Step 7 :**

 **execute hello** 
