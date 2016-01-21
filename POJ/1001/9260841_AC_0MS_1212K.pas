const
  base=10;

var
  s,ans:ansistring;
  n,i:longint;
  a,b,c:array[0..300] of longint;

procedure init;
var
  ch:char;
  i:longint;
begin
  s:='';
  read(ch);
  while ch<>' ' do begin
    s:=s+ch;
    read(ch);
  end;
  readln(n);
  ans:=s;
end;

function mul(s,q:ansistring):ansistring;
var
  ans1:ansistring;
  i,j,len,point:longint;
begin
  fillchar(c,sizeof(c),0);
  point:=(length(s)-pos('.',s))+(length(q)-pos('.',q));
  delete(s,pos('.',s),1);delete(q,pos('.',q),1);
  ans1:='';
  a[0]:=length(s);b[0]:=length(q);
  for i:=1 to a[0] do a[a[0]-i+1]:=ord(s[i])-48;
  for i:=1 to b[0] do b[b[0]-i+1]:=ord(q[i])-48;
  for i:=1 to a[0] do
    for j:=1 to b[0] do begin
      c[i+j-1]:=c[i+j-1]+a[i]*b[j];
      c[i+j]:=c[i+j]+c[i+j-1] div 10;
      c[i+j-1]:=c[i+j-1] mod 10;
    end;
  len:=a[0]+b[0]+1;
  while c[len]>0 do begin
    c[len+1]:=c[len] div 10;
    c[len]:=c[len] mod 10;
    inc(len);
  end;
  for i:=len downto 1 do ans1:=ans1+chr(c[i]+48);
  insert('.',ans1,len-point+1);
  exit(ans1);
end;

begin
  while not eof do begin
    init;
    for i:=2 to n do ans:=mul(ans,s);
    while ans[length(ans)]='0' do delete(ans,length(ans),1);
    while ans[1]='0' do delete(ans,1,1);
    if ans[length(ans)]='.' then delete(ans,length(ans),1);
    writeln(ans);
  end;
end.
