#!/bin/bash
#SBATCH --nodes=2
#SBATCH --nodelist=gnode006,gnode008
#SBATCH --partition gpu 
##SBATCH --qos=gpu-ext
#SBATCH --time=0-00:29:00 
#SBATCH --ntasks-per-node=56 
#SBATCH --output=ng_logGP_internode%j.stdout    
#SBATCH --job-name=ng_logGP_internode   
#SBATCH --gres=gpu:2

# ---[ Script Setup ]---

set -e


module load mpich

mpirun -n 2 --hosts "gnode006,gnode008" hostname

# mpirun -n 2 /home/ldai8/software/netgauge-2.4.6/netgauge --verbosity 3 -t 30 -s 1048576 -c 20 -g 65535 -x loggp -o

mpirun -n 2 --hosts "gnode006,gnode008" /home/ldai8/software/netgauge-2.4.6/netgauge -m ib  -x loggp -o ng_logGP_internode



