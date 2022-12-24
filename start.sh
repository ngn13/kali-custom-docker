RED="\e[31m"
GREEN="\e[32m"
RESET="\033[0m"

error(){
    TEXT=$1
    echo -e "$RED[-]$RESET $TEXT"
}

success(){
    TEXT=$1
    echo -e "$GREEN[+]$RESET $TEXT"
}

if ! command -v docker &> /dev/null; then
    error "docker not found"
    exit
fi

if ! id -nG "$USER" | grep -qw "docker"; then
    error "user is not in 'docker' group"
    exit
fi

docker build -t kalicustom .
docker run -dit -h kali --name kali kalicustom
IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kali)
success "kali docker is up!"
success "connect with 'ssh root@$IP' with password 'r00tfault'"