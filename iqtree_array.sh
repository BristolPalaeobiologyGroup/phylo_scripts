#!/bin/bash

#PBS -N JOBNAME
#PBS -l nodes=N_NODES:ppn=N_PROCESSORS,walltime=DAYS:HOURS:MINUTES:SECONDS
#PBS -t 0-99

#have sequences in directory "Sequences"
#have directories aligned, trimmed, treefiles
#set NNAX to the number of files 

echo "array id: ${PBS_ARRAYID}"

#cd to current working directory
cd DIR 

#add modules (examples here
module add apps/iqtree-1.6.3
module add apps/mafft-7.402
module add apps/trimal-v1.2

files=(Sequences/*)
files=( "${files[@]##*/}" )
for i in {0..NMAX}
do
        #for every hundredth file
        if [[ $((i%100)) == ${PBS_ARRAYID} ]];
        then
                echo ${files[i]}
                #execute commands with options as you like
                mafft --anysymbol Sequences/${files[i]} > aligned/${files[i]}.aligned
                trimal -automated1 -in aligned/${files[i]}.aligned -out trimmed/${files[i]}.aligned.trimmed
                iqtree -s trimmed/${files[i]}.aligned.trimmed -bb 1000 -m TEST -nt 8 -wbt -pre treefiles/${files[i]}
	fi
done
