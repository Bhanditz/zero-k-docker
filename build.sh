mkdir -p /root/Zero-K
wget --no-clobber -O /root/Zero-K/Chobby.exe https://zero-k.info/lobby/Chobby.exe
chmod u+x /root/Zero-K/Chobby.exe

docker build -t zero-k .
