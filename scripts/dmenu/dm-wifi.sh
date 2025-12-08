
nmcli

####DISCONNECT
# List WiFi networks
nmcli device wifi list

# List all connections (saved)
nmcli connection show

# List available devices
nmcli device status

###WIFI
# Connect to a saved network
nmcli connection up "Network-Name"

# Connect to new WiFi (will prompt for password)
nmcli device wifi connect "SSID" password "your-password"

# Connect to open WiFi
nmcli device wifi connect "Free-WiFi"

###DISCONNECT
# Disconnect current WiFi
nmcli connection down "Network-Name"

# Disconnect all
nmcli networking off
