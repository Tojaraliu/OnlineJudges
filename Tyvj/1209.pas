var
	ans1,ans2,i,j,k:longint;
	s:ansistring;
	a,f:array[0..21]of longint;

procedure init;
var
	t,i:longint;
	head:longint;
begin
	fillchar(a,sizeof(a),0);
	fillchar(a,sizeof(a),0);
	readln(s);t:=1;head:=1;
	while pos(',',s)<>0 do begin
		t:=pos(',',s);val(copy(s,1,t-1),a[head]);
		inc(head);
		delete(s,1,t);
	end;
	val(s,a[head]);
	k:=head;
end;

begin
	init;ans1:=0;ans2:=0;
	for i:=1 to k do f[i]:=1;
	for i:=1 to k do
		for j:=1 to i-1 do
			if (a[i]<=a[j])and(f[i]<f[j]+1) then f[i]:=f[j]+1;
	for i:=1 to k do if f[i]>ans1 then ans1:=f[i];
        for i:=1 to k do f[i]:=1;
	for i:=1 to k do
		for j:=1 to i-1 do
			if (a[i]>a[j])and(f[i]<f[j]+1) then f[i]:=f[j]+1;
	for i:=1 to k do if f[i]>ans2 then ans2:=f[i];
	dec(ans2);
        writeln(ans1,',',ans2);
end.