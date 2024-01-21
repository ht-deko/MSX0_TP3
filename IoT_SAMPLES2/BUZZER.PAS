program BUZZER;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
begin
  while not KeyPressed do
  begin
    IoTPutInt('device/analog/out', 4000);
    Delay(1789);
    IoTPutInt('device/analog/out', 0);
    Delay(894);
  end;
end.