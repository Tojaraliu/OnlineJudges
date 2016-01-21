{
ID:ToJaRa
LANG:PASCAL
PROG:namenum
}
const
	inp='namenum.in';
	outp='namenum.out';

var
  num:array['A'..'Z'] of string=('2','2','2','3','3','3','4','4','4','5','5','5','6','6','6','7','0','7','7','8','8','8','9','9','9','0');
  nm,st:array[0..5000] of string;
  n:longint;

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
  len,i:longint;
begin
  assign(input,'dict.txt');reset(input);
  n:=0;
  while not eof do begin
    inc(n);
    readln(st[n]);
    len:=length(st[n]);
    nm[n]:='';
    for i:=1 to len do
      nm[n]:=nm[n]+num[st[n][i]];
  end;
  close(input);
end;

procedure work;
var
  i,j:integer;
  s:string;f:boolean;
begin
  readln(s);f:=true;
  for i:=1 to n do
    if nm[i]=s then begin
      writeln(st[i]);
      f:=false;
    end;
  if f then writeln('NONE');
end;

begin
  init;
  openf;
  work;
  closef;
end.
