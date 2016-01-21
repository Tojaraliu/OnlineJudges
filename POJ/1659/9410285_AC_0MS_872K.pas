type
  int=longint;
  
var
  a:array[0..10] of int;
  g:array[0..10,0..10] of boolean;
  d:array[0..10] of int;
  n,t,count:int;
  
Procedure sort;
var
  t,i,j:int;
begin
  for i:=1 to n do 
    for j:=1 to i do 
      if a[i]>a[j] then begin
        t:=a[i];a[i]:=a[j];a[j]:=t;
        t:=d[i];d[i]:=d[j];d[j]:=t;
      end;
end;
  
procedure init;
var
  i:int;
begin
  readln(n);
  for i:=1 to n do begin 
    read(a[i]);d[i]:=i;
  end;
  fillchar(g,sizeof(g),0);
end;

Function check:int;
var
  i:int;
begin
  for i:=1 to n do begin
    if a[i]>0 then exit(1);
    if a[i]<0 then exit(2);
  end;
  exit(3);
end;

Procedure main;
var
  i,j:int;
begin
  while 0=0 do begin
    case check of
      1:begin 
          sort;i:=2;
          while a[1]>0 do begin
            g[d[1],d[i]]:=true;g[d[i],d[1]]:=true;
            dec(a[i]);dec(a[1]);inc(i);
          end;
        end;
      2:begin
          writeln('NO');writeln;exit;
        end;
      3:begin
          writeln('YES');
          for i:=1 to n do begin
            for j:=1 to n-1 do 
              if g[i,j] then write(1,' ') else write(0,' ');
            if g[i,n] then writeln(1) else writeln(0);
          end;
          writeln;exit
        end;
    end;
  end;
end;
  
Begin
  readln(count);
  for t:=1 to count do begin
    init;
    main;
  end;
end.