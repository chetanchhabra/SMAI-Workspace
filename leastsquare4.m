x = [[3 3 2 0 -1 0 -1 1];[3 0 1 1.5 1 0 -1 0 ]]
x0 = ones(1,8)
X = [x0;x]
X = X'

class =[1;1;1;1;-1;-1;-1;-1]
Y = class
W = [1;1;1]
T = inv((X'*X))
W = T*X'*Y

    scatter(X(1:4,2),X(1:4,3),'b','filled')
    hold on
    scatter(X(5:8,2),X(5:8,3),'r','filled')
    hold on 
xaxis = [-10:10]
yaxis = ((-W(1,1) -W(2,1)*xaxis)/(W(3,1)))
plot(xaxis,yaxis)


xlabel('xaxis');
ylabel('yaxis');

legend('class1','class2');