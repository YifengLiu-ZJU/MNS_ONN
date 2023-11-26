function [y, y1, y2] = diff_SOA_2D(x, G_4_train)
global offset;
global am_compress;
global Psat;
global gss;

    lenX = length(x);
    y = zeros(4*lenX/2,1);       % initialize the output of the diff_sigmoid_2D
    y1 = zeros(2*lenX/2,1);
    y2 = zeros(2*lenX/2,1);

    for i = 1:lenX/2         % according to the neurons of the output, we need to calculate 4 derivations
        input1_adj = x(2*i-1)+offset;
        input2_adj = x(2*i)+offset;
        input_s = input1_adj + input2_adj;
        if input_s > 0
            % df1(x1,x2)/dx1
            y(4*i-3) = am_compress*(G_4_train(i)+input1_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat);
            % df2(x1,x2)/dx1
            y(4*i-2) = am_compress*input2_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat;
            % df1(x1,x2)/dx2
            y(4*i-1) = am_compress*input1_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat;
            % df2(x1,x2)/dx2
            y(4*i) = am_compress*(G_4_train(i)+input2_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat);
            % df1(x1,x2)/dx1
            y1(2*i-1) = am_compress*(G_4_train(i)+input1_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat);
            % df2(x1,x2)/dx1 
            y1(2*i) = am_compress*input2_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat;                           
            % df1(x1,x2)/dx2
            y2(2*i-1) = am_compress*input1_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat;
            % df2(x1,x2)/dx2
            y2(2*i) = am_compress*(G_4_train(i)+input2_adj*(G_4_train(i)^2)*(1/gss)*(-1)/Psat);
        else
            % df1(x1,x2)/dx1
            y(4*i-3) = am_compress*G_4_train(i);
            % df2(x1,x2)/dx1
            y(4*i-2) = 0;
            % df1(x1,x2)/dx2
            y(4*i-1) = 0;
            % df2(x1,x2)/dx2
            y(4*i) = am_compress*G_4_train(i);
            % df1(x1,x2)/dx1
            y1(2*i-1) = am_compress*G_4_train(i);         
            % df2(x1,x2)/dx1 
            y1(2*i) = 0;                           
            % df1(x1,x2)/dx2
            y2(2*i-1) = 0;                      
            % df2(x1,x2)/dx2
            y2(2*i) = am_compress*G_4_train(i);
        end
    end
end