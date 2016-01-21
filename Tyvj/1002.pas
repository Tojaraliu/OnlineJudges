Const
  fn='scholar';

var
  maxn,nam:string;
  qmcj,bjpy:0..100;
  n,i:1..100;
  lws:0..10;
  xsgb,xbxs,ch:char;
  total,maxjxj,jxj:longint;
  
begin
  total:=0;maxjxj:=0;
  readln(n);
  for i:=1 to n do begin
    nam:='';
    read(ch);
    repeat
      nam:=nam+ch;read(ch);
    until ch=' ';
    readln(qmcj,bjpy,ch,xsgb,ch,xbxs,ch,lws);
    jxj:=0;
    if(qmcj>80)and(lws>0)then inc(jxj,8000);
    if(qmcj>85)and(bjpy>80)then inc(jxj,4000);
    if qmcj>90 then inc(jxj,2000);
    if(xbxs='Y')and(qmcj>85)then inc(jxj,1000);
    if(bjpy>80)and(xsgb='Y')then inc(jxj,850);
    inc(total,jxj);
    if jxj>maxjxj then begin maxjxj:=jxj;maxn:=nam;end;
  end;
  writeln(maxn);writeln(maxjxj);writeln(total);
end.
