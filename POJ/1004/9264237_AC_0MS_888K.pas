var
   a,t:real;
   i:longint;
begin
   a:=0;
   for i:=1 to 12 do begin
     readln(t);
     a:=a+t;
   end;
   writeln('$',(a/12):0:2);
end.     