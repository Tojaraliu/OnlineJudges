type
        command=record xll,yll,xur,yur:longint; end;
var
        o:array[0..200] of command;
        map:array[0..241,0..241] of boolean;
        i,j,k,x,y,m,total:longint;

begin
        readln(x,y,m);
        for i:=0 to 241 do
                for j:=0 to 241 do
                        map[i,j]:=true;
        for i:=1 to m do
                readln(o[i].xll,o[i].yll,o[i].xur,o[i].yur);

        for i:=1 to m do begin
                for j:=o[i].xll to o[i].xur do begin
                        for k:=o[i].yll to o[i].yur do
                                map[j,k]:=false;
                end;
        end;
        for i:=1 to x do
                for j:=1 to y do
                        if map[i,j]=false
                                then inc(total);

        writeln(total);
end.