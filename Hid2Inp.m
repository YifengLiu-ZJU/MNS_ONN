function delta_h = Hid2Inp(delta_c,W2,net_hidden, G_4_train)
% dEtotal/dinput
    partial_hidden_t = W2*delta_c;                    
    partial_hidden = partial_hidden_t(2:end);
% delta_h = partial_hidden;
    len_ph = length(partial_hidden);
    delta_h = zeros(len_ph,1);

    [~,diff_mid_1,diff_mid_2]=diff_SOA_2D(net_hidden, G_4_train);
    
    delta_h_1 = partial_hidden.*diff_mid_1;
    delta_h_2 = partial_hidden.*diff_mid_2;

    for i = 1 : len_ph/2
        delta_h(2*i-1) = delta_h_1(2*i-1)+delta_h_1(2*i);
        delta_h(2*i) = delta_h_2(2*i-1)+delta_h_2(2*i);
    end
end