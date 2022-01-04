sudo -l
echo Installing Cheeta-Panel Nodes
mkdir /ect/cheeta-panel
mkdir /ect/cheeta-panel/nodes
cd /ect/cheeta-panel/ & git clone https://github.com/Cheeta-Panel/Nodes nodes
echo alias cheetapanelnodes="node /etc/cheeta-panel/nodes/src/index.js" >> '~/.bashrc'
echo Cheeta-Panel Nodes sucessfully installed running config.json setup...
echo From the panel copy and paste the JSON data it gives you (WARNING DOING THIS INCORRECTLY MAY LEAD TO THE WINGS BEING CORRUPTED OR WINGS DATA BEING STOLEN)
read json_file
echo json_file >> "/etc/cheeta-panel/nodes/config.json"
echo Setup Done. Now exitting
exit
