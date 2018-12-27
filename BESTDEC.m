clear all;
img = imread('out.jpeg');
sz = size(img);
gi = rgb2gray(img);
sekey = '243F6A88';
%for i = 1 : sz(1,3)
    for j = 1 : sz(1,1)
        k = 1;
        while(k <= sz(1,2))
            ct = gi(j,k:k+3);
            pt = Decrypt(ct,sekey);
            imgct(j,k:k+3) = pt; 
            k = k+4;
        end
    end
%end
imi = uint8(imgct);
fprintf('Decryption Completed');
%image(imgct);