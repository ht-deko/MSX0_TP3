program WIFILVL;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
begin
  ClrScr;
  while not KeyPressed do
  begin
    GotoXY(4, 4);
    Writeln(IoTGetInt('host/wifi/level'));
    Delay(100);
  end;
end.
