var n,i,l,r,ans,len:longint;
  s:array[1..50000]of char;
function eql(i,j:longint):boolean;
  begin
    if((s[i]='A')and(s[j]='T'))or((s[i]='T')and(s[j]='A'))or
      ((s[i]='C')and(s[j]='G'))or((s[i]='G')and(s[j]='C'))then exit(true);
    exit(false);
  end;
begin
  readln(n); len:=0; ans:=0;
  for i:=1 to n do read(s[i]);
  for i:=1 to n do begin
    l:=i; r:=l+1;
    if eql(l,r) then begin
      dec(l); inc(r); len:=2;
      repeat
        if (l<1)or(r>n)or(not eql(l,r)) then break;
        inc(len,2); dec(l); inc(r);
      until (l<1)or(r>n);
      if ans<len then ans:=len;
    end;
  end;
  writeln(ans);
end.