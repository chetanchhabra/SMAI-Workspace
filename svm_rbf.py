import csv
import numpy as np
import matplotlib.pyplot as plt,scipy, pylab
from sklearn import svm
from sklearn.model_selection import cross_val_score,train_test_split

reader = csv.reader(open("Data_SVM.csv", "rb"), delimiter=",")
result = np.array(list(reader)).astype("float")

x1 = [] 
y1 = []
x2 = []
y2 = []
y = [] 

for i in range(len(result)):

	if result[i][2] == -1:
		x1.append(result[i][0])
		y1.append(result[i][1])
		y.append(result[i][2])
	else:
		x2.append(result[i][0])
		y2.append(result[i][1])
		y.append(result[i][2])

X = [[result[i][0],result[i][1]] for i in range(len(result))]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=0)

c_acc = 0
gamma_acc = 0
Accuracy = 0
d = 0.1
c = 1 
while c <= 1000:
	while d < 10.0:
		clf = svm.SVC(kernel='rbf', C=c , gamma = d)
		clf.fit(X_train,y_train)
		score=0
		for k in xrange(30):
			score += cross_val_score(clf, X, y, cv=10).mean()
		if Accuracy < (score/30.0)*100:
			Accuracy = (score/30.0)*100
			c_acc = c
			gamma_acc = d
			print "Accuracy : " , Accuracy
			print "C: " , c_acc
			print "Gamma:",gamma_acc

		d = d + 0.3
	c = c * 10

print "Best Combination"
print "Accuracy : " , Accuracy
print "C: " , c_acc
print "Gamma:",gamma_acc

clf = svm.SVC(kernel='rbf', C=c_acc , gamma =gamma_acc).fit(X_train,y_train)

h = .02
x_min, x_max = result[:, 0].min() - 1, result[:, 0].max() + 1
y_min, y_max = result[:, 1].min() - 1, result[:, 1].max() + 1

xx, yy = np.meshgrid(np.arange(x_min, x_max, h),np.arange(y_min, y_max, h))

plt.subplot(2, 2, 2)
plt.subplots_adjust(wspace=0.4, hspace=0.4)

Z = clf.predict(np.c_[xx.ravel(), yy.ravel()])

Z = Z.reshape(xx.shape)
plt.contourf(xx, yy, Z, cmap=plt.cm.coolwarm, alpha=0.8)

plt.scatter(x1, y1, s=20, c='r')
plt.scatter(x2, y2, s=20, c='b')

plt.xlabel('x axis')
plt.ylabel('y axis')
plt.title('Kernel : RBF')

plt.show()
