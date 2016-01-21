program p1029;
var
         a,b,tmp:string;
         lena,lenb:longint;
         i,min,max:longint;

begin
         readln(a);
         readln(b);
         max:=0;
         lena:=length(a);lenb:=length(b);
         for i:=1 to lena do begin
                  tmp:=copy(a,1,i);
                  if tmp=copy(b,lenb-i+1,lenb)
                           then if i>max then max:=i;
         end;
         for i:=1 to lenb do begin
                  tmp:=copy(b,1,i);
                  if tmp=copy(a,lena-i+1,lena)
                           then if i>max then max:=i;
         end;
         writeln(max);
end.