type
        arr=array[0..10000]of integer;

var
        s,s1,s2:string;
        zheng,fu,a:arr;
        n,i:integer;
        flag:char;

procedure transform(s:string; var a:arr);
var
        i:integer;
begin
        a[0]:=length(s);
        for i:=1 to a[0] do a[i]:=ord(s[a[0]-i+1])-48;
end;

procedure add(a,b:arr; var c:arr);
var
        i,j:integer;
begin
        if a[0]>b[0] then
                begin
                        c[0]:=a[0];
                        for i:=b[0]+1 to a[0] do b[i]:=0;
                end
        else begin
                c[0]:=b[0];
                for i:=a[0]+1 to b[0] do a[i]:=0;
             end;
        j:=0;
        for i:=1 to c[0] do
        begin
                c[i]:=(a[i]+b[i]+j) mod 10;
                j:=(a[i]+b[i]+j) div 10;
        end;
        if j>0 then begin c[0]:=c[0]+1; c[c[0]]:=j; end;
end;


function max(a,b:integer):integer;
begin
	if a>b
		then max:=a
		else max:=b;
end;

procedure jian(var c,d:arr);
var
	i,k,n,m:integer;
	x,y,z:string;
	a,b:arr;
begin
	y:='';
	x:='';
	for i:=c[0] downto 1 do
		x:=x+chr(c[i]+48);
	for i:=d[0] downto 1 do
		y:=y+chr(d[i]+48);
	if x=y then begin writeln('0');halt;end;
	if  (length(x)<length(y)) or (length(x)=length(y)) and (x<y)
                then
			begin
				z:=x;
				x:=y;
				y:=z;
				write('-');
			end;
	n:=length(x);
    for i:=1 to n do a[n-i+1]:=ord(x[i])-ord('0');
	m:=length(y);
    for i:=1 to m do b[m-i+1]:=ord(y[i])-ord('0');
	i:=1;
	while i<=n do
		begin
			if a[i]<b[i]
				then begin a[i]:=a[i]+10;a[i+1]:=a[i+1]-1;end;
			a[i]:=a[i]-b[i];
			inc(i);
		end;
	k:=i;
	while (a[k]=0) do dec(k);
	for i:=k downto 1 do
		write(a[i]);
end;

procedure cal;
var
        i:integer;
begin
        if flag='+' then add(zheng,a,zheng)
        else add(fu,a,fu);
end;

procedure print(a:arr);
var
        i:integer;
begin
        for i:=a[0] downto 1 do writeln(i,':',a[i]);
        writeln;
end;


begin
	readln(s);
        n:=length(s);

        if s[1]<>'-' then i:=1
        else i:=2;

        s1:='';
        while (i<=n)and(s[i]<>'+')and(s[i]<>'-')do
        begin
                s1:=s1+s[i];
                i:=i+1;
        end;

        if i>n then begin write(s); halt; end;
        if s[1]<>'-'
			then transform(s1,zheng)
			else transform(s1,fu);

	while i<=n do
        begin
                flag:=s[i];
                i:=i+1;
                s2:='';
                while (i<=n) and (s[i]<>'+')and(s[i]<>'-') do
					begin
						s2:=s2+s[i];
						i:=i+1;
					end;
                transform(s2,a);
                cal;
        end;
        jian(zheng,fu);
        readln;
end.