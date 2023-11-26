%% testing
test_size = size(test_set);
num_correct = 0;
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
	disp([ 'accuracy:',num2str(accuracy)]);