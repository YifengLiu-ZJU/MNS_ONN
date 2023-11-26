%% The first-order derivative of the sigmoid function
function y = dactivationfunction(x)
    y =activationfunction(x).*(1-activationfunction(x));
end