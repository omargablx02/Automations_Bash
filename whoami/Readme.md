# System Monitor and Information Script (`whoami`)

A lightweight Bash script that gathers system statistics, resource usage, and
network profile information, and prints them as a clean, colour-coded report in
one pass.

## Source

- **Script:** [whoami.sh](./whoami.sh)
- **Screenshot:** ![whoami](./whoami_script.PNG)

## What it reports

- **Welcome** — current user, and a flag when the script is running as `root`.
- **System** — OS name, shell, uptime, and the current date and time.
- **Resources** — RAM consumption, and disk usage on `/` with a warning above 90%.
- **Network** — local IP, loopback IP, and public IP.
- **Ports** — the number of TCP/UDP sockets currently listening.

## Requirements

`coreutils` (`free`, `df`, `date`, `uptime`), `iproute2` (`ip`, `ss`), and
optionally `curl` for the public IP lookup. Without `curl` that one line prints
`Offline` and the script continues.

Running as `root` lets `ss` resolve the process names behind the listening
ports. Without it you still get the count.

## How to run

```bash
chmod +x whoami.sh
./whoami.sh
```

## Privacy note

Resolving the public IP sends one HTTP request to `ifconfig.me`. Remove or
comment out that line if you do not want it, or if the host has restricted
egress. Nothing else in the script depends on it.
