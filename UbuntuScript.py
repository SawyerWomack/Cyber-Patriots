import os

running = True

password = "CyberPatriots23$$"

functions = [
    "Update",
    "ManageUsers",
    "pFiles",
    "autoUpdate",
    "firewallConfig",
    "chngPasswd"
]



badFileTypes = [
    "mov",
    "mp4",
    "mp3",
    "wav",
    "jpg",
    "jpeg",
    "tar.gz",
    "php",
    "backdoor*.*"

]


sysUsers = []

users = str(os.popen("cut -d: -f1,3 /etc/passwd | egrep \':[0-9]{4}$\' | cut -d: -f1").read())
    #removesdafault users
sysUsers = users.split("\n")

#removes a empty string in the array
sysUsers.sort()
sysUsers.pop(0)

print(sysUsers)


def test():
    os.popen("cat users")

def display():
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("			  _________                 ________.____________ 		   ")
    print("			 /   _____/ ____           /   __   \   ____/_   |		   ")
    print("			 \_____  \_/ ___\   ______ \____    /____  \ |   |		   ")
    print("			 /        \  \___  /_____/    /    //       \|   |		   ")
    print("			/_______  /\___  >           /____//______  /|___|		   ")
    print("			        \/     \/                         \/      		   ")
    print("                                                            		   ")
    print("~~~~~~~~~~~~~Written by: Sawyer Womack AFJROTC SC-951~~~~~~~~~~~~~~~")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("1) Update		            2) Manage Users				           ")
    print("3) find prohibited files 	4) Set auto updates					   ")
    print("5)Congure the firewall		6) Change all passwords 		       ")
    print("69) Exit						70) Reboot							   ")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    num = int(input("enter command: "))
    num -= 1
    if(num != 68):
        eval(functions[num] + "()")
        return True
    else:
        return False
    

    

def Update():
    os.system("sudo apt-get update -y")
    os.system("wait")
    os.system("sudo apt-get update -y")
    os.system("wait")
    os.system("sudo apt-get upgrade -y")
    os.system("wait")
    os.system("sudo apt-get dist-upgrade -y")
    os.system("wait")
    os.system("killall firefox")
    os.system("wait")
    os.system("sudo apt-get --purge --reinstall install firefox -y")
    os.system("wait")
    os.system("sudo apt-get install clamtk -y	")
    os.system("wait")
    

def ManageUsers():
    

    inputUsers = input("please copy and paste the user part of the readme:")
    

    readMeUsers = inputUsers.split(" ")
    
    
    #sorts the arrays so that the arrays contain the names in the same order
    
    readMeUsers.sort()
    print(sysUsers)
    
    #readme to system
    
    for i in range(0,len(readMeUsers)):
        found = False
        for x in range(0, len(sysUsers)):
            if(readMeUsers[i] == sysUsers[x]):
                found = True
                break
        if(found == False):
            print(readMeUsers[i] + " is not in the system")
        
    

            
    #system to readme

    for i in range(0,len(sysUsers)):
        found = False
        for x in range(0, len(readMeUsers)):
            if(readMeUsers[x] == sysUsers[i]):
                found = True
                break
        if(found == False):
            print(sysUsers[i] + " is not in the readme")
    input()


def autoUpdate():
    os.system("sed -i -e 's/APT::Periodic::Update-Package-Lists.*\+/APT::Periodic::Update-Package-Lists \"1\";/' /etc/apt/apt.conf.d/10periodic")
    os.system("sed -i -e 's/APT::Periodic::Download-Upgradeable-Packages.*\+/APT::Periodic::Download-Upgradeable-Packages \"0\";/' /etc/apt/apt.conf.d/10periodic")
    os.system("sed -i 's/x-scheme-handler\/http=.*/x-scheme-handler\/http=firefox.desktop/g' /home/$UserName/.local/share/applications/mimeapps.list")

def pFiles():
    for i in range(0, len(badFileTypes)):
        os.system("sudo find / -name \"*" + badFileTypes[i] + "\" -type f >> pFiles.log")

def firewallConfig():
    os.system("sudo apt-get install ufw")
    os.system("sudo ufw enable")
    os.system("sudo ufw status")

def confLogin():
    os.system("sed -i \"s/PASS_MAX_DAYS 99999/PASS_MAX_DAYS 60\" /etc/login.defs")


#def chngPasswd():
 #   for i in range(0,len(sysUsers)):
 #       os.system("sudo passwd " + sysUsers[i])
 #       print(password)


def sys():
    os.system("sudo sed -i '$a net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.conf ")
    os.system("sudo sed -i '$a net.ipv6.conf.default.disable_ipv6 = 1' /etc/sysctl.conf")
    os.system("sudo 	sed -i '$a net.ipv6.conf.lo.disable_ipv6 = 1' /etc/sysctl.conf")

    os.system("sudo sed -i '$a net.ipv4.conf.all.rp_filter=1' /etc/sysctl.conf")

    os.system("sudo sed -i '$a net.ipv4.conf.all.accept_source_route=0' /etc/sysctl.conf")

    os.system("sudo sed -i '$a net.ipv4.tcp_max_syn_backlog = 2048' /etc/sysctl.conf")
    os.system("sudo sed -i '$a net.ipv4.tcp_synack_retries = 2' /etc/sysctl.conf")
    os.system("sudo sed -i '$a net.ipv4.tcp_syn_retries = 5' /etc/sysctl.conf")
    os.system("sudo sed -i '$a net.ipv4.tcp_syncookies=1' /etc/sysctl.conf")

    os.system("sudo sed -i '$a net.ipv4.ip_foward=0' /etc/sysctl.conf")
    os.system("sudo sed -i '$a net.ipv4.conf.all.send_redirects=0' /etc/sysctl.conf")
    os.system("sudo sed -i '$a net.ipv4.conf.default.send_redirects=0' /etc/sysctl.conf")










while(running):
    running = display()