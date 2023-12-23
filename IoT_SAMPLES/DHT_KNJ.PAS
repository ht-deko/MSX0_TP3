program DHT_KNJ;
{$I MDLLIB.LIB}
{$I EXTBIOS.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
type
  Str8 = string[8];
var
  A: Integer;
  C, K: Byte;
  function GetTime: Str8;
  var
    i: byte;
    s: Str8;
  begin
    s := '';
    for i:=0 to 5 do
    begin
      if i in [2, 4] then
        s := ':' + s;
      LibRegs.C := i;
      SubROM($01F5);
      s := Chr($30 + LibRegs.A) + s;
    end;
    GetTime := s;
  end;
begin
  C := sys_textwidth;
  K := GetKMode;
  SetKMode(1);
  sys_textwidth := 26;
  ClrScr;
  while not KeyPressed do
  begin
    GotoXY(1, 4);
    Writeln(#$8E#$9E#$8D#$8F#$81#$40#$81#$40, GetTime);
    Writeln;
    A := IoTGetInt('device/dht/humidity');
    Writeln(#$8E#$BC#$93#$78#$81#$40#$81#$40, A, ' '#$81#$93);
    Writeln;
    A := IoTGetInt('device/dht/temperature');
    Writeln(#$89#$B7#$93#$78#$81#$40#$81#$40, A, ' '#$81#$8E);
    Writeln;
    Delay(100);
  end;
  SetKMode(K);
  sys_textwidth := C;
end.
