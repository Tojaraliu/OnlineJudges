var
        f:array[0..45001] of boolean;
        weight,h,n,i,j:longint;
begin
        read(h,n);f[0]:=true;
        for i:=1 to n do begin
                read(weight);
                for j:=h downto weight do begin
                        if f[j-weight] then f[j]:=true;
                end;
        end;
        for i:=h downto 0 do
                if f[i] then begin writeln(i);halt;end;
end.