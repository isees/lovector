+++
title = "How to create a network share via Samba via CLI"
date = "2018-10-15T23:56:23+08:00"
draft = false
tags = ['samba', 'linux']
topics = []
description = ""
+++

#### 1. Install Samba

```bash
sudo apt-get update
sudo apt-get install samba
```


#### 2. Set a password for your user in Samba

```bash
sudo smbpasswd -a <user_name>
```

#### 3. Create a directory to be shared

```bash
mkdir /home/<user_name>/<folder_name>
```

#### 4. Make a safe backup copy of the original smb.conf file to your home folder, in case you make an error

```bash
sudo cp /etc/samba/smb.conf ~
```

#### 5. Edit the file "/etc/samba/smb.conf"

```bash
sudo vim /etc/samba/smb.conf
```

#### 6. Restart the samba:

```bash
sudo service smbd restart
```

#### 7. Once Samba has restarted, use this command to check your smb.conf for any syntax errors


```bash
testparm
```

#### 8. To access your network share

```bash
sudo apt-get install smbclient
# List all shares:
smbclient -L //<HOST_IP_OR_NAME>/<folder_name> -U <user>
# connect:
smbclient //<HOST_IP_OR_NAME>/<folder_name> -U <user>
```

To access your network share use your username (<user_name>) and password through the path "smb://<HOST_IP_OR_NAME>/<folder_name>/" (Linux users) or "\\<HOST_IP_OR_NAME>\<folder_name>\" (Windows users). Note that "<folder_name>" value is passed in "[<folder_name>]", in other words, the share name you entered in "/etc/samba/smb.conf".
