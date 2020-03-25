<!-- wp:paragraph -->
<p>In this Blog, we will package a nodejs module to the Debian Standards and by the end of this blog, you will have a package that you can ask the Debian Developers to have in the archive of Debian.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://wiki.videolan.org/images/Debian-logo.jpg" alt=""/></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 id="what-is-meant-by-debian-packaging">What is meant by Debian Packaging?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Ever done&nbsp;<em>Sudo apt install (anything)</em>&nbsp;??</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Wondered how apt install works and what file it fetches and how the file gets auto-installed ?? So, here comes the Debian Packaging task. The aim of packaging is to allow the automation of installing, upgrading, configuring, and removing computer programs for Debian in a consistent manner.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>To be simple, its like making .deb of any software or module like in windows we have .exe file</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>By doing Debian packaging we make Debian packages, which is a collection of files that allow for applications or libraries to be distributed via the Debian package management system.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://wiki.debian.org/Packaging">More info</a></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 id="lets-start-with-prerequisites-needed-to-do-the-work-">Let's start with Prerequisites needed to do the work.</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>So, To start with Debian packaging, we need a&nbsp;Debian SID&nbsp;environment.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p> I have an ubuntu/arch/Gentoo/mac machine and installing another OS will be a hectic task <br>Nah, not ready for a new OS&nbsp;- its that's what you are thinking now, don’t worry we have&nbsp;Docker,&nbsp;lxc&nbsp;or&nbsp;virtual machine&nbsp;for you.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>See instructions given below to setup Debian Sid environment</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>LXC -&nbsp;<a href="https://wiki.debian.org/Packaging/Pre-Requisites#LXC">https://wiki.debian.org/Packaging/Pre-Requisites#LXC</a></li><li>Docker -&nbsp;<a href="https://wiki.debian.org/Packaging/Pre-Requisites#Docker">https://wiki.debian.org/Packaging/Pre-Requisites#Docker</a></li><li>Virtual Machine -&nbsp;<a href="https://wiki.debian.org/Packaging/Pre-Requisites#Virtual_Machine">https://wiki.debian.org/Packaging/Pre-Requisites#Virtual_Machine</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Here we will use Docker Container for our work .</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Installation of Docker SID environment</strong></p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table class=""><thead><tr><th>Work to be done</th><th>Code</th></tr></thead><tbody><tr><td>Pull Debian Sid image from docker hub using the following command</td><td>docker pull debian:sid</td></tr><tr><td>Create a container with it and start bash on it</td><td>docker run - -privileged - -name “sid” -it debian:sid /bin/bash</td></tr><tr><td>Update and upgrade to latest versions of packages</td><td>apt-get update &amp;&amp; apt-get upgrade</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Exit after your work is done.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you need to connect to it later, use the following commands which will take you to the bash prompt.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>“sudo docker start sid &amp;&amp; sudo docker attach sid”</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Now , we need tools to work with</strong>&nbsp;<strong>:-</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Install packaging tools inside the container&nbsp;<code># apt-get install dh-make</code>&nbsp;OR&nbsp;<code># apt-get install gem2deb</code>&nbsp;OR&nbsp;<code># apt-get install npm2deb</code>&nbsp;as required.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code># apt-get install git-buildpackage sbuild dh-buildinfo quilt lintian</code>&nbsp;these packages are must to be installed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For Nodejs modules, use&nbsp;<code>npm2deb</code>; for ruby gems, use&nbsp;<code>gem2deb</code>; for go packages, use&nbsp;<code>dh-make-golang</code>. If there is no tool specific to a language,&nbsp;<code>dh-make</code>&nbsp;can be used as a generic tool for any language.</p>
<!-- /wp:paragraph -->

<!-- wp:separator -->
<hr class="wp-block-separator"/>
<!-- /wp:separator -->

