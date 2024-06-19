#!/bin/bash
#SBATCH -J RFdiffusionAATest
#SBATCH -p mix_veryshort
#SBATCH -N 1
#SBATCH --gres=gpu:1
#SBATCH -n 4
#SBATCH -o "RFdiffusionAATest_mix_veryshort_%j.log"

echo "RFdiffusionAATest mix_veryshort running"
export LD_LIBRARY_PATH=/appl/anaconda3/envs/diffusion/lib/:$LD_LIBRARY_PATH
source /appl/anaconda3/etc/profile.d/conda.sh
conda activate /appl/anaconda3/envs/diffusion/
module load cuda/11.8
nvcc --version
hostname -s
nvidia-smi

cd /home/baelab/rfdAA/rf_diffusion_all_atom
echo "python running"
python ./run_inference.py inference.deterministic=True diffuser.T=100 inference.output_prefix=/home/baelab/Heesoo/test/output/result inference.input_pdb=/home/baelab/Heesoo/test/input/7v11.pdb contigmap.contigs=['150-150'] inference.ligand=OQO inference.num_designs=1 inference.design_startnum=0

