var
  f:longint;m,n:real;
  s,t:string;ch:char;
begin
  readln(s);
  val(copy(s,3,length(s)-2),n);
  ch:=s[1];
  repeat
    readln(s);
    if s[1]<>'#' then

      if s[2] in ['a'..'z','A'..'Z'] then writeln(s)
      else begin
        val(copy(s,2,2),f);
        val(copy(s,5,5),m);
        t:=copy(s,10,length(s)-9);
        if ch='-' then begin
          if m<n then repeat
            m:=m+60;dec(f);
          until m>=n;
          m:=m-n;
        end else begin
          m:=m+n;
          if m>=60 then repeat
            m:=m-60;
            inc(f);
          until m<60;
        end;
        if f<10 then write('[0',f,':') else write('[',f,':'); {ע��ʱ��������Ӧ����XX:XX.XX��������λ��}
        if m<10 then write('0',m:0:2) else write(m:0:2);
        writeln(t);
      end;
  until s='#'; {��ȻҲ����while not eof do������Ȼ����'#'�����Ű��}
end.