# Backup Management in Jenkins Server

It is a known fact that Jenkins always requires some disk space in order to execute the build jobs and archive the same. This is configured by using the JENKINS_HOME. This path can be configured whenever required.

------

## Backup and Restore

In Jenkins, all the settings, build logs and archives of the artifacts are stored under the JENKINS_HOME directory. The easy way is to just keep this folder separately as a new back and whenever the same needs to be used, just copy it back.

The build jobs created under this directory contains all the details of each and every individual jobs configured in the Jenkins install. Any job can be moved from one installation directory to another just by copying the jobs.

Also, Jenkins provides the feature of renaming an existing job on the fly. To reflect the applied changes, just click on the **reload config** from the user interface of the Jenkins.



------

### ThinBackup Plugin

Since, Jenkins can be enormously extended by the usage of several plugins, there comes a plugin which can be used for the backup management in Jenkins - **ThinBackup** plugin. This plugin backs up the job specific configuration files.



From the Jenkins home page, click on **Manage Jenkins** and in the next page click on **Manage plugins**.

![ThinBackup Plugin](https://www.studytonight.com/jenkins/images/backup-management-1.png)

In the next page, under the **Available** plugins tab, search/look for ThinBackup plugin. Select the same and click on Install without restart button.

![ThinBackup Plugin](https://www.studytonight.com/jenkins/images/backup-management-2.png)



Just restart the Jenkins to see the plugin installed successfully. From the home page, click on **Manage Jenkins** link and in the next page, from the list if can be found that the ThinBackup plugin installed. Just click on the same and the below page will be displayed.

![ThinBackup Plugin](https://www.studytonight.com/jenkins/images/backup-management-4.png)



Click on **Settings** link to configure the backup options.

![ThinBackup Plugin](https://www.studytonight.com/jenkins/images/backup-management-5.png)



Just provide the configuration details as required and save the settings.

![ThinBackup Plugin](https://www.studytonight.com/jenkins/images/backup-management-6.png)

------

The main aim is to save the Jenkins Home directory at a place from where we can take it under action again .
*In Docker Containers we can achieve this via binding the volume with our host machine volume so that all the data are save inside the host machine not inside the container .*

**Hope this Helps !**
