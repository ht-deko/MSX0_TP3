(*
  M0I2CSCN v1.10
*)
program M0I2CSCN;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}

const
  bus: array [boolean] of char = ('i', 'a');
var
  i: boolean;
  n: Integer;
  node: LibStr;
  List, Last, p: PItem;
begin
  List := nil;
  for i:=False to True do
  begin
    node := 'device/i2c_' + bus[i];
    Writeln(node, ':');
    n := IotFind(node);
    IotFind(node, List, Last);
    p := List;
    while p <> nil do
    begin
      WriteLn('  0x', p^.Data);
      p := p^.Next;
    end;
    ClearListItem(List);
    if not i then
      Writeln;
  end;
end.
