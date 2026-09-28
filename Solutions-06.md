# Solutions for Exercises-06-Artifact-Repository-Manager

## Exercise 1

> After I created a new Droplet on DigitalOcean, this is how I installed Nexus onto that.
> Check Exercise-1-The-New-Droplet.jpg image.

```bash
# Login with SSH.
ssh -i ~/.ssh/id_ed25519 root@161.35.197.245

# Install Java.
apt update
apt install openjdk-25-jre-headless
java --version

# Download and unzip Nexus.
cd /opt
wget https://download.sonatype.com/nexus/3/nexus-3.96.3-01-linux-x86_64.tar.gz
tar -xzvf nexus-3.96.3-01-linux-x86_64.tar.gz

# Create a new user and make it the new owner of Nexus.
adduser nexus

chown -R nexus:nexus nexus nexus-3.96.3-01
chown -R nexus:nexus nexus sonatype-work
ls -l

vim nexus-3.96.3-01/bin/nexus.rc
# Add a new line to it: run_as_user="nexus"

# Switch user and start Nexus.
su - nexus
/opt/nexus-3.96.3-01/bin/nexus start

ps aux | grep nexus
```
