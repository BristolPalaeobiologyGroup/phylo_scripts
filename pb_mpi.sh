#!/bin/bash
#PBS -N NAME
#PBS -l walltime=HHH:MM:SS,nodes=N:ppn=NP
#PBS -M alan.beavan@bristol.ac.uk
#PBS -t 1-number of chains

#load mpirun
module load mvapich/gcc/64/1.2.0-qlc

# Where to run this ------------------------------------------------
export RUNDIR=""

# Name of application ---------------------------------------------------
export APPLICATION="/cm/shared/apps/PhyloBayes-1.5a-MPI/pb_mpi1.5a/data/pb_mpi"

# Any required run flags/input files etc. -------------------------------
export RUNFLAGS="-d alignment -gtr -cat -dgam 4 (change as you like) mpi_chain${PBS_ARRAYID}"

# Change into the working directory -------------------------------------
cd $RUNDIR

# No need to change anything below this line -------------------------
# Generate the list of nodes the code will run on -----------------------
cat $PBS_NODEFILE
export nodes=`cat $PBS_NODEFILE`
export nnodes=`cat $PBS_NODEFILE | wc -l`
export confile=inf.$PBS_JOBID.conf

for i in $nodes 
do
	   echo ${i} >>$confile
done

# Execute the code ------------------------------------------------------
mpirun -np $nnodes -machinefile $confile $APPLICATION $RUNFLAGS
