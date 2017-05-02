function [avg_y_count_vanilla]= vanilla_perceptron_cancer(x,y,epochs,testdata)
    [x_rows x_cols] = size(x);
    for i = 1:x_rows
        if (y(i:1) == -1)
            x(i,1:x_cols) = -x(i,1:x_cols);
        end
    end
    
 a=zeros(1,x_cols+1);      
 common_class = [x y];   
flag=true;
count=0;
eta =0.01;
no_of_epochs = 0;
while (flag && no_of_epochs < epochs)
  flag=false;
  for i=1:x_rows
    if common_class(i,:)*transpose(a)<=0
      flag=true;
      count=count+1;
      a=a+eta*common_class(i,:);
    end;
  end;
  no_of_epochs = no_of_epochs + 1;
  %disp(a);
end;

%I = ones(1,x_rows)
%I = I'
%X = [x I]
[testdatarows , testdatacols] = size(testdata);
      y_count_vanilla = 0;
        for iteration = 1:testdatarows
           
           x_testvector = [testdata(iteration,1:testdatacols-1) 1];
           %size(x_testvector)
           %size(a)
           if((x_testvector*a') >=0) 
                    y = 1;
           else
                   y = -1;
           end
           
          if (y == testdata(iteration,10));
               y_count_vanilla = y_count_vanilla+1;
           end 
     
        end
        y_count_vanilla;
        %avg_y_count_vanilla = y_count_vanilla /testdatarows;
%                temp =random(50,100);
%                temp = mod(temp,testdatarows);      
        avg_y_count_vanilla = 2*(y_count_vanilla)/testdatarows;
end