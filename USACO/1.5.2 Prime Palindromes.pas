{
ID:ToJaRa
PROG:pprime
LANG:PASCAL
}

const
	inp='pprime.in';
	outp='pprime.out';
  q:array[1..9]of longint=(10,0,100,0,1000,0,10000,0,100000);

var
  l,r:longint;

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

function pd(x:longint):boolean;
var
  i:longint;
begin
  if (x and 1)<>1 then exit(false);
  for i:=2 to trunc(sqrt(x)) do
    if (x mod i)=0 then exit(false);
  exit(true);
end;

procedure init;
begin
  readln(l,r);
end;

procedure work;
var
  n,i,j,k:longint;
  s:string;
begin
  n:=1;
  for i:=1 to 9 do
    if i mod 2=1 then
      while n<q[i] do begin
        str(n,s);
        j:=Length(s)-1;
        while j>=1 do begin
          s:=s+s[j];
          dec(j);
        end;
        val(s,k);
        if (l<=k)and(r>=k)and pd(k) then writeln(k);
        inc(n);
    end
    else if (i=2)and(l<=11)and(r>=11) then writeln('11');
end;

begin
  openf;
  init;
  work;
  closef;
end.
