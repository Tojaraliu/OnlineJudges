{
ID:ToJaRa
LANG:PASCAL
PROG:ratios
}

Const
  fn='ratios';

var
  x,y,z:longint;
  x1,y1,z1,x2,y2,z2,x3,y3,z3,a,b,c,sum,min,nx,ny,nz:longint;

procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

function check(a,b,c:integer):boolean;
begin
  if (a=0)and(b=0)and(c=0) then exit(false);
  if x<>0 then
    begin
      if a*x1+b*x2+c*x3=0 then exit(false);
      if (a*x1+b*x2+c*x3)mod x<>0 then exit(false);
      nx:=(a*x1+b*x2+c*x3)div x;
    end
  else
    begin
      if a*x1+b*x2+c*x3<>0 then exit(false);
      nx:=0;
    end;
  if y<>0 then
    begin
      if a*y1+b*y2+c*y3=0 then exit(false);
      if (a*y1+b*y2+c*y3)mod y<>0 then exit(false);
      ny:=(a*y1+b*y2+c*y3)div y;
    end
  else
    begin
      if a*y1+b*y2+c*y3<>0 then exit(false);
      ny:=0;
    end;
  if z<>0 then
    begin
      if a*z1+b*z2+c*z3=0 then exit(false);
      if (a*z1+b*z2+c*z3)mod z<>0 then exit(false);
      nz:=(a*z1+b*z2+c*z3)div z;
    end
  else
    begin
      if a*z1+b*z2+c*z3<>0 then exit(false);
      nz:=0;
    end;
  if (nx<>0)and(ny<>0)and(nx<>ny) then exit(false);
  if (nx<>0)and(nz<>0)and(nx<>nz) then exit(false);
  if (ny<>0)and(nz<>0)and(ny<>nz) then exit(false);
  exit(true);
end;

procedure main;
var
  i,j,k:longint;
begin
  min:=1<<28;
  for i:=0 to 100 do
    for j:=0 to 100 do
      for k:=0 to 100 do
        if check(i,j,k) then
          if i+j+k<min then begin
            a:=i;b:=j;c:=k;
            sum:=(i*x1+j*x2+k*x3) div x;
            min:=i+j+k;
  end;
end;

begin
  opf;
  read(x,y,z);read(x1,y1,z1);read(x2,y2,z2);read(x3,y3,z3);
  main;
  if (a<>0)or(b<>0)or(c<>0) then
    writeln(a,' ',b,' ',c,' ',sum)
  else
    writeln('NONE');
  close(input);close(output);
end.
