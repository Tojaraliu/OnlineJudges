var
        n,k,i,j,t:longint;
        a:array[0..1000] of longint;
        f:array[0..1000,-1000..1000] of longint;
        g:array[-1000..1000] of longint;
begin
        readln(n);
        for i:=1 to n do read(a[i]);
        for i:=1 to n do inc(g[a[i]]);
        for i:=1 to n do f[i,0]:=1;
        for i:=2 to n do
                for j:=1 to i-1 do begin
                        k:=a[i]-a[j];
                        inc(f[i,k],f[j,k]);
                        if k<>0 then inc(f[i,k]);
                end;
        for i:=1 to n do
			for j:=-1000 to 1000 do
				t:=(t+f[i,j]) mod 9901;
		writeln(t);
end.