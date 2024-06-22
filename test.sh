#!/bin/bash
#SBATCH -J ColabDesignTest
#SBATCH -p mix_veryshort
#SBATCH -N 1
#SBATCH --gres=gpu:1
#SBATCH -n 4
#SBATCH -o ColabDesignTest_mix_veryshort_%j.log

echo "ColabDesignTest mix_veryshort start"
export LD_LIBRARY_PATH=/appl/anaconda3/envs/SE3nv/lib/:$LD_LIBRARY_PATH
source /appl/anaconda3/etc/profile.d/conda.sh
conda activate /appl/anaconda3/envs/SE3nv/
module load cuda/12.2
echo " "
nvcc --version
echo " "
hostname -s
echo " "
nvidia-smi

cd /home/baelab/Heesoo/test

echo " "
echo "ColabDesign python start"

#### -----Generate any Protein------####
#python /appl/RFdiffusion/scripts/run_inference.py contigmap.contigs=['150-150'] inference.output_prefix=/home/baelab/Heesoo/test/output/result inference.num_designs=1

#### -----Generate Binder ----- ####
/home/baelab/anaconda3/envs/ColabDesignHeesoo/bin/python /home/baelab/gitforder/colabdesign/rf/designability_test.py --pdb=/home/baelab/Heesoo/test/output/result_0.pdb --loc=/home/baelab/Heesoo/test/output/result --contig=A:2:-:1:1:6:/:0: :1:5:0:-:1:5:0 --copies=1 --num_seqs=1 --num_recycles=3 --rm_aa=C --mpnn_sampling_temp=0.0001 --num_designs=1 --initial_guess --use_multimer 

echo " "
echo "ColabDesign python end"
