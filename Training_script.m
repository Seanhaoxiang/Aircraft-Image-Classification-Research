
  

imds = imageDatastore('resnet_images/training_images'); 


for i=1:16000

 images_training(:,:,:,i)= readimage(imds,i);
 
end


imds = imageDatastore('resnet_images/validation_images'); 


for i=1:4000

 images_validation(:,:,:,i)= readimage(imds,i);
 
end



%Training Options

options = trainingOptions('sgdm', ...
'InitialLearnRate',0.00001, ...
'MaxEpochs',15, ...
'ValidationData',{images_validation,attitude_validation}, ...
'Plots','training-progress');

%Training

[net,info] = trainNetwork(images_training,attitude_training,lgraph_1,options)

%Estimation

YPred = predict(net,images_validation);
