//贪心
//每个星期都要达到C，也就是说要超过C的尽量少，所以先从小到大排序，因为都是可以相互整除的，所以先取大的，尽量少用面值小的零钱，因为都能整除，所以留一些小的一定不会比留一些大的差。每次先取面值大的，凑出一个尽量接近C的数，然后用尽量小的零钱来补齐C。
//10/16/2012

Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  num,data:Array[0..100] of int;
  n,c:int;
  flag:boolean;
  ans:int64;
  
Procedure sort(l,r:int);
var
  i,j,t,mid:int;
begin
  i:=l;j:=r;mid:=data[(l+r)>>1];
  repeat
    while data[i]<mid do inc(i);
    while data[j]>mid do dec(j);
    if i<=j then begin
      t:=data[i];data[i]:=data[j];data[j]:=t;
      t:=num[i];num[i]:=num[j];num[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;
  
Procedure init;
var
  i:int;
begin
  readln(n,c);
  for i:=1 to n do readln(data[i],num[i]);
  sort(1,n);
end;

Procedure main;
var
  i,j,cur:int;
begin
  j:=0;
  ans:=0;
  for i:=n downto 1 do begin
    if data[i]>=c then begin
      inc(ans,int64(num[i]));
      inc(j);
    end
    else break;
  end;
  dec(n,j);
  while true do begin
    cur:=c;
    for i:=n downto 1 do begin
      while (cur-data[i]>=0)and(num[i]>0) do begin
        dec(cur,data[i]);
        dec(num[i]);
      end;
    end;
    for i:=1 to n do begin
      while (cur>0)and(num[i]>0) do begin
        dec(cur,data[i]);
        dec(num[i]);
      end;
    end;
    if cur<=0 then inc(ans)
    else break;
  end;
  writeln(ans);
end;

Begin
  init;
  main;
end.