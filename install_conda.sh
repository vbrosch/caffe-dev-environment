#!/bin/sh
wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O /tmp/Anaconda.sh
sudo chmod +x /tmp/Anaconda.sh
bash /tmp/Anaconda.sh -b -p ~/conda
echo ". /home/$USER/conda/etc/profile.d/conda.sh" >> ~/.bashrc
echo ". /home/$USER/conda/etc/profile.d/conda.sh" >> ~/.zshrc

rm /tmp/Anaconda.sh

~/conda/bin/conda create -y -n python3.5 python=3.5
~/conda/bin/conda create -y -n python3.6 python=3.6
~/conda/bin/conda create -y -n python3.7 python=3.7

echo "conda was successfully installed with python3.5, python3.6 and python3.7."
echo "Please re-source your bashfile by using source ~/.bashrc (on bash) to automatically add conda to your path."
echo "Afterwards, it should be possible to switch into the virtual environments by running 'conda activate python3.5' etc."
