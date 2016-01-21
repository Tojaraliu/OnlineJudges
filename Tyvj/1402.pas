Const
  fn='tortoise';
  
Type
  int=longint;

Var
	a:array[0..1000] of int;
	c:array[1..4] of int;
	f:array[-1..50,-1..50,-1..50,-1..50] of int;
	n,m:int;
	
Function max(a,b,c,d:int):int;
var
	t:int;
begin
	t:=a;
	if b>t then t:=b;
	if c>t then t:=c;
	if d>t then t:=d;
	exit(t);
end;
	
Procedure init;
var
	i,t:int;
begin
	readln(n,m);
	fillchar(a,sizeof(a),0);
	fillchar(c,sizeof(c),0);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do read(a[i]);
	for i:=1 to m do begin
		read(t);inc(c[t]);
	end;
end;

Procedure dp;
var
	i,j,k,l,t:int;
begin
	f[0,0,0,0]:=a[1];
	for i:=0 to c[1] do 
		for j:=0 to c[2] do 
			for k:=0 to c[3] do 
				for l:=0 to c[4] do begin
					t:=i+j<<1+k*3+l<<2+1;
					f[i,j,k,l]:=max(f[i-1,j,k,l],f[i,j-1,k,l],f[i,j,k-1,l],f[i,j,k,l-1])+a[t];
	end;
end;
	
begin
  //opf;
	init;
	dp;
	writeln(f[c[1],c[2],c[3],c[4]]);
  //close(output);
end.