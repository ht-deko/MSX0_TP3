program I2C;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
var
  List, Last, p: PItem;
  N, S: LibStr;
  T: Real;
  Flg: Boolean;
begin
  ClrScr;
  Flg := False;
  List := nil;
  N := 'device/i2c_a';
  IoTFind(N, List, Last);
  p := List;
  while (p <> nil) and (not Flg) do
  begin
    if p^.Data = '38' then
    begin
      Flg := True;
      N := N + '/' + p^.Data;
    end;
    p := p^.Next;
  end;
  ClearListItem(List);
  if not Flg then
  begin
    Writeln('DHT20 is not found...');
    Exit;
  end;
  while True do
  begin
    IotPutStr(N, #$71);
    S := IoTGetStr(N);
    repeat
      IotPutStr(N, #$AC#$33#$00);
      S := IoTGetStr(N);
      if KeyPressed then
        Exit;
    until (Length(S) >= 6) and (Ord(S[1]) and $18 = $18);
    T := Ord(S[4]) and $0F;
    T := T * 256 + Ord(S[5]);
    T := T * 256 + Ord(S[6]);
    T := T / 1048576.0 * 200 - 50;
    Writeln(T:5:2);
  end;
end.
