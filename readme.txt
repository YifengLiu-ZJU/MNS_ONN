We propose a universal WDM structure called multiplexed neuron sets (MNS) which can be imple-mented by various WDM devices and apply to both non-linear and linear operations. 

A new BP training algorithm is proposed to alleviate or even cancel inter-channel crosstalk in WDM-ONNs.

Semiconductor optical amplifiers (SOAs) are employed as an example of MNS to construct an WDM-ONN and trained with the new BP training algorithm.

This code includes both the MNIST_handwritten and fashion_MNIST datasets, and you can choose which one to use.

Crosstalk can be changed by adjusting the gss parameter.

important: Top.m A is the top-level function, just run it.

note: It's a 2-layer model. Only the hidden layer induce the SOA function.

The exact formulas and ideas can be found in our paper:https://doi.org/10.48550/arXiv.2308.14015
