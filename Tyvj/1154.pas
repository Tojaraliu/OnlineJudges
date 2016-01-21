var
  q:array[0..800000] of longint;
  n,i,h,t,t1,j,t2:longint;
  a:array[0..100] of longint;

begin
  readln(n);h:=1;t:=0;
  fillchar(a,sizeof(a),0);
  fillchar(q,sizeof(q),0);
  for i:=1 to n do begin
    read(t2);
    case t2 of
      1:writeln(q[0]);
      2:begin
          dec(a[q[h]]);inc(h);dec(q[0]);
        end;
      3:begin
          read(t1);
          inc(t);q[t]:=t1;inc(a[t1]);inc(q[0]);
        end;
      4:begin
          if q[0]=0 then writeln(0)
          else
            for j:=100 downto 1 do
              if a[j]>0 then begin writeln(j);break;end;
        end;
    end;
    readln;
  end;
end.
