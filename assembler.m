clc;    clear all;  close all;
format compact;
single_instruction={'NOT B','RET','HLT','PUSH A','OUT B','IN C','SUB B,C','MUL C,B','RCL A'};
single_opcode=[1 3 5 6 7 9 11 13 14];
double_instruction={'MOV B','MOV A','MOV C','MOV D'};
double_opcode=[4 16 17 18];
triple_instruction={'JZ','CALL','TEST A,','POP','XCHG','XOR'};
triple_opcode=[0 2 8 10 12 15];

fp=fopen('Code7.txt.','r');
fid=fopen('Code.bin','w');

dec=0;
tline = fgetl(fp);
k=0;
while ischar(tline)
 
    single=0;    
    double=0;    
    triple=0;          
    value=0; 
    for i=1:length(single_instruction)
        if  strcmpi(single_instruction(i),tline)
            dec=single_opcode(i)
            fwrite(fid,dec);       
            single=1;
            k=k+1;
            break;
        end       
    end
     
    if(single==0)
       for i=1:length(double_instruction)
           
           if    strncmpi(double_instruction(i),tline,length(char(double_instruction(i))))
                 dec=double_opcode(i)    
                 fwrite(fid,dec); 
                 k=k+1;
                 temp=length(char(double_instruction(i)));
                 byte=tline(temp+2:temp+3);      
                 dec=hex2dec(byte)
                 fwrite(fid,dec);        
                 double=1;
                 k=k+1;
                 break;
           end       
       end
    end

   if(single==0 && double==0)
        
        for i=1:length(triple_instruction)
                if  (strncmpi(triple_instruction(i),tline,length(char(triple_instruction(i)))))
                    dec=triple_opcode(i)     
                    fwrite(fid,dec);
                    k=k+1;
                    temp=length(char(triple_instruction(i)));  
                    gap=[2 4];       
                    byte=tline(temp+gap(2):temp+gap(2)+1);
                    dec=hex2dec(byte)
                    fwrite(fid,dec);    
                    k=k+1;
                    byte=tline(temp+gap(1):temp+gap(1)+1);
                    dec=hex2dec(byte)
                    fwrite(fid,dec);    
                    triple=1;  
                    k=k+1;
                    break;
                end
               
            end
   end
    
    if (single==0 && double==0 && triple==0 )
            if (length(tline)==4)
                byte=tline(1:4);
                byte=hex2dec(byte);
                    while k<(byte)
                        dec=0
                        fwrite(fid,dec);
                        k=k+1;
                    end
            elseif (length(tline)>=4)
                        byte=tline(1:4);
                        byte=hex2dec(byte);
                        
                            while k<(byte)
                                dec=0
                                fwrite(fid,dec);
                                k=k+1;
                            end
                        byte=tline(6:7);
                        byte=hex2dec(byte)
                        fwrite(fid,byte);
                        k=k+1;
            end
    
          value=1;
          end
        if(single==0 && double==0 && triple==0 && value==0)
            disp('Error in Code.....Aborting.......');
            break;
        end
    tline = fgetl(fp);
   
end

fclose(fp);
fclose(fid);