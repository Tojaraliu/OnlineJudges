{
ID:ToJaRa
PROG:clocks
LANG:PASCAL
}

const
	inp='clocks.in';
	outp='clocks.out';

var
  f:array[0..9,0..9] of longint;
  a,b:array[0..9] of longint;
  v1,v2,v3,v4,v5,v6,v7,v8,v9:longint;

procedure openf;
begin
  assign(input,inp);reset(input);
  assign(output,outp);rewrite(output);
end;

procedure closef;
begin
  close(input);
  close(output);
end;

procedure init;
var
  t,i:longint;
begin
  for i:=1 to 9 do begin
    read(t);
    a[i]:=t div 3;
  end;
  fillchar(f,sizeof(f),0);
  f[1,1]:=1;f[1,2]:=1;f[1,4]:=1;f[1,5]:=1;
  for i:=1 to 3 do f[2,i]:=1;
  f[3,2]:=1;f[3,3]:=1;f[3,5]:=1;f[3,6]:=1;
  f[4,1]:=1;f[4,4]:=1;f[4,7]:=1;
  f[5,2]:=1;f[5,4]:=1;f[5,5]:=1;f[5,6]:=1;f[5,8]:=1;
  f[6,3]:=1;f[6,6]:=1;f[6,9]:=1;
  f[7,4]:=1;f[7,5]:=1;f[7,7]:=1;f[7,8]:=1;
  for i:=7 to 9 do f[8,i]:=1;
  f[9,5]:=1;f[9,6]:=1;f[9,8]:=1;f[9,9]:=1;
end;

function check:boolean;
var
  i:longint;
begin
  for i:=1 to 9 do
    if b[i]<>4 then exit(false);
  exit(true);
end;

procedure print;
var
  i,j:longint;
  op:array[0..50] of longint;
begin
  fillchar(op,sizeof(op),0);j:=0;
  for i:=1 to v1 do begin inc(j);op[j]:=1;end;
  for i:=1 to v2 do begin inc(j);op[j]:=2;end;
  for i:=1 to v3 do begin inc(j);op[j]:=3;end;
  for i:=1 to v4 do begin inc(j);op[j]:=4;end;
  for i:=1 to v5 do begin inc(j);op[j]:=5;end;
  for i:=1 to v6 do begin inc(j);op[j]:=6;end;
  for i:=1 to v7 do begin inc(j);op[j]:=7;end;
  for i:=1 to v8 do begin inc(j);op[j]:=8;end;
  for i:=1 to v9 do begin inc(j);op[j]:=9;end;
  for i:=1 to j-1 do write(op[i],' ');
  writeln(op[j]);
end;

procedure cl;
var
  i,j:longint;
begin
  for i:=1 to 9 do b[i]:=a[i];
  for i:=1 to 9 do begin b[i]:=b[i]+f[1,i]*v1;if b[i]>4 then dec(b[i],4);end;
  for i:=1 to 9 do begin b[i]:=b[i]+f[2,i]*v2;if b[i]>4 then dec(b[i],4);end;
  for i:=1 to 9 do begin b[i]:=b[i]+f[3,i]*v3;if b[i]>4 then dec(b[i],4);end;
  for i:=1 to 9 do begin b[i]:=b[i]+f[4,i]*v4;if b[i]>4 then dec(b[i],4);end;
  for i:=1 to 9 do begin b[i]:=b[i]+f[5,i]*v5;if b[i]>4 then dec(b[i],4);end;
  for i:=1 to 9 do begin b[i]:=b[i]+f[6,i]*v6;if b[i]>4 then dec(b[i],4);end;
  for i:=1 to 9 do begin b[i]:=b[i]+f[7,i]*v7;if b[i]>4 then dec(b[i],4);end;
  for i:=1 to 9 do begin
        b[i]:=b[i]+f[8,i]*v8;
        if b[i]>4 then dec(b[i],4);
  end;
  for i:=1 to 9 do begin b[i]:=b[i]+f[9,i]*v9;if b[i]>4 then dec(b[i],4);end;
end;

procedure work;
var
  i,j,k:longint;
begin
  for v1:=0 to 3 do
    for v2:=0 to 3 do
      for v3:=0 to 3 do
        for v4:=0 to 3 do
          for v5:=0 to 3 do
            for v6:=0 to 3 do
              for v7:=0 to 3 do
                for v8:=0 to 3 do
                  for v9:=0 to 3 do begin
                    cl;
                    if check then begin print;closef;halt;end;
  end;
end;
'woshichaoweilanmao'
begin
  openf;
  init;
  work;
  closef;
end.
