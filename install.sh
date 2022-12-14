if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
buildir=$(pwd)

if ! which curl > /dev/null; then
  sudo apt-get --yes install curl
fi

if ! which untar > /dev/null; then
  sudo apt-get install untar -y
fi

curl https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2022-12/R/eclipse-cpp-2022-12-R-linux-gtk-x86_64.tar.gz&mirror_id=1287

untar eclipse-cpp*.tar.gz

mkdir ~/eclipse

mv -r eclipse/ ~/eclipse/cpp

echo "alias eclipse-cpp='~/eclipse/cpp/eclipse'" >> /home/user/.bashrc

curl https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2022-12/R/eclipse-java-2022-12-R-linux-gtk-x86_64.tar.gz&mirror_id=105

untar eclipse-java*.tar.gz

mv -r eclipse/ ~/eclipse/java

echo "alias eclipse-java='~/eclipse/java/eclipse'" >> /home/user/.bashrc
