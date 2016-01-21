var s,ans:ansistring;

    c:char;

    n,i:longint;

 

 

function multiply(s,q:ansistring):ansistring;

var a,b,c:array[1..110000]of integer;

    len,len1,len2,float,i,j:longint;

    ans:ansistring;

begin

  fillchar(c,sizeof(c),0);

  multiply:='';

  float:=(length(s)-pos('.',s))+(length(q)-pos('.',q));

  delete(s,pos('.',s),1);delete(q,pos('.',q),1);

ans:='';

for i:=1 to length(s) do a[length(s)-i+1]:=ord(s[i])-ord('0');

for i:=1 to length(q) do b[length(q)-i+1]:=ord(q[i])-ord('0');

len1:=length(s);

len2:=length(q);

for i:=1 to len1 do

  for j:=1 to len2 do begin
    c[i+j-1]:=c[i+j-1]+a[i]*b[j];
    c[i+j]:=c[i+j]+c[i+j-1] div 10;
    c[i+j-1]:=c[i+j-1] mod 10;
  end;
  len:=len1+len2+1;
  while c[len]>0 do begin
      c[len+1]:=c[len] div 10;
      c[len]:=c[len] mod 10;

      inc(len);

    end;

  for i:=len downto 1 do ans:=ans+chr(c[i]+ord('0'));

  insert('.',ans,len-float+1);

  exit(ans);

end;

 

begin

  while not eof() do

    begin

      s:='';

      read(c);

      while c<>' ' do

        begin

          s:=s+c;

          read(c);

        end;

      readln(n);

      ans:=s;

    for i:=2 to n do

      ans:=multiply(ans,s);

    while ans[length(ans)]='0' do delete(ans,length(ans),1);

    while ans[1]='0' do delete(ans,1,1);

    if ans[length(ans)]='.' then delete(ans,length(ans),1);

    writeln(ans);

  end;

end.
