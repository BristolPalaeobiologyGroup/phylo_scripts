seed = *seed for random numbers -1 for random

seqfile = *alignment file
treefile = *topology tree file
mcmcfile = *mcmc output
outfile = *stdout output

ndata = *number of partitions in alignment file
seqtype = *0-2 nucleotides, codons, amino acids
usedata = *0-3 no data, seq, approximate, in.bv
clock = *1-3 strict clock, uncorrelated rates, autocorrelated rates

model = *0-10 JC69, K80, F81, F84, HKY85, T92, TN93, REV, UNREST, REVu, UNRESTu
alpha = *alpha value
ncatG = *number discrete gamma categories
cleandata = *0,1 leave ambiguous sites, remove them

BDparas = * Birth, Death, Sampling
kappa_gamma = * alpha, beta of kappa prior gamma
alpha_gamma = * alpha, beta of alpha prior gamma
rgene_gamma = * total tree length / root age (mean) scaled so that alpha = 2
sigma2_gamma = * alpha, beta branch rate variation prior

finetune = 1: .1 .1 .1 .1 .1 .1 *magical trickery
print = *0-2 no mcmc sample, everything except branch lengths, everything
burnin = *n samples discarded
sampfreq = *how often to sample chain
nsample = *number of samples before finish
