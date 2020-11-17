cd ~/img/

wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O conda_install.sh
bash conda_install.sh -b -p $HOME/img/conda

source conda/bin/activate

export set WORKER_NUM="$1"
export set TOTAL_WORKERS="$2"
ipython notebook.ipynb