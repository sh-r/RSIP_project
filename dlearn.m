function Y=dlearn() 
%load data
digitDatasetPath = fullfile('C:\Users\nitya\Desktop\nitya\processed');

imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

%Display some of the images	
figure;
%perm = randperm(10000,20);
for i = 1:16
    subplot(4,5,i);
    imshow(imds.Files{(i)});
end

%Count labels
labelCount = countEachLabel(imds)

%size up an image
img = readimage(imds,1);
size(img)

%Declare num of training files
numTrainFiles = 17;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

fprintf("Validation size=%d training size=%d\n", length(imdsValidation.Files), length(imdsTrain.Files));

%Construct network
layers = [
    imageInputLayer([256 256 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

%Train network
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',64, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');
	
net = trainNetwork(imdsTrain,layers,options);

%Measure accuracy
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)

testDatasetPath = fullfile('C:\Users\nitya\Desktop\nitya\processed\notok');

imdsTest = imageDatastore(testDatasetPath, ...
    'IncludeSubfolders',true);

YTest = classify(net, imdsTest);
Y=YTest';
strY=string(Y);

for j=1:length(imdsTest.Files)
    fprintf('Filename %s, Label: %s\n', imdsTest.Files{j}, strY(j));
end
end