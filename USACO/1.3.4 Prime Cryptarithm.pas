{
ID:ToJaRa
LANG:PASCAL
PROG:crypt1
}
const
	inp='crypt1.in';
	outp='crypt1.out';

type
  arr=array[1..9]of boolean;

var
  n,ans:longint;
  a:arr;

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
  i,k:longint;
begin
  fillchar(a,sizeof(a),false);
  readln(n);
  for i:=1 to n do begin
    read(k);
    a[k]:=true;
  end;
end;

function cl(x1,x2,x3,x4,x5:longint):boolean;
var
  t1,t2,t3:longint;
begin
  t1:=(x1*100+x2*10+x3)*x5;
  t2:=(x1*100+x2*10+x3)*x4;
  t3:=t1+t2*10;
  if (t3>=10000)or(t2>=1000)or(t1>=1000) then exit(false);
  while t1<>0 do begin
    if not(a[t1 mod 10]) then exit(false);
    t1:=t1 div 10;
  end;
  while t2<>0 do begin
    if not(a[t2 mod 10]) then exit(false);
    t2:=t2 div 10;
  end;
  while t3<>0 do begin
    if not(a[t3 mod 10]) then exit(false);
    t3:=t3 div 10;
  end;
  exit(true);
end;

procedure work;
var
  i1,i2,i3,i4,i5:longint;
begin
  ans:=0;
  for i1:=1 to 9 do
    for i2:=1 to 9 do
      for i3:=1 to 9 do
        for i4:=1 to 9 do
          for i5:=1 to 9 do
            if (a[i1])and(a[i2])and(a[i3])and(a[i4])and(a[i5]) then
              if cl(i1,i2,i3,i4,i5) then inc(ans);
  writeln(ans);
end;

begin
  openf;
  init;
  work;
  closef;
end.
