%% The SOA XGM model
function [y, G_4_train]= SOA_2D(x)

global offset;             
global am_compress; 
global Psat;                
global gss;               

    lenX = length(x);
    y = zeros(lenX,1);       % initialize the output of the activation layer
    G_4_train = zeros(lenX/2,1);
    
    for i = 1:lenX/2          % 2 neurons per device
        input1_adj = x(2*i)+offset;
        input2_adj = x(2*i-1)+offset;
        input_s = input1_adj + input2_adj; % Pin=Pin_1+Pin_2+...+Pin_k
        if input_s <= 0
            G = gss;
        else
            G = gss/(1+input_s/Psat); % G = Gss/(1+Pin/Psat)
        end
        y(2*i) = am_compress*input1_adj*G; % Pout_k = Pin_k¡ÁG.
        y(2*i-1) = am_compress*input2_adj*G;  
        G_4_train(i) = G;
    end
end
