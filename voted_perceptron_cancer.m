function [avg_voted_y_count]= voted_perceptron_cancer(x,y,epochs,testdata)
%x = csvread('CancerData.csv',0,1);
 
 w =  [0 0 0 0 0 0 0 0 0];
  w1 = w;
  b = 0;
  c = 1;
  [m,k] = size(x);
  b1 = b;
  c1 = c;
  n = 1;
  size(w);
  for i = 1:epochs
    for j = 1:m
      size(x(j,:));
      size(w);
      temp =  y(j,1)* (dot(w,x(j,[1:k])) + b);
      if(temp <= 0)
        w1 = [w1;w];
        b1 = [b1;b];
        c1 = [c1;c];
        n = n + 1;
        w = w + (y(j,1) * x(j,[1:k]));
        b = b + y(j,1);
        c = 1;
      else  
        c = c + 1;
      end
      end

        w1;
        
      end
      [sw1,sw1col] = size(w1);
      [sb1,sb1col] = size(b1);
      [sc1,sc1col] = size(c1);
        y_my = zeros(sw1,1);
        x_testvector = zeros(1,k);
        sw1;
        
      [testdatarows , testdatacols] = size(testdata);
       y_count = 0;
      for iteration = 1:testdatarows
           
           x_testvector = testdata(iteration,1:k);
           
          ycap = y_calculate(w1,b1,c1,x_testvector');
          t22= ycap ;
           t11 = testdata(iteration,10);
          if (ycap == testdata(iteration,10));
               y_count = y_count+1;
           end
          
      end
     y_count;
     avg_voted_y_count = y_count/testdatarows;   
end 
     
