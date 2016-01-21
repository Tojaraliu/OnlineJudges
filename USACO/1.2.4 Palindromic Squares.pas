{
ID:ToJaRa
LANG:PASCAL
PROG:palsquare
}
const
	inp='palsquare.in';
	outp='palsquare.out';
  base='0123456789ABCDEFGHIK';

var
  n:longint;
  f:array[0..301] of longint;

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

procedure zh(x:longint);
var
  i:longint;
begin
  i:=0;
  while x<>0 do begin
    inc(i);
    f[i]:=x mod n;
    x:=x div n;
  end;
  f[0]:=i;
end;

function back:boolean;
var
  i,j:longint;
begin
  i:=1;j:=f[0];
  while i<=(f[0] div 2) do begin
    if f[i]<>f[j] then exit(false);
    inc(i);dec(j);
  end;
  exit(true);
end;

procedure init;
begin
  readln(n);
end;

procedure work;
var
  i,j:longint;
begin
  for i:=1 to 300 do begin
    zh(i*i);
    if back then begin
      zh(i);
      for j:=f[0] downto 1 do write(base[f[j]+1]);write(' ');
      zh(i*i);
      for j:=f[0] downto 1 do write(base[f[j]+1]);writeln;
    end;
  end;
end;

begin
  openf;
  init;
  work;
  closef;
end.
