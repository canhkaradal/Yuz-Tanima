clc,clear all,close all
faceDetector = vision.CascadeObjectDetector();
resim=imread('pp2.jpg');
%resim=imresize(resim,[512,512]);
bbox = step(faceDetector, resim);
cikis = insertObjectAnnotation(resim,'rectangle',bbox,'Yuz');
figure, imshow(cikis), title('Yüz tespiti');
[m n]=size(bbox);
for i=1:m
xx=resim(bbox(i,2):bbox(i,2)+bbox(i,4),bbox(i,1):bbox(i,1)+bbox(i,3),:);
aa=imgaussfilt(xx,10);
resim(bbox(i,2):bbox(i,2)+bbox(i,4),bbox(i,1):bbox(i,1)+bbox(i,3),:)=aa;
end
figure,imshow(resim)
