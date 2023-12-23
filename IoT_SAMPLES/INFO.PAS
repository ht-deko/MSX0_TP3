program INFO;
{$I MDLLIB.LIB}
{$I VRAM2.LIB}
{$I GAMEIO.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
var
  I: Integer;
begin
  ClrScr;
  ScrMode(1);
  GoToXY(1, 2);
  Writeln('name : ', IoTGetStr('host/name')      );
  Writeln('sw   : ', IoTGetStr('host/sw_version'));
  Writeln('ip   : ', IoTGetStr('host/ip')        );
  while True do
  begin
    GoToXY(1, 6);
    Writeln('heap : ', IoTGetInt('host/heap'         ):4 , ' KB');
    Writeln('batt : ', IoTGetInt('host/battery/level'):4 , ' %' );
    for I:=1 to 32 do
      begin
        if Keypressed or (Pad(4) <> 0) then
          Exit;
        Delay(100);  
      end;
  end;
end.
