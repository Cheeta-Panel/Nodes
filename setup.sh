sudo -l
echo Installing Cheeta-Panel Nodes
mkdir /ect/cheeta-panel
mkdir /ect/cheeta-panel/nodes
cd /ect/cheeta-panel/ & git clone https://github.com/Cheeta-Panel/Nodes nodes
echo alias cheetapanelnodes="node /etc/cheeta-panel/nodes/src/index.js" >> '~/.bashrc'
cd /ect/cheeta-panel/nodes/src & npm install
echo Cheeta-Panel Nodes sucessfully installed running config.json setup...
echo From the panel copy and paste the JSON data it gives you (WARNING DOING THIS INCORRECTLY MAY LEAD TO THE WINGS BEING CORRUPTED OR WINGS DATA BEING STOLEN)
read json_file
echo json_file >> "/etc/cheeta-panel/nodes/config.json"
echo Setup Done. Now exitting and launching wings service.
touch "/etc/systemd/system/nodescheetapanel.service"
echo "[Unit]
Description=CheetaPanelWings
After=network.target
StartLimitIntervalSec=0[Service]
Type=simple
Restart=on-failure
User=root
ExecStart=node /etc/cheeta-panel/node/src/index.js
[Install]
WantedBy=multi-user.target
" >> "/etc/systemd/system/nodescheetapanel.service"

node /etc/cheeta-panel/node/src/index.js & disown
exit
