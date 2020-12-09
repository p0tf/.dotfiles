#!/bin/sh
cat << EOF > ~/.alacritty_startup.sh
#!/bin/sh
sleep 0.1
nvim
EOF
chmod +x ~/.alacritty_startup.sh
