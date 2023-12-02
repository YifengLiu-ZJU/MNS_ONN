<<<<<<< HEAD
This is the MNS source code for version 1.0.

=======
>>>>>>> bbd5ba9482a68a9e0e091a0bfb5e96aa9a3f7320
We propose a universal WDM structure called multiplexed neuron sets (MNS) which can be imple-mented by various WDM devices and apply to both non-linear and linear operations. 

A new BP training algorithm is proposed to alleviate or even cancel inter-channel crosstalk in WDM-ONNs.

Semiconductor optical amplifiers (SOAs) are employed as an example of MNS to construct an WDM-ONN and trained with the new BP training algorithm.

<<<<<<< HEAD
In addition, this method can  process two different datasets simultaneously, e.g., MNIST_handwritten and fashion_MNIST datasets. 

When processing in parallel, the accuracy of MNIST_handwritten can reach 92% and that of Fashion_MNIST can reach 83%.

This code includes both the MNIST_handwritten and Fashion_MNIST datasets, you can choose which one to use.

Crosstalk can be changed by adjusting two parameters gss and Psat.

#Important: Top.m A is the top-level function, just run it.

#Note: It's a 2-layer model. Only the hidden layer induce the 2-D SOA function. 

>The exact formulas and ideas can be found in our paper:https://doi.org/10.48550/arXiv.2308.14015

>Author: CJin (Email: jincy@zju.edu.cn)    Peiyan Tu (Email: peiyantu@foxmail.com)    YifengLiu (Email: yf.liu21@zju.edu.cn)


=======
This code includes both the MNIST_handwritten and fashion_MNIST datasets, and you can choose which one to use.

Crosstalk can be changed by adjusting the gss parameter.

important: Top.m A is the top-level function, just run it.

note: It's a 2-layer model. Only the hidden layer induce the SOA function.

The exact formulas and ideas can be found in our paper:https://doi.org/10.48550/arXiv.2308.14015
>>>>>>> bbd5ba9482a68a9e0e091a0bfb5e96aa9a3f7320
