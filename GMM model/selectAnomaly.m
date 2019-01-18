function a = selectAnomaly(epsilon, p)
%SELECTANOMALY select the anomalies in the training set

k = length(p);

b = zeros(1,1);

for i = 1:1:k

    if p(i) < epsilon
       b(i) = 1;
    else   
       b(i) = 0;
    end
      
end

a = b';

end