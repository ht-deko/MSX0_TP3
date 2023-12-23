program ACCEL;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
var
  X, Y, Z: Integer;
begin
  ClrScr;
  while not KeyPressed do
  begin
    X := IoTGetInt('device/accel/x');
    Y := IoTGetInt('device/accel/y');
    Z := IoTGetInt('device/accel/z');
    Writeln(X:6, Y:6, Z:6);
  end;
end.
