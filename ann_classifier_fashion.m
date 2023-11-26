%% load training set and testing set(A single hidden layerer)
load('MNIST_Fashion.mat');
%% setting parameters
trainsize = size(trainData);
    alpha_f = 0.2; % learning rate

NF = trainsize(1);          %number of training samples(rows£©
DF = trainsize(2);          %size of individual sample£¨columns£©
nf_hidden = 60;             %number of nodes in the hidden layer 
KF = 10; 

W1 = 2*rand(1+DF, nf_hidden)-1; %weights: input layer to hidden layer
W2 = 2*rand(1+nf_hidden, KF)-1; %weights: hidden layer to ouput layer

max_iter_f = 100; % number of iterations
Y = eye(KF); % initialize the output vector 

Perf = zeros(max_iter_f,1);

%% training 
for k=1:max_iter_f
if k<20
    alpha_f = 0.5;
else
    if k<45
        alpha_f = 0.3;
    else
        if k<65
            alpha_f = 0.2;
        else
            if k<90
                alpha_f = 0.1;
            else
                alpha_f = 0.05;
            end
        end
    end
end
	disp([num2str(k), ' iteration']);
    
   %% forward
    for k=1:NF
        input_xf = [1; trainData(k, :)'];
        [sum_SOA_of, G_for_train_hf] = SOA_2D(W1'*input_xf);

        hidden_outputf= [1;sum_SOA_of];
%     hidden_output = [1;activationfunction(W1'*input_x)];
        outputf = activationfunction(W2'*hidden_outputf);
%     [output,G_for_train_o] = SOA_2D(W2'*hidden_output);
        
        %% judge whether the output have illegal values
        Nan_judge;
        if Nan_judge_o == 1
            error_log_tee;
            error('Error occurred');
        end
        
        %% back propagation
        % compute error of output
        % delta_c = Out2Hid(output,Y,train_label(j),W2,hidden_output,G_for_train_o);
        delta_cf = (outputf-Y(:,train_label(kf)+1)).*dactivationfunction(W2f'*hidden_outputf);
        % compute error of hidden unit
        delta_hf = Hid2Inp(delta_cf,W2f,W1f'*input_xf, G_for_train_hf);
        % delta_h = (W2*delta_c).*[1;dactivationfunction(W1'*input_x)];             
        % delta_h = delta_h(2:end);

        % update weight matrix
        W1f = W1f - alpha_f*(input_xf*delta_hf');
        W2f = W2f - alpha_f*(hidden_outputf*delta_cf');       %  hidden_output*delta_c = dEtotal/dw
    end
    test;
    Perf(k,1) = accuracy;
end

%% demo
test;

%% plotting
figure(1)
plot(Perf);
xlabel('Iteration');
ylabel('accuracy');
title('Crosstalk-1HL-250Nodes');

figure(1)
plot(Perf_sin);
hold on
plot(Perf_ct_250_0_06(1:40));
xlabel('iteration');
ylabel('accuracy');
legend('without-crosstalk','with-crosstalk');


Perf_ct_H_O_100_0_1_SpS_b0_9 = Perf;
save('Perf-crosstalkonHandO-1HL-100Nodes-0_1-sigPsig-b0_9','Perf_ct_H_O_100_0_1_SpS_b0_9');



