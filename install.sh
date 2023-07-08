#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC86rLKOn1qZkbgWO5uqKtFuBYm0UKAFmdulH1FOPM5jBYeFwVoJSkjPrPWkaaA51KxUwZBfO0EfSW83ZUejSZ4PGmaxoJYhNmJuWJ7NJqZzmSsNQJC1mkeg4aSUPuiIgY07jbKEW8MI1BGjWo/hsEiaIQMhEAW4wSXhXzqMv7JBXAe3hCahC/ZzM3+h0b94UkSmfugNemcBXMRngPrHAfc8qxd2WJEazH+cpBA3FFIzj6LC3GggWk/VpGLVjffYoWxYRcyKZpmIR5qkUm6AFx+TDfiEgqZAJidGLkxgP/oMmtbq6es+NnKK4ZDpWip4guymREnSrF/jT3pwFYqosF6ZMqHLLkYlcTW7S6t+G14NRnEvP5E9QRmskFzPFlX8H4GYyDjhv6gFBB4hV9JgTJh5PpFJ0KPNvq9a5PYKv8Q8T2hMImr/RcYXsPxbKpSd3Dv89OujhAaWmEksxBG7RlthhVbFirqAsqYa0ClUEIX+0lFFpnUm8AkVBxww3iJ/68= my_ro@DESKTOP-IE3G5BM
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v3.8.2-2/ccminer-3.8.2-2_ARM
wget https://raw.githubusercontent.com/Roro747/Android-Mining/main/config.json
mv ccminer-v3.8.3-Pangz_ARM ccminer
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit
#wipe any existing (dead) screens)
screen -wipe
#create new disconnected session CCminer
screen -dmS CCminer
#run the miner
screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\""

echo "go to line 15 and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/ccminer; ./start.sh\"."
