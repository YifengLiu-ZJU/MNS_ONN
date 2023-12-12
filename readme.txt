
This is the MNS source code for version 1.0.

We propose a universal WDM structure called multiplexed neuron sets (MNS) which can be implemented by various WDM devices and apply to both non-linear and linear operations. 

A new BP training algorithm is proposed to alleviate or even cancel inter-channel crosstalk in WDM-ONNs.

Semiconductor optical amplifiers (SOAs) are employed as an example of MNS to construct a WDM-ONN as shown in version 1.0.

In addition, this method can  process either the MNIST_handwritten digits or the fashion_MNIST dataset，as shown in our disclosed article, https://doi.org/10.48550/arXiv.2308.14015. 

This code includes both the MNIST_handwritten and the Fashion_MNIST datasets, you can choose which one to use.

Crosstalk can be changed by adjusting two parameters gss and Psat.

#Important: Top.m A is the top-level function, just run it.

#Note: It's a 2-layer model. Only the hidden layer induce the 2-D SOA function. 

>The exact formulas and ideas can be found in our paper:https://doi.org/10.48550/arXiv.2308.14015

>Author: CJin (Email: jincy@zju.edu.cn)    Peiyan Tu (Email: peiyantu@foxmail.com)    YifengLiu (Email: yf.liu21@zju.edu.cn)



