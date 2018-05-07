% Get training images
pathToImages = 'dataset-cifar-100\CIFAR-100\TRAIN\';
data_store = imageDatastore(pathToImages, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
%[trainImgs,testImgs] = splitEachLabel(data_store,1.0);
trainImgs = data_store;
numClasses = numel(categories(data_store.Labels));

% Create a network by modifying AlexNet
net = alexnet;
layers = net.Layers;
layers(end-2) = fullyConnectedLayer(numClasses);
layers(end) = classificationLayer;

% Set training algorithm options
opts = trainingOptions('sgdm', 'InitialLearnRate', 0.001, 'Plots','training-progress','ExecutionEnvironment','parallel');

%Perform training
[newnet,info] = trainNetwork(trainImgs, layers, opts);

save('newnet_result','newnet');
save('newnet_result_info','info');
