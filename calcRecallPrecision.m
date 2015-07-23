function [ recall,precision ] = calcRecallPrecision( X,theta,y )
%CALCRECALPRESION Summary of this function goes here
%   Detailed explanation goes here
 p = predict(theta, X);
 sum1 =0;
 sum2 =0;
 sum3 =0;
 for i=1 : length(p) 
    if ( p(i,1)== 1 && y (i,1) == 1) 
       sum1 = sum1+1;
    elseif (p(i,1) == 1 && y(i,1) == 0) 
            sum2= sum2+1;
    elseif( p(i,1) == 0 && y(i,1) == 1)
        sum3 = sum3+1;
    end
 end
recall = sum1/(sum1+sum3);
precision = sum1/(sum1+sum2);

end

