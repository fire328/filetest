#!/bin/bash
#SBATCH -J MPNN_test
#SBATCH -p mix_veryshort
#SBATCH -N 1
#SBATCH --gres=gpu:1
#SBATCH -n 4
#SBATCH -o %j.log
#SBATCH -o %j.log

echo "running"
export LD_LIBRARY_PATH=/appl/anaconda3/envs/diffusion/lib/:$LD_LIBRARY_PATH
source /appl/anaconda3/etc/profile.d/conda.sh
conda activate /appl/anaconda3/envs/diffusion/
module load cuda/11.8
nvcc --version
hostname -s
nvidia-smi

echo "python running"
python -m /home/baelab/rfdAA/rf_diffusion_all_atom/run_inference.py inference.deterministic=True diffuser.T=100 inference.output_prefix=output/1BC8/ inference.input_pdb=1BC8.pdb contigmap.contigs=['150-150'] inference.ligand= inference.num_designs=3 inference.design_startnum=0
