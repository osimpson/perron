function [ dom ] = llsmvector( A )
%LLSMVECTOR Summary of this function goes here
%   Detailed explanation goes here

%add commments!

[n,m]=size(A);
v=zeros(n,1);
J=prod(A,2,'native');
for k=1:n
    J(k,1)=J(k,1)^(1/5);
end

sumOfRowProducts=sum(J);

for k=1:n
    
   v(k,1)=(J(k,1)/sumOfRowProducts);  
   
end

dom=v;

end

