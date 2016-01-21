Var
  m:int;
  total,i,j,n:int;

function num(k:integer):integer;
var
  a:array[0..9] of integer;
  s,t,ans:integer;
begin
  num:=0;
  a[0]:=6;a[1]:=2;a[2]:=5;
  a[3]:=5;a[4]:=4;a[5]:=5;
  a[6]:=6;a[7]:=3;a[8]:=7;
  a[9]:=6;
  if k=0 then begin num:=a[0];exit;end;
  while k<>0 do begin
    t:=k mod 10;
    num:=num+a[t];
    k:=k div 10;
  end;
end;

begin
	read(m);
	m:=m-4;
  total:=0;
  for i:=0 to 1000 do
    for j:=0 to 1000 do begin
      n:=i+j;
      if (num(i)+num(j)+num(n))=m then begin
        inc(total);
      end;
  end;
  writeln(total);
end.