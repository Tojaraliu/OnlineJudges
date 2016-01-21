{
ID:ToJaRa
LANG:PASCAL
PROG:ride
}
const
	inp='ride.in';
	outp='ride.out';

Var
	s1,s2:string;
	a:array['A'..'Z'] of longint;
	ch:char;
	l1,l2,i,x,y:longint;
	
begin
	assign(input,inp);reset(input);
	assign(output,outp);rewrite(output);
	readln(s1);
	readln(s2);
	for ch:='A' to 'Z' do a[ch]:=ord(ch)-ord('A')+1;
	l1:=length(s1);l2:=length(s2);x:=1;y:=1;
	for i:=1 to l1 do x:=x*a[s1[i]] mod 47;
  for i:=1 to l2 do y:=y*a[s2[i]] mod 47;
  if x=y then writeln('GO') else writeln('STAY');
  close(input);
  close(output);
end.