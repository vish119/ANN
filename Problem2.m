X_train_file='F:\matlab\Assignment3Dataset\VidTIMIT\X_train.mat';
X_test_file='F:\matlab\Assignment3Dataset\VidTIMIT\X_test.mat';
Y_train_file='F:\matlab\Assignment3Dataset\VidTIMIT\Y_train.mat';
Y_test_file='F:\matlab\Assignment3Dataset\VidTIMIT\Y_test.mat';

X_train=importdata(X_train_file);
X_trainT = transpose(X_train);
X_test=importdata(X_test_file);
X_testT = transpose(X_test);
Y_train=importdata(Y_train_file);
Y_test=importdata(Y_test_file);
Y_train_vertex = full(ind2vec(Y_train,25));
KNN_model=fitcknn(X_train,Y_train,'NumNeighbors',7);
y_test_KNN=predict(KNN_model,X_test);

net = feedforwardnet(25);
net = train(net,X_trainT,Y_train_vertex);
y_test_ANN = net(X_testT);
y_test_ANN=vec2ind(y_test_ANN);

Correct_Predction_ANN=0;
Correct_Predction_KNN=0;
for i=1:length(Y_test)
    if Y_test(i) == y_test_ANN(i)
        Correct_Predction_ANN= Correct_Predction_ANN+1;
    end
    if Y_test(i) == y_test_KNN(i)
        Correct_Predction_KNN= Correct_Predction_KNN+1;
    end
end
ANN_accuracy=(Correct_Predction_ANN/length(Y_test))*100;
KNN_accuracy=(Correct_Predction_KNN/length(Y_test))*100;

Ouput = sprintf('Percentage of accuracy on test data uisng ANN is %f',ANN_accuracy);
disp(Ouput);
Ouput = sprintf('Percentage of accuracy on test data using KNN is %f',KNN_accuracy);
disp(Ouput);
