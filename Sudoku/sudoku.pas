//fpc 3.0.4

program sudoku;
type list=array [1..3] of integer;sq_list = array [1..3,1..3] of integer;
var start_key:char;borad:array [1..9,1..9] of integer;l1,l2:integer;//global var

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

function check_valid(i,num,box:integer):boolean;
var _l,_l2:integer;
begin
    check_valid:=true;
    for _l in borad[box] do if _l=num then check_valid:=false; //check self.box
    for _l in get_column(box) do for _l2 in get_column(i) do if borad[_l,_l2]=num then check_valid:=false; //check column
    for _l in get_row(box) do for _l2 in get_row(i)do if borad[_l,_l2]=num then check_valid:=false; //check row
end;

procedure gran_borad(level:integer);
var _index,_num:integer;
begin                             
    randomize;     
    for l1:=1 to 9 do // init borad
        for l2:=1 to 9 do 
            borad[l1,l2]:=0;
    
    for l1:=1 to 9 do //box
    begin
        l2:=level+2+random(2); //number of numbers write to the box
        repeat
            if l2=0 then break;
            _index:=random(9)+1;
            _num:=random(9)+1; 
            if check_valid(_index,_num,l1) then  //index:int,num:int,box:int
            begin
                borad[l1,_index] :=_num;
                l2:=l2-1;
            end;
        until l2=0;
    end; 
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
