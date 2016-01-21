var n,k,j,i,ans:longint;
a,q,s:array[1..10010]of string;
dex:array['a'..'{']of longint;

procedure init;{26¸ö×ÖÄ¸µÄË÷Òı}
var i,j:longint;
begin
j:=1;
for i:=1 to n do
if (a[i][1]=chr(ord('a')-1+j))then
begin
 dex[a[i][1]]:=i;
 inc(j);
end;
dex['{']:=n+1;
end;

procedure qs(l,r:longint);{×ÖµäÅÅĞò}
var i,j:longint;x,t:string;
begin
i:=l;j:=r;x:=a[trunc((r-l)*0.618)+l];
repeat
 while a[i]<x do inc(i);
 while a[j]>x do dec(j);
 if i<=j then 
 begin
  t:=a[i];
  a[i]:=a[j];
  a[j]:=t;
  inc(i);
  dec(j);
 end;
until i>j;
if l<j then qs(l,j);
if i<r then qs(i,r);
end;

begin
readln(n);
for i:=1 to n do readln(a[i]);
qs(1,n);
init;
readln(k);
for i:=1 to k do readln(q[i]);
for i:=1 to k do
begin
 ans:=1;
 s[ans]:='';
 for j:=dex[q[i][1]] to dex[chr(ord(q[i][1])+1)]-1 do
 if (pos(q[i],a[j])=1)and(ans<=8)and(a[j]<>s[ans-1]) then 
 begin
  s[ans]:=a[j];
  inc(ans);
 end;
 if ans=1 then writeln(q[i]) else begin
 for j:=1 to ans-2 do write(s[j],' '); writeln(s[ans-1]);end;
end;
end.