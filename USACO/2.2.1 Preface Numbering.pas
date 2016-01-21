{
ID:ToJaRa
PROG:preface
LANG:PASCAL
}

Const
  inp='preface.in';
  outp='preface.out';

Var
  a:array[1..30] of string;
  b:array[1..30] of integer;
  ans:array['A'..'Z'] of integer;
  n:integer;

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
begin
  readln(n);
  a[1]:='I'; b[1]:=1;
  a[2]:='II'; b[2]:=2;
  a[3]:='III'; b[3]:=3;
  a[4]:='IV'; b[4]:=4;
  a[5]:='V'; b[5]:=5;
  a[6]:='VI'; b[6]:=6;
  a[7]:='VII'; b[7]:=7;
  a[8]:='VIII'; b[8]:=8;
  a[9]:='IX'; b[9]:=9;
  a[10]:='X'; b[10]:=10;
  a[11]:='XX'; b[11]:=20;
  a[12]:='XXX'; b[12]:=30;
  a[13]:='XL'; b[13]:=40;
  a[14]:='L'; b[14]:=50;
  a[15]:='LX'; b[15]:=60;
  a[16]:='LXX'; b[16]:=70;
  a[17]:='LXXX'; b[17]:=80;
  a[18]:='XC'; b[18]:=90;
  a[19]:='C'; b[19]:=100;
  a[20]:='CC'; b[20]:=200;
  a[21]:='CCC'; b[21]:=300;
  a[22]:='CD'; b[22]:=400;
  a[23]:='D'; b[23]:=500;
  a[24]:='DC'; b[24]:=600;
  a[25]:='DCC'; b[25]:=700;
  a[26]:='DCCC'; b[26]:=800;
  a[27]:='CM'; b[27]:=900;
  a[28]:='M'; b[28]:=1000;
  a[29]:='MM'; b[29]:=2000;
  a[30]:='MMM'; b[30]:=3000;
end;

procedure main;
var
  k,i,j,t:integer;
  st:string;
begin
  for i:=1 to n do begin
    k:=30;st:='';t:=i;
    while (k<>0) and (t<>0) do begin
      if t>=b[k] then begin t:=t-b[k]; st:=st+a[k]; end;
      k:=k-1;
    end;
    for j:=1 to length(st) do inc(ans[st[j]]);
  end
end;

procedure print;
begin
  if ans['I']<>0 then writeln('I ',ans['I']);
  if ans['V']<>0 then writeln('V ',ans['V']);
  if ans['X']<>0 then writeln('X ',ans['X']);
  if ans['L']<>0 then writeln('L ',ans['L']);
  if ans['C']<>0 then writeln('C ',ans['C']);
  if ans['D']<>0 then writeln('D ',ans['D']);
  if ans['M']<>0 then writeln('M ',ans['M']);
end;

begin
  openf;
  init;
  main;
  print;
  closef;
end.
