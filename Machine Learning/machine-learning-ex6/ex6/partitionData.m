function[Xtrain, Ytrain, Xval, Yval, Xtest, Ytest] = partitionData(X, Y)

trainPart = 0.7;
validationPart = 0.2;
testPart = 1 - trainPart - validationPart;

m = size(X, 1);
trainThreshold = floor(m*trainPart);
validationThreshold = trainThreshold + 1 + floor(m*validationPart);

Xrand = X(randperm(m), :);
Yrand = Y(randperm(m), :);

Xtrain = Xrand(1:trainThreshold, :);
Ytrain = Yrand(1:trainThreshold, :);

Xval = Xrand(trainThreshold+1:validationThreshold, :);
Yval = Yrand(trainThreshold+1:validationThreshold, :);

Xtest = Xrand(validationThreshold+1:end, :);
Ytest = Yrand(validationThreshold+1:end, :);

end
