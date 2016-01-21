var
	a,f,m:array[0..5001] of longint;
	i,j,t,ans:longint;
	n,max:longint;
	flag:boolean;
begin
	readln(n);
	for i:=1 to n do read(a[i]);
	f[1]:=1;
	for i:=2 to n do begin
	    f[i]:=1;
		for j:=1 to i-1 do
			if (a[i]>=a[j])and(f[j]+1>f[i]) then f[i]:=f[j]+1;
	end;
	max:=0;
	for i:=1 to n do
		if f[i]>max then max:=f[i];
	writeln(max);

	{m[1]:=1;
	for i:=2 to n do begin
		m[i]:=0;
		flag:=true;
		for j:=1 to i-1 do
			if (a[j]<a[i])and(f[j]+1>f[i]) then begin
				inc(m[i],m[j]);
				flag:=false;
			end;
		if flag then m[i]:=1;
	end;
	ans:=0;
	for i:=1 to n do if f[i]=max then inc(ans,m[i]);
	writeln(ans);}
	
end.const
        maxn=1000;
type
	arr=array[0..5001] of longint;
var
        n,i,j,max:integer;
        a,f,total:arr;
        t:array[0..5001] of arr;
        b:boolean;

procedure print(a:arr);
var
	i:longint;
begin
	for i:=1 to a[0]-1 do
		write(a[i]);
	writeln(a[a[0]]);
end;

function jia(a,b:arr):arr;
var
	i:integer;
begin
	if a[0]<b[0]
		then a[0]:=b[0];
	for i:=1 to a[0] do
		begin
			a[i+1]:=a[i+1]+(a[i]+b[i]) div 10;
			a[i]:=(a[i]+b[i]) mod 10;
		end;
        if a[a[0]+1]>0 then inc(a[0]);
	jia[0]:=a[0];
        for i:=1 to a[0] do
                jia[i]:=a[i];
end;

begin
        //assign(input,'lis.in'); reset(input);
        //assign(output,'lis.out'); rewrite(output);

        readln(n);
        for i:=1 to n do
                read(a[i]);

        f[1]:=1;

        for i:=2 to n do
        begin
                f[i]:=1;
                for j:=1 to i-1 do
                        if (a[j]<a[i]) and (f[j]+1>f[i]) then f[i]:=f[j]+1;
        end;

        max:=0;
        for i:=1 to n do
                if max<f[i] then max:=f[i];

        writeln(max);

       { t[1][0]:=1;t[1][1]:=1;

        for i:=2 to n do
        begin
                t[i][0]:=0;t[i][1]:=0;
                b:=true;
                for j:=1 to i-1 do
                        if (a[j]<a[i])and(f[j]+1=f[i]) then
                        begin
                                t[i]:=jia(t[i],t[j]);
                                b:=false;
                        end;
                if b then begin t[i][0]:=1;t[i][1]:=1; end;
        end;
	
        total[1]:=0;total[0]:=0;
        for i:=1 to n do
                if f[i]=max then total:=jia(total,t[i]);
        print(total);

        //close(input);
        //close(output);}
end.