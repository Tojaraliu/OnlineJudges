Type
  int=longint;
  
Var
  fa,d:array[0..50011]of int;
  n,m,ans,i,x,y,flag,p,q:int;
  
Function find(x:int):int;
var t:int;
begin
  if fa[x]=x then exit(x);
	t:=fa[x];
	fa[x]:=find(fa[x]);
	d[x]:=(d[t]+d[x])mod 3;
	exit(fa[x]);
end;

Begin
  readln(n,m);ans:=0;
  for i:=1 to n do fa[i]:=i;
  for i:=1 to m do begin
	  readln(flag,x,y);
	  if (x>n)or(y>n)or((x=y)and(flag=2)) then begin inc(ans);continue;end;
	  if (x=y)and(flag=1) then continue;
	  p:=find(x);q:=find(y);
	  if p<>q then begin
		  fa[p]:=q;
		  d[p]:=(flag-1+d[y]-d[x]+3)mod 3;
		end 
    else begin
		  if flag=1 then
        if d[x] mod 3=d[y] mod 3 then continue else inc(ans);
		  if flag=2 then
		    if (d[y]+1) mod 3=d[x] mod 3 then continue else inc(ans);
		end;
 	end;
  writeln(ans);
end.