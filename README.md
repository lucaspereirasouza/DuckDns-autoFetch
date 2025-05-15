
---

# DuckDNS Auto Update Script

A simple Bash script to automatically update your DuckDNS domain with your current public IP address.
---

## Usage

### 1. Clone the Repository
## also chmod and chgrp the way you like it, this guide will make it readable and non secure

```bash
git clone https://github.com/yourusername/ill-change-this-later-lol
cd also-will-change-this
touch token
chmod ugo+rwx ./duck
chmod ugo+rw ./token
```

### 2. Create Your DuckDNS Token

1. Go to [https://www.duckdns.org](https://www.duckdns.org) and log in with your account.
2. Note your **token** from the "Token" section (you'll need it below).

### 3. Token file

Create a file, then simply store your token inside

```bash
nano token
```
or

```
$token > token
```

> To prevent unauthorized users from making changes, restrict access to the .sh and token:
 ```bash
sudo chown root:root duckdns.sh
sudo chown root:root token

sudo chmod ug+rwx duckdns.sh
sudo chmod ug+rw token
 ```

### 4. Run the Script Manually (Optional)

```bash
sudo bash duckdns.sh
```

---

## 🔄 Automate Daily with Systemd

### 1. Copy the Service File

```bash
sudo touch /etc/systemd/system/duck-dns.service
sudo nano 

```


```bash

    [Unit]
    Description=Boots the ERP, Backup and logging Services

    [Service]
    Type=fork
    EnvironmentFiles=Your directory here
    ExecStart=./duck.sh
    RemainAfterExit=no

    [Install]
    WantedBy=multi-user.target

```

### 2. Enable and Start the Timer

```bash
sudo systemctl enable duckdns-update.service
```

---

## Security Notes

- The script file is executable by root.
- I suggest not sharing or expose your DuckDNS token publicly.

---

## ✅ License

MIT License — Feel free to modify and use as needed.

---
