%% testing
test_size = size(test_set);
<<<<<<< HEAD
test_size2 = size(test_set2);
num_correct = 0;
num_correct2 = 0;
=======
num_correct = 0;
>>>>>>> bbd5ba9482a68a9e0e091a0bfb5e96aa9a3f7320
for i1=1:test_size(1) % number of test samples
    input_x = [1; test_set(i1,:)']; % input matrix
    [sum_SOA_o, ~] = SOA_2D(W1'*input_x); % after SOA processing
    hidden_output = [1;sum_SOA_o]; % output of the hidden layer
    output = activationfunction(W2'*hidden_output); % output after activation function
    [max_unit, max_idx] = max(output);  % max_idx:Location of the first occurrence of the maximum value
    if(max_idx == test_label(i1)+1)
        num_correct = num_correct + 1;
    end
end
% computing accuracy
accuracy = num_correct/test_size(1);
<<<<<<< HEAD
	disp([ 'Digital accuracy:',num2str(accuracy)]);
    
%%
for i2=1:test_size2(1) % number of test samples
    input_x2 = [1; test_set2(i1,:)']; % input matrix
    [sum_SOA_o2, ~] = SOA_2D(W3'*input_x2); % after SOA processing
    hidden_output2 = [1;sum_SOA_o2]; % output of the hidden layer
    output2 = activationfunction(W4'*hidden_output2); % output after activation function
    [max_unit2, max_idx2] = max(output2);  % max_idx:Location of the first occurrence of the maximum value
    if(max_idx2 == test_label2(i2)+1)
        num_correct2 = num_correct2 + 1;
    end
end
% computing accuracy
accuracy2 = num_correct2/test_size2(1);
	disp([ 'Fashion accuracy:',num2str(accuracy2)]);
=======
	disp([ 'accuracy:',num2str(accuracy)]);
>>>>>>> bbd5ba9482a68a9e0e091a0bfb5e96aa9a3f7320
