function [Errors, Fscores, Precisions, Recalls] = chooseSVMparameters()
% You will have X, y in your environment
load('ex6data3.mat');

%[Xtrain, ytrain, Xval, yval, Xtest, ytest] = partitionData(X, y);
[Cvec, sigmavec] = trySVMParameters();

Errors = zeros(length(sigmavec), length(Cvec));
Fscores = Precisions = Recalls = Errors;

for i=1:length(sigmavec)
    for j=1:length(Cvec)
        _i = (i-1)*length(Cvec)+j
        C = Cvec(j);
        sigma = sigmavec(i);
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        predval = svmPredict(model, Xval);
        Errors(i, j) = mean(predval != yval);
        [Fscores(i, j), Precisions(i, j), Recalls(i, j)] = fprscore(predval, yval);
    end
end

end
