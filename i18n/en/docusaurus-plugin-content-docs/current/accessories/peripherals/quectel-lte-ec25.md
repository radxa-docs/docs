---
sidebar_position: 10
---

# QUECTEL LTE EC25

The following uses ROCK 4B+ as an example to describe how to configure the remote LTE EC25-AU module.

## Install related software

Run the following command on the terminal to install the dial-up Internet access software:

```bash
sudo apt update
sudo apt install ppp picocom
```

## Link peripheral

First, connect ROCK 4B+ via USB and move LTE EC25-AU away.

You can check if the device is connected by the following command:

```bash
rock@rock-pi-4b-plus:~$ lsusb | grep -i Quectel
Bus 002 Device 002: ID 2c7c:0125 Quectel Wireless Solutions Co., Ltd. EC25 LTE modem
```

The modem usually communicates with the host computer through a serial port. Check whether the system correctly enumerates the corresponding serial port devices:

```bash
rock@rock-pi-4b-plus:~$ ls /dev/ttyUSB*
/dev/ttyUSB0  /dev/ttyUSB1  /dev/ttyUSB2  /dev/ttyUSB3
```

## Test the modem with the `at` command

First, open the serial port using `picocom` :

```bash
sudo picocom -b 115200 /dev/ttyUSB3
```

After the program starts, you can enter the following `at` command to check the status of the modem:

```bash
  at+cpin?
  +CPIN: READY

  OK  #Check whether the SIM card is in place

  at+csq
  +CSQ: 14,99

  OK  #Detection signal. 99 means no signal

  at+cops?
  +COPS: 1,0,"CHN-UNICOM",7

  OK  #View Carrier

  at+creg?
  +CREG: 0,1

  OK  #Get the registration status of the phone (0,1: indicates normal registration)

  at+qeng="servingcell"
  +QENG: "servingcell","NOCONN","LTE","FDD",460,01,19A358C,366,100,1,5,5,774E,-108,-5,-83,9,13

  OK  #Signal strength and quality of the currently connected service cell
```

If the modems return to normal, you can use the `Ctrl+A Ctrl+X` key combination to exit `picocom` .

## Dial-up Internet via `ppp`

In the terminal, execute the following command to add the `ppp` dial-up configuration script.

You move your mouse over the top right corner of the code box, use the copy button to copy the full text, and then paste the command into the terminal.

```bash
cat << EOF
# The password is hidden during connection debugging
hide-password

# The phone does not require authentication
noauth

# Used for call control scripts
connect '/usr/sbin/chat -s -v -f /etc/ppp/peers/rasppp-chat-connect'

# Disconnect script
disconnect '/usr/sbin/chat -s -v -f /etc/ppp/peers/rasppp-chat-disconnect'

# Debugging information
debug

# 4G module
/dev/ttyUSB3

# Serial baud rate
115200

# Use the default route
defaultroute

# The default IP address is not used
noipdefault

# PPP compression is not used
novj
novjccomp
noccp
ipcp-accept-local
ipcp-accept-remote
local

# It is best to lock the serial bus, create a lock file, and other programs will be able to learn that the appropriate serial port has been used once they discover the existence of this file.
lock
dump

nodetach

# Username password (The configuration varies with carriers)
user ctnet@mycdma.cn
password vnet.mobi

# Hardware control flow
crtscts
remotename 3gppp
ipparam 3gppp

# Use the DNS negotiated on the server side to set the usepeerdns parameter
usepeerdns
EOF | sudo tee /etc/ppp/peers/rasppp

cat << EOF
TIMEOUT 15
ABORT   "BUSY"
ABORT   "ERROR"
ABORT   "NO ANSWER"
ABORT   "NO CARRTER"
ABORT   "NO DIALTONE"

""AT
OK \rATZ

OK \rAT+CGDCONT=1,"IP",""

OK-AT-OK ATDT#777
CONNECT \d\c
EOF | sudo tee /etc/ppp/peers/rasppp-chat-connect

cat << EOF
ABORT "ERROR"
ABORT "NO DIALTONE"
SAY "\NSending break to the modem\n"

""\k"

""+++ATH"
SAY "\nGood bye !\n"
EOF | sudo tee /etc/ppp/peers/rasppp-chat-disconnect
```

You can now try dialing using `ppp` :

```bash
sudo pppd call rasppp &    #Background dialing
```

- The complete dial-up process is shown as follows:

![pppd process one](/img/4G-module/pppd_process1.webp)
![pppd process two](/img/4G-module/pppd_process2.webp)

From the output of the program we can get the following information:

1. local IP address: `10.224.236.90`
2. primary DNS server: `120.80.80.80`
3. secondary DNS servers: `221.5.88.88`

We can now configure the network based on the above information:

```bash
sudo ip route add default via 10.224.236.90 # configure the gateway
echo "nameserver 120.80.80.80" | sudo tee -a /etc/resolv.conf # configure primary DNS
echo "nameserver 221.5.88.88" | sudo tee -a /etc/resolv.conf # Configure secondary DNS
```

You can now use the `ping` command to check if you are connected to the Internet:

![ping](/img/4G-module/ping-success.webp)

## Common issues

1. USB serial port devices are not listed on my system.

Please check whether the corresponding driver is included in the system you are currently running. You can check by executing the following command:

```bash
rock@rock-pi-4b-plus:~$ lsmod | grep usb
usb_wwan               20480  1 option
usbserial              36864  2 usb_wwan,option
```
