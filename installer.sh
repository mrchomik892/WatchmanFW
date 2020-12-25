#ROOT CHECK
USERID=`id -u`
if [[ $USERID -ne 0 ]]; then
    echo "You will be must run as root this script"
    exit
fi
#SCRIPT
echo "Welcome to watchmanfw instalator"
echo "Creator of the watchmanfw is futszak https://github.com/futszak"
#
mkdir temp_folder
cd temp_folder
#Installing git and follow (req of watchmanfw i think)
#if you are using other packet manager then change it to yours
#if it's installed hash it with # <:
apt-get install git
apt-get install follow
#Cloning WatchmanFW from github
git clone https://github.com/futszak/WatchmanFW.git
echo "Installed the watchmanfw"
#Installing components (python)
echo "Installing the components"
#install python, hash if you have python3 already
apt install python3
#move temp_folder to watchmanfw_by_futszak
mv temp_folder watchmanfw_by_futszak
#end
echo "Ended installation. Successfull"
exit 0
