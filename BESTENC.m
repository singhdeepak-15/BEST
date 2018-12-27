%clear all;

img = imread('data sample.jpg');
sz = size(img);
gi = rgb2gray(img);
sekey = '243F6A88';
%for i = 1 : sz(1,3)
    for j = 1 : sz(1,1)
        k = 1;
        while(k <= sz(1,2))
            pt = gi(j,k:k+3);
            ct = Encrypt(pt,sekey);
            imgct(j,k:k+3) = ct; 
            k = k+4;
        end
    end
%end
imi = uint8(imgct);
imwrite(imi,'output.jpeg','jpeg');
fprintf('Encryption Completed');
%image(imgct);