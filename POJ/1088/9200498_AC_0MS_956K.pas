var
        a,f:array[0..101,0..101] of longint;
        i,j,r,c,ans:longint;

function max(a,b:longint):longint;
begin
        if a>b then exit(a);
        exit(b);
end;
function search(x,y:longint):longint;
begin
        if f[x,y]>0 then exit(f[x,y]);
        f[x,y]:=1;
        if a[x+1,y]<a[x,y] then f[x,y]:=max(f[x,y],search(x+1,y)+1);
        if a[x-1,y]<a[x,y] then f[x,y]:=max(f[x,y],search(x-1,y)+1);
        if a[x,y+1]<a[x,y] then f[x,y]:=max(f[x,y],search(x,y+1)+1);
        if a[x,y-1]<a[x,y] then f[x,y]:=max(f[x,y],search(x,y-1)+1);
	exit(f[x,y]);
end;
begin
        readln(r,c);
        filldword(a,sizeof(a)>>2,maxlongint);
        for i:=1 to r do begin
                for j:=1 to c do
                        read(a[i,j]);
        end;
        for i:=0 to 101 do for j:=0 to 101 do f[i,j]:=0;

        for i:=1 to r do
                for j:=1 to c do
                        if ans<search(i,j)
                                then ans:=search(i,j);
        writeln(ans);
end.