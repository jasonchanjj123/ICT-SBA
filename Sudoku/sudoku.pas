//fpc 3.0.4

program sudoku;
type 
    list=array [1..3] of integer;
    sq_list = array [1..3,1..3] of integer;
    table = array [1..9,1..9] of integer;
var 
    start_key:char;borad:array [1..9,1..9] of integer;
    l1,l2:integer;//global var

procedure start_game();
begin 
    while (True) do
    begin
        write('Enter s to start:');
        readln(start_key);
        if (start_key='s') then break;
    end;
end;               

function get_column(i:integer):list; //sub func of check_valid {grand_borad.check_valid.get_group}
var r:list;_l:integer;
begin 
    case i of 
        1,4,7:for _l:=0 to 2 do r[_l]:=_l*3+1;
        2,5,8:for _l:=0 to 2 do r[_l]:=_l*3+2;
        3,6,9:for _l:=0 to 2 do r[_l]:=_l*3+3;
    end;
    get_column:=r; //return 
end;

function get_row(i:integer):list;
var r:list;_l:integer;
begin
    case i of 
        1,2,3:for _l:=0 to 2 do r[_l]:=1+_l;
        4,5,6:for _l:=0 to 2 do r[_l]:=4+_l;
        7,8,9:for _l:=0 to 2 do r[_l]:=7+_l;
    end;
    get_row:=r; //return 
end;



               


procedure print_borad();
var _box,_l,_l2,_row:integer;
begin
    writeln('-------+-------+-------+');
    for _box:=1 to 3 do
    begin
        for _l:=0 to 2 do
        begin
            for _l2:=_box to _box+2 do
            begin
                write(' ');
                for _row:=_l*3 +1 to _l*3+3 do 
                    write(borad[_l2,_row],' ');
                write('|');
            end;
            writeln();
        end;
        writeln('-------+-------+-------+');
    end;
end;

begin //*MAIN* func                
    start_game; 
    gran_borad(3);
    print_borad;

end.
