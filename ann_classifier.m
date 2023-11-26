%% load training set and testing set(A single hidden layerer)
load('MNISTData.mat');
%% setting parameters
train_size = size(train_set);
alpha = 0.2; % learning rate

N = train_size(1);          % number of training samples(rows£©
D = train_size(2);          % size of individual sample£¨columns£©
n_hidden = 60;             % number of nodes in the hidden layer 
K = 100;                         % number of rows of the output vector 

W1 = 2*rand(1+D, n_hidden)-1; % weights: input layer to hidden layer
W2 = 2*rand(1+n_hidden, K)-1; % weights: hidden layer to ouput layer

max_iter = 100; % number of iterations
Y = eye(K);        % initialize the output vector 

Perf = zeros(max_iter,1); % initialize the accuracy vector 

%% training 
  for i=1:max_iter
%Learning rate of the MNISTData
if i<20
    alpha = 0.5;
else
    if i<45
        alpha = 0.3;
    else
        if i<65
            alpha = 0.2;
        else
            if i<90
                alpha = 0.1;
            else
                alpha = 0.05;
            end
        end
    end
end
disp([num2str(i), ' iteration']);
    
   %% forward
    for j=1:N
        input_x = [1; train_set(j, :)']; % input vector
        [sum_SOA_o, G_for_train_h] = SOA_2D(W1'*input_x); % after SOA processing
        hidden_output= [1;sum_SOA_o]; % output of the hidden layer
        output = activationfunction(W2'*hidden_output); % output after activation function
        
        %% back propagation
        % compute error of output
        delta_c = (output-Y(:,train_label(j)+1)).*dactivationfunction(W2'*hidden_output); 
        % compute error of hidden unit
        delta_h = Hid2Inp(delta_c,W2,W1'*input_x, G_for_train_h);
        % update weight matrix
        W1 = W1 - alpha*(input_x*delta_h');
        W2 = W2 - alpha*(hidden_output*delta_c');       %  hidden_output*delta_c = dEtotal/dw
    end
    test;
    Perf(i,1) = accuracy;
end

%% Test training results
test;

%% plotting
figure(1)
plot(Perf);
xlabel('Iteration');
ylabel('accuracy');
title('Variation of accuracy with number of iterations');