x = [[3 3 2 0 -1 0 -1 1];[3 0 1 1.5 1 0 -1 0 ]]
x = x'

[n,d] = size(x) % n samples d dimension
sum1 = 0.0;
sum2 = 0.0;
n1 = n/2
for i= 1:n1    
    sum1 = sum1 + x(i,1);
    sum2 = sum2 + x(i,2);
end
m1 = [0.0 0.0];
m1(1,1) = sum1/n1;
m1(1,2) = sum2/n1 

sum1 = 0.0;
sum2 = 0.0;
for i = n1+1:n
     sum1 = sum1 + x(i,1);
     sum2 = sum2 + x(i,2);
end   
m2 = [0.0 0.0];
m2(1,1) = sum1/n1;
m2(1,2) = sum2/n1 



s1 = zeros(1,n1); 
s1=s1';

s2 = zeros(1,n1); 
s2=s2';

S1 = zeros(d,d);
for i = 1:n1
   
    s1(i,1) = x(i,1) - m1(1,1);
    s2(i,1) = x(i,2) -m1(1,2);
    S = [s1(i,1) s2(i,1)];
    %S'*S
    S1 = S1 + S'*S;
end
s1
s2 
%S = [s1 s2]

%S1 = s1*transpose(s1)
S1


s3 = zeros(1,n1); 
s3=s3';

s4 = zeros(1,n1); 
s4=s4';

S2 = zeros(d,d);
for i = n1+1:n
   
    s3(i-n1,1) = x(i,1) - m2(1,1);
    s4(i-n1,1) = x(i,2) - m2(1,2);
    S = [s3(i-n1,1) s4(i-n1,1)];
    %S'*S
    S2 = S2 + S'*S;
end
s3
s4 

S2

Sw = zeros(d,d);
Sw = S1 + S2
m1 - m2 
w = zeros(d,d);
w = w';
inv(Sw)
w = inv(Sw)*(m1-m2)';

w = w/norm(w)
    scatter(x(1:4,1),x(1:4,2),'b','filled')
    hold on
    scatter(x(5:8,1),x(5:8,2),'r','filled')
    hold on 
    xaxis = [-10:10];
    yaxis = ((w(2,1)*xaxis)/w(1,1));
    plot(xaxis,yaxis)
%     
%    vector = zeros(8,2);
%    for i = 1:8
%        for j = 1:2
%            vector(i,j) =

        
        mean = zeros(1,2);
        mean (1,1) = (m1(1,1)+m2(1,1))/2;
        mean (1,2)  = (m1(1,2) + m2(1,2))/2;
        mean
        bias = -dot(mean,w)

%    mean = (np.matrix(mean_c1) + np.matrix(mean_c2))/2
%     bias = -np.dot(mean,W_v)
%     #print "mean :",mean
%     #print "bias :",bias
%     
    x = [-6:6]
    y = ((w(1,1)*x + bias)/-w(2,1))
%         Y.append(y)
%     Y = [y[0][0].tolist() for y in Y]
%     Y = [y[0][0] for y in Y]
%     plt.plot(X,Y, color='g', label = 'fisher classifier')

plot(x,y)

xlabel('xaxis');
ylabel('yaxis');

legend('class1','class2');
   
    
    
    
    