#!/bin/bash
#SBATCH -J MPNNtest
#SBATCH -p mix_veryshort
#SBATCH -N 1
#SBATCH --gres=gpu:1
#SBATCH -n 4
#SBATCH -o "MPNNtest_mix_veryshort_%j.log"

echo "MPNNtest mix_veryshort running"
export LD_LIBRARY_PATH=/appl/anaconda3/envs/diffusion/lib/:$LD_LIBRARY_PATH
source /appl/anaconda3/etc/profile.d/conda.sh
conda activate /appl/anaconda3/envs/ligandmpnn_env/
module load cuda/12.2
echo " "
nvcc --version
echo " "
hostname -s
echo " "
nvidia-smi

cd /appl/LigandMPNN
echo " "
echo "LigandMPNN python running"
python ./run.py --seed 111 --pdb_path "/home/baelab/Heesoo/test/input/test_0.pdb" --out_folder "/home/baelab/Heesoo/test/output" --chains_to_design "A"

