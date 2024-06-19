#!/bin/bash
#SBATCH -J RFdiffusionTest
#SBATCH -p mix_veryshort
#SBATCH -N 1
#SBATCH --gres=gpu:1
#SBATCH -n 4
#SBATCH -o RFdiffusionTest_mix_veryshort_%j.log

echo "RFdiffusionTest mix_veryshort running"
export LD_LIBRARY_PATH=/appl/anaconda3/envs/SE3nv/lib/:$LD_LIBRARY_PATH
source /appl/anaconda3/etc/profile.d/conda.sh
conda activate /appl/anaconda3/envs/SE3nv/
module load cuda/11.8
echo " "
nvcc --version
echo " "
hostname -s
echo " "
nvidia-smi

cd /appl/RFdiffusion/scripts/
echo " "
echo "RFdiffusion python running"
#### -----Generate any Protein------####
python ./run_inference.py contigmap.contigs=['150-150'] inference.output_prefix=/home/baelab/Heesoo/test/result inference.num_designs=1

cd /appl/RFdiffusion/scripts/
#### -----Generate Binder ----- ####
#python ./run_inference.py inference.input_pdb=/home/baelab/Heesoo/test/input/7ai6.pdb  contigmap.contigs=['A2-116/0 150-150'] ppi.hotspot_res=[A11,A12,A13,A33,A34,A35,A36,A38,A53,A54,A56,A58,A61,A68,A70,A72,A74] inference.output_prefix=/home/baelab/Heesoo/test/output/result inference.num_designs=1
