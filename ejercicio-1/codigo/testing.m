% Get testing images
load cnn_result
pathToImages = 'dataset-cifar-100\CIFAR-100\TEST\';
data_store = imageDatastore(pathToImages, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
%[testImgs,trainImgs] = splitEachLabel(data_store,1.0);
testImgs = data_store;
actualLabels = testImgs.Labels;
predLabels = classify(newnet, testImgs);
numCorrect = nnz(actualLabels == predLabels)
fracCorrect = numCorrect/numel(predLabels)
[confm,resLabels] = confusionmat(actualLabels,predLabels);
heatmap(resLabels, resLabels, confm);





