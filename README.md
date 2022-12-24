# Kali Custom Docker
Kali custom docker is a dockerfile
that lets you create a kali docker
with some tweaks that makes it easier
to use kali docker.

## Setup
```
git clone https://github.com/ngn13/kali-custom-docker.git
cd kali-custom-docker
chmod +x start.sh
./start.sh
```
Then you can login with ssh.

### Stop the docker
```
docker stop kali
```

### Remove the docker
```
docker rm kali
```

### Remove the image
```
docker rm kalicustom
```