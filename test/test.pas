program test;

function get_table(n:integer):integer;
var 
    f:file of string;
    arr:array of string;
begin
    AssignFile(f,'assest/test.txt');
    reset(f);
    readln(f,s); 
    while not Eof(f) do 
    begin
        SetLength(arr, Length(arr) + 1);
        Readln(x, arr[High(Arr)]);
    end;
    CloseFile(f);
    get_table:=arr;
end;
begin
    write(get_table(3));
end.