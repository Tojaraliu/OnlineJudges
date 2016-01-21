var s:string;i,j,q:longint;
begin
  while not(eof)do begin
    readln(s);q:=1;
    if pos('-',s)>0 then q:=-1;
    if pos('.',s)>0 then begin {}
      val(copy(s,1,pos('.',s)-1),j);
      delete(s,1,pos('.',s));
      while(s<>'')and(s[length(s)]='0')do delete(s,length(s),1);
    end else begin
      val(s,j);s:='';
    end;
    i:=0;j:=abs(j);{j:=abs(trunc)}
    while(j>=10)do begin
      inc(i);
      if(j mod 10>0)then s:=chr(j mod 10+48)+s
      else if s<>'' then s:='0'+s;
      j:=j div 10;
    end;
    while(j<1)and(s<>'')do begin{0<abs(a)<1}
      i:=-1*(abs(i)+1);
      j:=j*10+ord(s[1])-48;
      delete(s,1,1);
    end;
    if(s='')and(j>1)then write(q*j)
    else if(s='')and(j=1)and(i=0)then write(q*j)
    else if(s='')and(q*j=-1)then write('-')
    else if(s='')and(j=0)then write(0)
    else if(s<>'')then write(q*j,'.',s);
    if(abs(i)>0)and((s<>'')or(j>1))then write('*');
    if i=1 then write('10')
    else if i>1 then write('10^',i)
    else if i<0 then write('10^(',i,')');
    writeln;
  end;
end.