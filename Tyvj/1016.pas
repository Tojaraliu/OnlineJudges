var
        v,nv,n:longint;
        a:array[0..20001] of boolean;
        i,j:longint;
begin
        readln(v,n);a[0]:=true;
        for i:=1 to n do begin
                readln(nv);
                for j:=v downto nv do begin
                        if a[j-nv] then a[j]:=true;
                end;
        end;
        for i:=v downto 0 do
                if a[i] then begin writeln(v-i);halt; end;
end.