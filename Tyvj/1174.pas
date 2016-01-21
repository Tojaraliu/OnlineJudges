var
        a:array[1..100] of longint;
        n,i,k,t:longint;
        ans:real;
		flag:boolean;

procedure fj(n:longint);
var
        top:longint;i:longint;f:boolean;
begin
        top:=0;i:=3;
		if flag
			then begin
				a[1]:=2;
				top:=1;
		end;
        while i<=n do begin
			f:=false;
			while (n mod i)=0 do begin f:=true;n:=n div i;end;
			if f then begin inc(top);a[top]:=i;end;
                        inc(i);
		end;
        t:=top;
end;

begin
        readln(n);ans:=n;
		flag:=false;
        while (n and 1)=0 do begin n:=n>>1;flag:=true;end;
		if n=1 then begin writeln('1');halt;end;
		fj(n);
		
		for i:=1 to t do begin
			ans:=ans*(a[i]-1)/a[i];
		end;
		writeln(trunc(ans));

end.