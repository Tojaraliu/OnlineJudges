{
ID:ToJaRa
LANG:PASCAL
PROG:dualpal
}
const
	inp='dualpal.in';
	outp='dualpal.out';

var
  n,s:longint;
  f:array[0..20000] of longint;

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

procedure trans(x,y:longint);
var
  i:longint;
begin
  i:=0;
  while x<>0 do begin
    inc(i);
    f[i]:=x mod y;
    x:=x div y;
  end;
  f[0]:=i;
end;

function back:boolean;
var
  i,j:longint;
begin
  i:=1;j:=f[0];
  while i<=(f[0]>>1) do begin
    if f[i]<>f[j] then exit(false);
    inc(i);dec(j);
  end;
  exit(true);
end;

procedure init;
begin
  readln(n,s);
end;

procedure work;
var
  i,j,k,num:longint;
  flag:boolean;
begin
  num:=s+1;
  while n>0 do begin
    j:=0;
    for i:=2 to 10 do begin
      trans(num,i);flag:=false;
      if back then inc(j);
      if j=2 then begin flag:=true;break;end;
    end;
    if flag then begin writeln(num);dec(n);end;
    inc(num);
  end;
end;

begin
  openf;
  init;
  work;
  closef;
end.
