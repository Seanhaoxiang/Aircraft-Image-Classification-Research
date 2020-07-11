pngFiles = dir('image_before\*.png'); 
numfiles = length(pngFiles)
mydata = cell(1, numfiles);

for k = 1:numfiles 
  mydata{k} = imread(pngFiles(k).name); 
  mydata{k} = imresize(mydata{k}, [224, 224]);
  a = size(mydata{k});
  mydata{k} = cat(3, mydata{k}, mydata{k}, mydata{k});
  b = size(mydata{k});
  %[X,map] = rgb2ind(mydata{k}, 256);
  imwrite(X,map, "image_after\" + pngFiles(k).name);
end

disp("size before: ")
disp(a)
disp("size after")
disp(b)