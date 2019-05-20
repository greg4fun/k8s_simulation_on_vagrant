USER=vagrant
SYNC_FOLDER='/vagrant'
echo "bootstrap start"
set -x
set -e # exit on error
cat $SYNC_FOLDER/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
cat $SYNC_FOLDER/id_rsa > /home/vagrant/.ssh/id_rsa
cp $SYNC_FOLDER/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa 
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub 
chmod 600 /home/vagrant/.ssh/id_rsa
echo "---------------------------------------------"
echo "UPDATING atp repo"
echo "---------------------------------------------"
sudo apt-get update
echo "---------------------------------------------"
echo "INSTALLING sys packages"
echo "---------------------------------------------"
sudo apt-get install -y $(cat $SYNC_FOLDER/system-requirements.txt)

