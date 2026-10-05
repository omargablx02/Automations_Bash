# 🛠️ System Monitor & Information Script (whoami)

This lightweight Bash script gathers and displays vital system statistics, resource usage, and network profiles in a clean, color-coded Terminal interface.

### 📄 Script Links
* Source Code: **[whoami.sh](https://github.com/crypt1cx01/Automations_Bash/blob/main/whoami/whoami.sh)**
* Script Screenshot: <br> ![whoami](https://github.com/crypt1cx01/Automations_Bash/blob/main/whoami/whoami_script.PNG)

---

### ✨ Key Features
* **Smart Welcome:** Detects current user and warns (`root`) privileges.
* **System Info:** Pulls OS name, Shell type, Uptime, and Date/Time.
* **Resources Profile:** Calculates RAM consumption and alerts if Disk exceeds 90%.
* **Network Profile:** Extracts Local IP, Loopback IP, and live Public IP.
* **Port Monitoring:** Tracks total open network ports listening for connections.

---

### 🚀 How to Run
Give execution permissions to the script and run it:
```bash
chmod +x whoami.sh
./whoami.sh
```
