var
        a:array['a'..'z'] of integer;
        s:string;
        maxn,minn:longint;
        i:longint;j:char;

function zs(a:longint):boolean;
var
        i:longint;
begin
        if (a=0)or(a=1) then exit(false);
        for i:=2 to trunc(sqrt(a)) do
                if (a mod i)=0
                        then exit(false);
        exit(true);
end;

begin
        readln(s);
        for i:=1 to length(s) do
                inc(a[s[i]]);
        maxn:=0;
        minn:=maxlongint;

        for j:='a' to 'z' do begin
                if (a[j]<minn)and(a[j]<>0)
                        then minn:=a[j];
                if (a[j]>maxn)
                        then maxn:=a[j];
        end;

        if zs(maxn-minn)
                then begin writeln('Lucky Word');writeln(maxn-minn);end
                else begin writeln('No Answer');writeln('0');end;
end.