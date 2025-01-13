program DHT_ANK;
{$I MDLLIB.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
type
  Str8 = string[8];
var
  A: Integer;
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
  ClrScr;
  while not KeyPressed do
  begin
    GotoXY(1, 4);
    Writeln('TIME : ', GetTime);
    A := IoTGetInt('device/dht/humidity');
    Writeln('HUM. : ', A, '%');
    A := IoTGetInt('device/dht/temperature');
    Writeln('TEMP.: ', A, #$DF'C');
    Delay(100);
  end;
end.
