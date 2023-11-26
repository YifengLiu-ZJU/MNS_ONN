clear all;
clc;
%% Operation Parameter Setting
power_limit = 0;
%% Controls the maximum number of compute threads
if power_limit == 1
    N_CPU = 7; % the computer has 36 cores
    maxNumCompThreads(N_CPU);
    str=['the cores are limited to ',num2str(N_CPU)];disp(str);
end
%% main program
    global offset; % fixed input
    global am_compress; % compression in SOA
    global Psat; % saturation power
    global gss; % small-signal single-pass gain of the SOA
    offset = 15;
    am_compress = 1/2000;
    Psat = 15;
    gss = 200;
    ann_classifier;