<!-- wp:paragraph -->
<p><strong>Lets , do it then ?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Install a text editor (I like vim , for installation run sudo apt install vim ) and update .bashrc of docker container with the following environment variables</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>export DEBEMAIL=your@email.domain
export DEBFULLNAME='Your Name'
alias lintian='lintian -iIEcv --pedantic --color auto'
alias git-import-dsc='git-import-dsc --author-is-committer --pristine-tar'
alias clean='fakeroot debian/rules clean'
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Command ls -la shows the hidden .bashrc file , to edit with vim do vim .bashrc and add the above and the very end , update your current environment by running</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>source ~/.bashrc
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><strong>vim tips</strong>&nbsp;<strong>i – insert mode to enter text ,</strong>&nbsp;<strong>:wq – write and exit ,:q!– exit without saving</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Setup username and email address for git</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>git config –global user.name “Your name”</em>&nbsp;<em>git config –global user.email&nbsp;email@domain.tld</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 id="workflow-we-are-taking-example-of-node-module-qw">workflow (we are taking example of node module&nbsp;<a href="https://www.npmjs.com/package/qw">qw</a>)</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>1) Check depedency use npm2deb depends</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$ npm2deb depends -b -r qw
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><em>Module qw has no dependencies.</em>&nbsp;<em>Here qw has no depedencies</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>2) Search for existing work using npm2deb search</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$ npm2deb search qw
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><em>Looking for similiar package:</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>None</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Looking for existing repositories:</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>None</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Looking for wnpp bugs:</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>None</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Output shows no existing work and one can start work on it</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>3) Preview more info using npm2deb view</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$ npm2deb view qw
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><em>Version: 1.0.1</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Description: None</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Homepage: https://github.com/iarna/node-qw#readme</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>License: ISC</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Debian: None (None)</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>License is automatically recognize as BSD, if this does not happen, please</em>&nbsp;<em>pass</em>&nbsp;<em>–upstream-license option during creation to set a correct license.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>4) Automate debian package creation using npm2deb create .</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>npm2deb fails to do it completely ,our job is to fix those error which is shown by the prefix FIX_ME</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$ npm2deb create qw
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>‘You may want fix first these issues:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>qw/node-qw-1.0.1/debian/control:Description: FIX_ME write the Debian package description</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>qw/node-qw_itp.mail:Subject: ITP: node-qw – FIX_ME write the Debian package description</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>ls command shows npm2deb created a dir called qw ,</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>change directory to qw, It has the following contents</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>$ ls</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>qw</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>$ cd qw/</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>$ ls</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>node-qw node-qw-1.0.1.tar.gz node-qw_1.0.1-1.dsc qw_1.0.1- 1_amd64.buildinfo node-qw_1.0.1.orig.tar.gz node-qw-1.0.1 node-qw_1.0.1-1.debian.tar.xz node-qw_1.0.1-1_all.deb node- qw_1.0.1-1_amd64.changes node-qw_itp.mail</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>node-qw is a temporary folder created by npm2deb its better to delete it to avoid confusion later</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>$ rm -rf node-qw</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>5) Import package to git</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$ gbp import-dsc --pristine-tar node-qw_1.0.1-1.dsc
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>now we get a new dir called node-qw which is git tracked , cd into the new created dir node-qw and see git branch and git tag</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>$ git branch</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>master</li><li>pristine-tar</li><li>upstream</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>$ git tag</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>debian/1.0.1-1</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>upstream/1.0.1</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Delete the debian tag by running git tag -d debian/1.0.1-1</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>6) File ITPFiling itp is a method by which we take ownership of the module by mailing to&nbsp;submit@bugs.debian.org&nbsp;, in return we get a bug number , a sample mailing templete is created by npm2deb for our use</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>$ cat node-qw_itp.mail (to view the template )</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>update the template by fixing the error with the prefix FIX_ME:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>sample itp is attached below https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881423</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>7) Make package lintian clean</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>/qw/node-qw$ ls</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>LICENSE README.md debian package.json qw.js test</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>/qw/node-qw$ dpkg-buildpackage &amp;&amp; lintian ../node-qw_1.0.1-1.dsc
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>lintian points out the errors we need to fix</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>I: node-qw source: file-contains-fixme-placeholder debian/control:20 FIX_ME</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>W: node-qw source: out-of-date-standards-version 4.1.1 (current is 4.5.0)</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>places where errors where fixed regarding this module</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>debian/control</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>debian/copyright</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>debian/changelog</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>make sure to commit your changes as they are fixed by using the git command</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>git commit -m “ comment description” path/of/fixed/file</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>for reference -https://salsa.debianorg/js-team/node-qw.git/tree/</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>8) Enable tests if present any, find the test command from package.json</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>  $ cat package.json

  {
  "name": "qw",
  "version": "1.0.1",
  "description": "Quoted word literals!",
  "main": "qw.js",
  "scripts": {
  "test": "tap test"
  },
  "keywords": [],
  "author": "Rebecca Turner &lt;me@re-becca.org> (http://re-
  becca.org/)",
  "license": "ISC",
  "devDependencies": {
  "tap": "^8.0.0"
  },
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>add the test command under override_dh_auto_test from debian/rules</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>override_dh_auto_test:

 tap -J test/*.js
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>add the test framework (mocha, node-tape etc) as a build dependency in</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>debian/control</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Build-Depends:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>debhelper (&gt;= 9)</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>, dh-buildinfo, nodejs</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>, node-tap</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Standards-Version: 4.1.2</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>add a Test-Command section to debian/tests/control</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$ cat tests/control
  Tests: require
  Depends: node-qw
  Test-Command: tap -J test/*.js
  Depends: @, node-tap
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>reference link ;-https://salsa.debian.org/js-team/node-qw.git/tree/debian</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>run dpkg-buildpackage and check if the tests ran sucessfully and change debian/changelog to release by running dch -r.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>9) upload to https://salsa.debian.org ( as the team maintains it)</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>create a new project as per your node-module name</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>git remote add origin&nbsp;git@salsa.debian.org:username/node-module-name.git (eg link)</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>git push -u origin –all –follow-tags</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>10)Install deb package</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>  
  dpkg -i ../node-qw_1.0.1-1_all.deb
</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator"/>
<!-- /wp:separator -->

<!-- wp:separator -->
<hr class="wp-block-separator"/>
<!-- /wp:separator -->

<!-- wp:paragraph -->
<p><strong>This Blog is just a peek into the packaging and how to start.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Hope it helps you</strong>&nbsp;<strong>!!</strong></p>
<!-- /wp:paragraph -->
