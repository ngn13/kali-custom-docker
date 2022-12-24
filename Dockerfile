FROM kalilinux/kali-rolling

RUN apt update
RUN apt install -y zsh curl openssh-server git vim openvpn

RUN apt install kali-linux-large

WORKDIR /root
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
COPY files/zshrc .zshrc
COPY files/kali.zsh-theme .oh-my-zsh/themes/kali.zsh-theme
RUN usermod -s /bin/zsh root
RUN echo 'root:r00tfault' | chpasswd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN touch ~/.hushlogin

COPY files/entry.sh /entry.sh
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]