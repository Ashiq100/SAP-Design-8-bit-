clc;
clear all;
close all;

A=xlsread('D:\ALL TARM PDF\L4T1\EEE 315 Microprocessor and Interfacing\Final\Microprogramming.xlsx','AL4:AM93')
fid1=fopen('C_ROM1.bin','w');
for i=1:length(A)
   value=A(i,1)*16+A(i,2); 
   fwrite(fid1,value);
end
fclose(fid1);


B=xlsread('D:\ALL TARM PDF\L4T1\EEE 315 Microprocessor and Interfacing\Final\Microprogramming.xlsx','AN4:AO93')
fid2=fopen('C_ROM2.bin','w');
for i=1:length(B)
   value=B(i,1)*16+B(i,2); 
   fwrite(fid2,value);  
end
fclose(fid2);

C=xlsread('D:\ALL TARM PDF\L4T1\EEE 315 Microprocessor and Interfacing\Final\Microprogramming.xlsx','AP4:AQ93')
fid3=fopen('C_ROM3.bin','w');
for i=1:length(C)
   value=C(i,1)*16+C(i,2); 
   fwrite(fid3,value);  
end
fclose(fid3);


D=xlsread('D:\ALL TARM PDF\L4T1\EEE 315 Microprocessor and Interfacing\Final\Microprogramming.xlsx','AR4:AS93')
fid4=fopen('C_ROM4.bin','w');
for i=1:length(D)
   value=D(i,1)*16+D(i,2); 
   fwrite(fid4,value);  
end
fclose(fid4);
