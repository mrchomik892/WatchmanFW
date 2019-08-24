USERID=`id -u`
if [[ $USERID -ne 0 ]]; then
    echo "You will be must run as root this script"
    exit
fi
echo "Welcome to watchmanfw instalator"
echo "Creator of the watchmanfw is futszak https://github.com/futszak"
mkdir temp_folder
cd temp_folder
apt-get install git
apt-get install follow
git clone https://github.com/futszak/WatchmanFW.git
echo "Installed the watchmanfw"
echo "Installing the components"
apt install python3
mv temp_folder watchmanfw_by_futszak
