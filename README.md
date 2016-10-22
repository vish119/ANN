# ANN
This repository contains mat lab code for creating neural network and training data set.

I have used MATLAB’s importdata function to load X_test, X_train, Y_test and Y_train.

feedforwardnet function is used to create neural network with one hidden layer and 25 neurons. 

ind2vec function is used to convert Y_test from index to vector.Output of ind2vec will be in 0 and 1 form with one row having value 1 for each column. transpose function is used get the transpose of X_test and X_train. 

I  have trained neural network with help of train function.  train function takes name of the neural network, transpose of X_train (target input) and Y_test in  vector form(target output) as input variable. After training, pass transpose of X_test to trained network with the help of net function. net function returns predicted labels in vector form having the probability of each column belong every class labels. Now we have to find the class with highest probability for each column.  vec2ind function is used to get the prediction in index form. Output of the vec2ind function (output of the test data) is then compared with values in Y_test to calculate number of correct prediction using for loop. 
