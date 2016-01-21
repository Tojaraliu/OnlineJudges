{
ID:ToJaRa
PROG:castle
LANG:PASCAL
}

const
  inp='castle.in';
  outp='castle.out';

var
  map:array[0..50,0..50,1..4] of boolean;
  s:array[0..3000] of longint;
  f:array[0..50,0..50] of longint;
  max,n,m,num,tm:longint;

procedure openf;
begin
  assign(input,inp);reset(input);
  assign(output,outp);rewrite(output);
end;

procedure closef;
begin
  close(input);
  close(output);
end;

procedure init;
var
  i,j,t:longint;
begin
  readln(m,n);
  fillchar(map,sizeof(map),false);
  for i:=1 to n do
    for j:=1 to m do begin
      read(t);
      if (t and 1)=1 then map[i,j,1]:=true;t:=t>>1;
      if (t and 1)=1 then map[i,j,2]:=true;t:=t>>1;
      if (t and 1)=1 then map[i,j,3]:=true;t:=t>>1;
      if (t and 1)=1 then map[i,j,4]:=true;
  end;
  for i:=1 to m do begin
    map[1,i,2]:=true;map[n,i,4]:=true;
  end;
  for i:=1 to n do begin
    map[i,1,1]:=true;map[i,m,3]:=true;
  end;
end;

procedure bfs(i,j,nm:longint);
begin
  inc(tm);f[i,j]:=nm;
  if ((not(map[i,j,1]))and(f[i,j-1]=0)) then bfs(i,j-1,nm);
  if ((not(map[i,j,2]))and(f[i-1,j]=0)) then bfs(i-1,j,nm);
  if ((not(map[i,j,3]))and(f[i,j+1]=0)) then bfs(i,j+1,nm);
  if ((not(map[i,j,4]))and(f[i+1,j]=0)) then bfs(i+1,j,nm);
end;

procedure work;
var
  i,j,h,l:longint;ch:char;
begin
  fillchar(f,sizeof(f),0);num:=0;
  for i:=1 to n do
    for j:=1 to m do begin
      if f[i,j]=0 then begin
        tm:=0;inc(num);bfs(i,j,num);
        s[num]:=tm;if tm>max then max:=tm;
      end;
  end;
  writeln(num);
  writeln(max);max:=0;
  for i:=1 to m do
    for j:=n downto 1 do begin
      if (map[j,i,2]) and (j-1>0) and (f[j,i]<>f[j-1,i]) and (s[f[j,i]]+s[f[j-1,i]]>max) then begin
        max:=s[f[j,i]]+s[f[j-1,i]];
        h:=j;l:=i;ch:='N';
      end;
      if (map[j,i,3]) and (i+1<=m) and (f[j,i]<>f[j,i+1]) and (s[f[j,i]]+s[f[j,i+1]]>max) then begin
        max:=s[f[j,i]]+s[f[j,i+1]];
        h:=j;l:=i;ch:='E';
      end;
    end;
  writeln(max);
  writeln(h,' ',l,' ',ch);
end;

begin
  openf;
  init;
  work;
  closef;
end.
