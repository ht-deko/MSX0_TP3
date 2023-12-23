program TREE;
{$A-}
type
  LibStr = string[255];
{$I SYSUTILS.LIB}
{$I IOT.LIB}
var
  Flg: Boolean;
  procedure GetNodes(Node: LibStr);
  var
    List, Last, p: PItem;
    CC: Integer;
  begin
    if Flg then
      Exit;
    Writeln(Node);
    List := nil;
    CC := IotFindCount(Node);
    IoTFind(Node, List, Last);
    p := List;
    while (p <> nil) and (not Flg) do
    begin
      GetNodes(Node + '/' + p^.Data);
      p := p^.Next;
      Flg := Flg or KeyPressed;
    end;
    ClearListItem(List);
  end;
begin
  Flg := False;
  GetNodes('host');
  GetNodes('device');
  GetNodes('msx');
  GetNodes('conf');
end.
