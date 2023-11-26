%% Sigmoid function 
function y = activationfunction(x)
    y = 1.0 ./ (1.0 + exp(-1.0.*x));
end