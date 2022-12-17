#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

printf "press [1] :    To Install Eclipse for C & java (654MB needs to be downloaded)"
printf "press [2] :    To Install Eclipse for C (352 MB needs to be downloaded)"
printf "press [3] :    To Install Eclipse for java (302 MB needs to be downloaded)"
printf "press [x] :    To Exit"
read -r choice

while true; do
    read -p choice
    case $choice in
        [1]*)
            installEclipseC
            installEclipseJava
            echo "Happy Coding"
            break
            ;;
        [2]*)
            installEclipseC
            echo "Happy Coding"
            break
            ;;
        [3]*)
            installEclipseJava
            echo "Happy Coding"
            break
            ;;
        [xX]*)
            echo 'Ok, exiting'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

if ["$choice" == "1"] | ["$choice" == "2"] | ["$choice" == "3"]; then
  if ! which curl > /dev/null; then
    echo "Installing recquired dependency - Curl"
    sudo apt-get install curl -y
  fi

  if ! which tar > /dev/null; then
    echo "Installing recquired dependency - Curl"
    sudo apt-get install tar -y
  fi
fi

function installEclipseC() {
  curl https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2022-12/R/eclipse-cpp-2022-12-R-linux-gtk-x86_64.tar.gz&mirror_id=1287

  tar -xvf eclipse-cpp*.tar.gz
  mkdir -p ~/eclipse
  mv -r eclipse/ ~/eclipse/cpp
  echo "alias eclipse-cpp='~/eclipse/cpp/eclipse'" >> ~/.bashrc
  echo "Installed Eclipse for C"
}

function installEclipseJava() {
  curl https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2022-12/R/eclipse-java-2022-12-R-linux-gtk-x86_64.tar.gz&mirror_id=105
  
  tar -xvf eclipse-java*.tar.gz
  mkdir -p ~/eclipse
  mv -r eclipse/ ~/eclipse/java
  echo "alias eclipse-java='~/eclipse/java/eclipse'" >> ~/.bashrc
  echo "Installed Eclipse for Java"
}
