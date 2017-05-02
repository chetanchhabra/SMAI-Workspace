arr_final_avg_voted = zeros(1,9);
arr_final_avg_vanilla = zeros(1,9);
counter = 1;
data = csvread('CancerData.csv',0,1);
[rows , cols] = size(data)
testrows = (rows-3)/10;
ptr = 1;
table = 1
epochs_all = [10: 5: 50];
for i=1: length(epochs_all)
    epochs = epochs_all(i)
 final_avg_voted_y_count = 0;
 final_avg_y_count_vanilla = 0;
 ptr = 1;
 testdata = data(ptr:ptr+testrows-1,:);
    ptr = ptr + testrows;
    traindata = data(ptr:rows,:);
    [ste,cole] = size(testdata);
    ste;
    [str,colr] = size(traindata);
    str;
    x = traindata(:,1:9);
    y = traindata(:,10);
   final_avg_voted_y_count = voted_perceptron_cancer(x,y,epochs,testdata);
    final_avg_y_count_vanilla = vanilla_perceptron_cancer(x,y,epochs,testdata);
    %check_vanilla_perceprton(y_vanilla,x,y,testdata);

for i = 2:10
    i ;
    ptr+testrows-1;
    testdata = data(ptr:(ptr+testrows-1),:);
    ptr = ptr + testrows;
    traindata1 = data(1:(i-1)*68,:);
    traindata2 = data(ptr:rows,:);
    traindata = [traindata1;traindata2];
     [ste,cole] = size(testdata);
     ste;
    [str,colr] = size(traindata);
    str;
    x = traindata(:,1:9);
    y = traindata(:,10);
    final_avg_voted_y_count = final_avg_voted_y_count + voted_perceptron_cancer(x,y,epochs,testdata);
    final_avg_y_count_vanilla = final_avg_y_count_vanilla +  vanilla_perceptron_cancer(x,y,epochs,testdata);
    %check_vanilla_perceprton(y_vanilla,x,y,testdata);
  
end

final_avg_voted_y_count = final_avg_voted_y_count /10;
arr_final_avg_voted(counter) =  final_avg_voted_y_count;
final_avg_y_count_vanilla = final_avg_y_count_vanilla/10;
arr_final_avg_vanilla(counter) = final_avg_y_count_vanilla;
counter = counter+1;
end
arr_final_avg_voted
arr_final_avg_vanilla
scatter(epochs_all,arr_final_avg_voted,'r','filled')
hold on 
scatter(epochs_all,arr_final_avg_vanilla,'b','filled')
hold on 
plot(epochs_all,arr_final_avg_voted,'r')
hold on
plot(epochs_all,arr_final_avg_vanilla,'b')
hold on

xlabel('epochs');
ylabel('accuracy');

title('breast cancer data analysis');

legend('voted perceptron','vanilla perceptron');
%legend('vanilla perceptron');