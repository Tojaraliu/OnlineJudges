var
	a,b:ansistring;
	i:longint;
	la,lb,ans,head:longint;
	s:array[0..600000] of char;
	
function newpos:boolean;
var
	i:longint;
begin
	for i:=1 to la do
		if a[i]<>s[head-i+1] then exit(false);
	exit(true);
end;

begin
	head:=0;ans:=0;
	readln(a);la:=length(a);
	readln(b);lb:=length(b);
	for i:=lb downto 1 do begin
		inc(head);s[head]:=b[i];
		if (s[head]=a[1])and(newpos) then begin
			dec(head,la);inc(ans);
		end;
	end;
	writeln(ans);
end.