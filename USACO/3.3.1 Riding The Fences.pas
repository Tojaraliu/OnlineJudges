{
ID:ToJaRa
LANG:PASCAL
PROG:fence
}

Const
  inf=1<<28;
  fn='fence';

var
  e:array[0..520,0..520] of longint;
  du:array[0..520] of longint;
  path:array[0..1210] of longint;
  maxp,x,y,n:longint;

Procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

Procedure init;
var
  i:longint;
begin
  fillchar(e,sizeof(e),0);
  fillchar(du,sizeof(du),0);
  readln(n);
  for i:=1 to n do begin
    read(x,y);
    inc(e[x,y]);inc(e[y,x]);
    inc(du[x]);inc(du[y]);
    if x>maxp then maxp:=x;
    if y>maxp then maxp:=y;
  end;
end;

Procedure search(s:longint);
var
  i:longint;
begin
  for i:=1 to maxp do
    if e[s,i]>0 then begin
      dec(e[s,i]);dec(e[i,s]);
      search(i);
  end;
  inc(y);
  path[y]:=s;
end;

Procedure main;
var
  i:longint;
  flag:boolean;
begin
  flag:=true;
  for i:=1 to maxp do
    if odd(du[i]) then begin
      x:=i;
      flag:=false;
      break;
  end;
  y:=0;
  if flag then search(1) else search(x);
end;

Procedure print;
var
  i:longint;
begin
  for i:=n+1 downto 1 do writeln(path[i]);
end;

begin
  opf;
  init;
  main;
  print;
  close(output);
end.