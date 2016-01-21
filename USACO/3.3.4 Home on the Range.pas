{
ID:ToJaRa
LANG:PASCAL
PROG:range
}

const
  fn='range';

Type
  int=longint;
  bool=boolean;

var
  a:array[0..251,0..251] of bool;
  n:longint;
  f:array[0..251,0..251] of int;
  ans:array[0..300] of int;

Procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x) else exit(y);
end;

procedure init;
var
  i,j:int;
  ch:char;
begin
  readln(n);
  fillchar(a,sizeof(a),false);
  for i:=1 to n do begin
    for j:=1 to n do begin
      read(ch);
      if ch='1' then a[i,j]:=true;
    end;
    readln;
  end;
  fillchar(ans,sizeof(ans),0);
end;

Procedure main;
var
  i,j:int;
begin
  for i:=1 to n do
    for j:=1 to n do
      if a[i,j] then begin
        f[i,j]:=min(f[i-1,j-1],min(f[i-1,j],f[i,j-1]))+1;
        inc(ans[f[i,j]]);
  end;
  for i:=1 to n-1 do
    if ans[i]<>0 then
      for j:=i+1 to n do inc(ans[i],ans[j]);
  for i:=2 to n do begin
    if ans[i]=0 then break;
    writeln(i,' ',ans[i]);
  end;
end;

begin
  opf;
  init;
  main;
  close(output);
end.