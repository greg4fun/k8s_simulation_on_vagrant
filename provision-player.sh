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
sudo apt-get -y update
echo "---------------------------------------------"
echo "INSTALLING sys packages"
echo "---------------------------------------------"
#sudo apt-get install -y $(cat $SYNC_FOLDER/system-requirements.txt)
sudo apt-get -y install ansible 

echo "Installing k8s"
su - vagrant -c "ansible-playbook -i /vagrant/hosts /vagrant/1_k8s_install.yml"
echo "Master"

su - vagrant -c "ansible-playbook -i /vagrant/hosts /vagrant/2_master_cluster_setup.yml"
echo "Workers join"
su - vagrant -c "ansible-playbook -i /vagrant/hosts /vagrant/3_workers_join_cluster.yml"

