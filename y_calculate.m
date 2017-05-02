     
    
    function [y] = y_calculate(w, b, c, x)
    summ=0;
    for i=1:length(b)
        summ = summ + c(i)*sign(w(i,:)*x+b(i));
    end
    if sign(summ) == 1
        y = 1;
    else
        y = -1;
    end
end