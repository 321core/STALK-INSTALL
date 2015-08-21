# How To Install sTalk to various operating system sw

## stalk on Ubuntu
1. wget https://raw.githubusercontent.com/321core/STALK-INSTALL/master/install-ubuntu.sh
2. sh install-ubuntu.sh

## stalk on CentOS
1. wget https://raw.githubusercontent.com/321core/STALK-INSTALL/master/install-centos.sh
2. sh install-centos.sh

## stalk on OS-X
1. First, git should be installed on your mac.
2. wget https://raw.githubusercontent.com/321core/STALK-INSTALL/master/install-osx.sh
3. sh install-osx.sh

## stalk on Rasberry PI
1. wget https://raw.githubusercontent.com/321core/STALK-INSTALL/master/install-rasberry.sh
2. sh install-rasberry.sh

## stalk on Cygwin
1. First, the following items must be installed on Cygwin
       * python
       * git
       * wget
       * cygrunsrv

2. wget https://raw.githubusercontent.com/321core/STALK-INSTALL/master/install-cygwin.sh
3. sh install-cygwin.sh
4. run Cygwin terminal as Administrator and type this:
      ```
       cygrunsrv -I stalk -p /usr/bin/python2.7.exe -a /usr/share/stalk/service/talkd.py
       cygrunsrv -S stalk
      ```

5. now, stalk is installed as windows service. (you can quit Cygwin terminal now)
   You can check it by entering the url of 'http://localhost:8900' in the Chrome browser. 
   If pop up a page correctly, stalk is successfully installed.


## stalk on Android APK

1. https://raw.githubusercontent.com/321core/STALK-INSTALL/master/android-app/app-debug.apk


# How To Use

  - after installation
    - ssh 22 port is automatically registered to Server
  
  - list entries
    ```
    stalk status 
    ```
    
  - register server entry
    ```
    stalk server CHANNEL_NAME HOST_ADDR HOST_PORT
    (ex) stalk server my-resberry-web localhost 80
    ```
    
  - register client entry
    ```
    stalk client CHANNEL_NAME LOCAL_PORT
    (ex) stalk client my-rasberry-web 8000
    ```
  
  - cancel entry
    ```
    stalk kill ENTRY_ID
    (ex) stalk kill 17
    * ENTRY_ID is available via "stalk status" command.
    ```
