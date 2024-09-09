
# 📊 Disk Space Automated Monitoring

A simple and effective way to monitor disk usage on Unix-based systems, combined with automated email notifications using Mutt. This guide will walk you through setting up the script and scheduling daily disk usage reports.

---

## 🛠️ Requirements

- **Mutt**: Command-line-based email client for Unix-based systems.
- **Unix Command Line**: Basic knowledge of terminal commands.
- **Nano or Vim**: Text editors to configure files.
- **Shell Script Knowledge**: Familiarity with shell scripting.
- **Cron Jobs**: Understanding of cron job scheduling.

---

## ⚙️ Setting Up Mutt

Follow these steps to configure Mutt for sending automated emails.

### 1. Open Mutt Configuration

```bash
nano ~/.muttrc
```

### 2. Configure Mutt

```bash
# Gmail SMTP setup
set from = "your.email@gmail.com"
set realname = "Your Name"
set smtp_url = "smtp://your.email@gmail.com@smtp.gmail.com:587/"
set smtp_pass = "yourpassword" # Or use Google Password Manager to generate a random 16-character password.
```

> **Note**: Replace `your.email@gmail.com` with your actual email address in both the `from` and `smtp_url` fields.

### 3. Enable TLS/SSL Encryption

```bash
set ssl_starttls = yes
set ssl_force_tls = yes
```

### 4. Ensure Gmail Folder Formats

```bash
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = "+[Gmail]/Sent Mail"
set trash = "+[Gmail]/Trash"
```

### 5. Debugging and Log Issues

```bash
set debug_level = 2
```

Save the file and exit.

---

## 🧪 Test Your Mutt Configuration

To verify the configuration:

```bash
echo "This is the body of the email" | mutt -s "Test Subject" recipient@example.com
```

---

## 📅 Scheduling Automated Disk Usage Reports

Follow these steps to schedule a cron job that sends disk usage reports.

### 1. Open the Crontab Editor

```bash
crontab -e
```

### 2. Add a Cron Job

To send an email daily at 8 AM:

```bash
0 8 * * * echo "Daily email from the server" | mutt -s "Daily Report" recipient@example.com
```

### 3. Send Disk Usage Reports

Modify the command to send disk usage reports instead:

```bash
0 17 * * * /filepath/disk_usage_monitor.sh
```

Here, `0 17 * * *` means the script will run at 5 PM every day. Adjust as per your preferred time.


---

## 🛠️ Support

Feel free to open an issue or contribute to this project via pull requests.

---

Made with ❤️ for server admins!
