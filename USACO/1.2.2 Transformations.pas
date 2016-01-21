{
ID:ToJaRa
LANG:PASCAL
PROG:transform
}
const
	inp='transform.in';
	outp='transform.out';

var
  a,b:array[0..11,0..11] of boolean;
  ans:array[0..10] of longint;
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
  i,j:longint;
  ch:char;
begin
  fillchar(a,sizeof(a),false);fillchar(b,sizeof(b),false);
  readln(n);
  for i:=1 to n do begin
    for j:=1 to n do begin
      read(ch);
      if (ch='@') then a[i,j]:=true;
    end;
    readln;
  end;
  for i:=1 to n do begin
    for j:=1 to n do begin
      read(ch);
      if (ch='@') then b[i,j]:=true;
    end;
    readln;
  end;
end;

procedure work;
  var i,j:integer;
begin
  fillchar(ans,sizeof(ans),0);
  for i:=1 to n do
    for j:=1 to n do begin
      if a[i,j]=b[j,n-i+1] then inc(ans[1]);
      if a[i,j]=b[n-i+1,n-j+1] then inc(ans[2]);
      if a[i,j]=b[n-j+1,i] then inc(ans[3]);
      if a[i,j]=b[i,n-j+1] then inc(ans[4]);
      if a[i,j]=b[i,j] then inc(ans[6]);
      if a[i,n-j+1]=b[j,n-i+1] then inc(ans[5]);
      if a[i,n-j+1]=b[n-i+1,n-j+1] then inc(ans[7]);
      if a[i,n-j+1]=b[n-j+1,i] then inc(ans[8]);
    end;
  for i:=1 to 8 do
    if ans[i]=n*n then begin
      if i<7 then writeln(i) else writeln(5);
      exit;
    end;
  writeln(7);
end;

begin
  openf;
  init;
  work;
  closef;
end.
