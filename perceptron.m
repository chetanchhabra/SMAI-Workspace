% class1=[[0.1,1.1];
% [6.8,7.1];
% [-3.5,-4.1];
% [2.0,2.7];
% [4.1,2.8];
% [3.1,5.0];
% [-0.8,-1.3];
% [0.9,1.2];
% [5.0,6.4];
% [3.9,4.0]]
% 
% class2=[[7.1,4.2];
% [-1.4,-4.3];
% [4.5,0.0];
% [6.3,1.6];
% [4.2,1.9];
% [1.4,-3.2];
% [2.4,-4.0];
% [2.5,-6.1];
% [8.4,3.7];
% [4.1,-2.2]]


eta=0.1
a=[0 0 0]
%fileID = fopen('class1.txt','r')
fileID = fopen('class3.txt','r')
formatSpec = '%f %f';
sizeclass1 = [2,Inf]
class1 = fscanf(fileID,formatSpec,sizeclass1)
class1 = class1'
fclose(fileID);

fileID = fopen('class2.txt','r')
formatSpec = '%f %f';
sizeclass2 = [2,Inf]
class2 = fscanf(fileID,formatSpec,sizeclass2)
class2 = class2'
fclose(fileID);


x1=class1(:,1)
y1=class1(:,2)
x2=class2(:,1)
y2=class2(:,2)
class1 = [class1 ones(size(class1, 1), 1)]
class2=-class2
class2 = [class2 -ones(size(class2, 1), 1)]

common_class=[class1;class2]

[nr,nc]=size(common_class)
flag=true
count=0
while (flag)
  flag=false;
  for i=1:nr
    if common_class(i,:)*transpose(a)<=0
      flag=true;
      count=count+1;
      a=a+eta*common_class(i,:);
    end;
  end;
  disp(a);
end;
disp('count and w')
disp(count),disp(a)
x = [-7,10];
x = [-6.0 9.0];
y = [(-a(3)-a(1)*x(1))/a(2) (-a(3)-a(1)*x(2))/a(2)];


hold on;
plot(x1',y1','*r')
hold on;
plot(x2',y2','*b')
plot (x(1:2), y(1:2), 'r', x(1:2), y(1:2), 'b');

xlabel('xaxis');
ylabel('yaxis');

legend('class3','class2');