function [ret] = Decrypt(pt,sekey)
bi = dec2bin(pt);
tt = bi(1,:);
for j = 2 : 4
    tt = horzcat(tt,bi(j,:));
end
%le = uint32(tt);
le = bin2dec(tt);
%le = cast(le,int);
%le = dec2bin(le);
y = fi(le,0,32,0);
%le = bitrol(y,10);
sekey = hex2dec(sekey);
sek = fi(sekey,0,32,0);
%re = bitxor(le,sek);
ra = ceil(rand()*65535);
ia = dec2bin(ra,16);
rb = ceil (rand()* 255);
ib = dec2bin(rb,8);
prkey = horzcat(ia,ib);
prke = bin2dec(prkey);
prk = fi(prke,0,24,0);
res = y - prk;
res = fi(res,0,32,0);
for k = 1:10
    ra = ceil(rand()*65535);
    ia = dec2bin(ra,16);
    rb = ceil(rand()* 255);
    ib = dec2bin(rb,8);
    prkey = horzcat(ia,ib);
    prke = bin2dec(prkey);
    prk = fi(prke,0,24,0);
    res = res - prk;
    res = fi(res,0,32,0);
end  
res = bitxor(res,sek);
re = bitror(res,10);
pt = re.bin;
diff = 1;
for i = 1:4
    ret(1,i) = bin2dec(pt(diff:diff+7));
    diff = diff + 8;
end



