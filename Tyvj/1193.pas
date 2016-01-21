const
  inf=1<<29;

var
  len:longint;
  s:string;
  f:array[0..300,0..300] of longint;
  a:array[0..300] of longint;

function min(x,y:longint):longint;
begin
  if x<y then exit(x);exit(y);
end;

procedure init;
var
  i:longint;
begin
  readln(s);len:=length(s);
end;

procedure main;
var
  i,j,k,l:longint;
begin
  fillchar(f,sizeof(f),127);
  for i:=1 to len do f[i,i]:=1;
  for i:=1 to len-1 do begin
    if (s[i]='(')and(s[i+1]=')') then f[i,i+1]:=0
    else if (s[i]='[')and(s[i+1]=']') then f[i,i+1]:=0
    else f[i,i+1]:=2;
  end;
  for l:=3 to len do
    for i:=1 to len-l+1 do begin
      j:=i+l-1;
      for k:=i to j-1 do f[i,j]:=min(f[i,j],f[i,k]+f[k+1,j]);
      if (s[i]='(')and(s[j]=')') then f[i,j]:=min(f[i,j],f[i+1,j-1]);
      if (s[i]='[')and(s[j]=']') then f[i,j]:=min(f[i,j],f[i+1,j-1]);
      if (s[i]='(')or(s[i]='[') then f[i,j]:=min(f[i,j],f[i+1,j]+1);
      if (s[j]=')')or(s[j]=']') then f[i,j]:=min(f[i,j],f[i,j-1]+1);
    end;
end;

begin
  init;
  main;
  writeln(f[1,len]);
end.
