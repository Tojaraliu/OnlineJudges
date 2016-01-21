{
ID:ToJaRa
LANG:PASCAL
PROG:camelot
}

const
  fn='camelot';
  dx:array[1..8] of shortint=(-1,1,2,2,1,-1,-2,-2);
  dy:array[1..8] of shortint=(2,2,1,-1,-2,-2,-1,1);

Type
  int=longint;

var
  c:char;
  ans,kx,ky,m,n,s,i,j,k,x,y:integer;
  ax,ay:array[1..1000]of integer;
  d:array[1..30,1..30,1..30,1..30]of byte;
  f:array[1..30,1..30]of longint;

Procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x) else exit(y);
end;

procedure flood(x,y:integer);
var
  head,tail,i:integer;
  fx,fy:array[1..1000]of integer;
  vis:array[1..30,1..30]of boolean;
begin
  head:=0; tail:=1; fx[1]:=x; fy[1]:=y;
  fillchar(d[x,y],sizeof(d[x,y]),127);
  fillchar(vis,sizeof(vis),0);
  d[x,y,x,y]:=0;
  vis[x,y]:=true;
  repeat
    inc(head);
    for i:=1 to 8 do begin
      inc(tail);
      fx[tail]:=fx[head]+dx[i];
      fy[tail]:=fy[head]+dy[i];
      if (fx[tail]<=m)and(fx[tail]>0)and(fy[tail]<=n)and(fy[tail]>0) then
        if not vis[fx[tail],fy[tail]] then begin
          vis[fx[tail],fy[tail]]:=true;
          d[x,y,fx[tail],fy[tail]]:=d[x,y,fx[head],fy[head]]+1;
        end else dec(tail)
      else dec(tail);
    end;
  until head>=tail;
end;

Function dis(x,y:int):int;
begin
  if abs(x-kx)>abs(y-ky) then exit(abs(x-kx));
  exit(abs(y-ky));
end;

procedure init;
begin
  readln(m,n);readln(c,kx);
  ky:=ord(c)-64; s:=0;
  while not eof do begin
    while not eoln do begin
      read(c);
      while c=' ' do read(c);
      inc(s); read(ax[s]);
      ay[s]:=ord(c)-64;
    end;
    readln;
  end;
  for i:=1 to m do
    for j:=1 to n do begin
      flood(i,j); f[i,j]:=0;
      for k:=1 to s do inc(f[i,j],d[i,j,ax[k],ay[k]]);
    end;
end;

Procedure main;
var
  i,j:int;
begin
  ans:=maxint;
  for i:=1 to m do
    for j:=1 to n do
      if f[i,j]<ans then begin
        ans:=min(ans,f[i,j]+dis(i,j));
        for x:=1 to m do
          for y:=1 to n do
            if dis(x,y)<=5 then for k:=1 to s do
              ans:=min(ans,f[i,j]-d[i,j,ax[k],ay[k]]+d[x,y,ax[k],ay[k]]+dis(x,y)+d[i,j,x,y]);
      end;
  writeln(ans);
end;

begin
  opf;
  init;
  main;
  close(output);
end.
