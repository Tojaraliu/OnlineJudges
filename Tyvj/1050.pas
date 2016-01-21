var
	a,b:array[0..2001] of char;
	f:array[0..2001,0..2001] of longint;
	la,lb:longint;
	
function max(x,y:longint):longint;
begin
	if x>y then exit(x);
	exit(y);
end;
	
procedure init;
var
	st,s1,s2:ansistring;
	p,len,i:longint;
begin
	readln(st);
	fillchar(f,sizeof(f),0);
	p:=pos(' ',st);len:=length(st);
	s1:=copy(st,1,p-1);s2:=copy(st,p+1,len);
	la:=length(s1);lb:=length(s2);
	for i:=1 to la do a[i]:=s1[i];
	for i:=1 to lb do b[i]:=s2[i];
end;

procedure dp;
var
	i,j:longint;
begin
	for i:=1 to la do
		for j:=1 to lb do begin
			if a[i]=b[j]
				then f[i,j]:=f[i-1,j-1]+1
				else f[i,j]:=max(f[i-1,j],f[i,j-1]);
	end;
end;
	
begin
	init;
	dp;
	writeln(f[la,lb]);
end.