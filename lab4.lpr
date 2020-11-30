program lab4;
uses crt;
type
  intArray = array of array of Integer;
var
   waiter:integer;
   m:integer;
   n:integer;

   matrix:intArray;

   RM:intArray;
   maxM:integer;
   maxN:integer;

{removes line and column of max element}
procedure delCross(matr, rMatr:intArray);
var
   cm:integer;
   cn:integer;
begin
     cm := 0;
     cn := 0;
     SetLength(rMatr, (m - 1), (n - 1));
     while(cm < m) do
     begin
          while(cn < n) do
          begin
               if((cm <> (maxM)) and (cn <> (maxN))) then
               begin
                    rMatr[cm, cn] := matr[cm, cn];
               end;
               cn := cn + 1;
          end;
          cn := cn + 1;
     end;
end;


{max method finds maximum number between two}
function max(a, b:integer):integer;
begin
     if(a>=b) then
     begin
          max := a;
     end
     else
     begin
          max := b;
     end;
end;

{-------}
function maxLineNum(elementN:integer; matr:intArray):integer;
var
   elementM:integer;
   mx:integer;
begin
     maxLineNum := 0;
     for elementM := 0 to (m - 1) do
     begin
          maxLineNum := max(maxLineNum, abs(matr[elementM,elementN]));
          if(maxLineNum = abs(matr[elementM,elementN])) then
          begin
               mx := elementM;
          end;
     end;
     maxLineNum := mx;
end;


{findMax method finds maximum element in matrix}
function findMax(matr:intArray):integer;
var
   elementM:integer;
   elementN:integer;
begin

     findMax := 0;

     for elementM := 0 to (m-1) do
     begin
          for elementN := 0 to (n-1) do
          begin
               findMax := max(findMax,abs(matr[elementM,elementN]));
               if(findMax = abs(matr[elementM, elementN])) then
               begin
                    maxM := elementM;
                    maxN := elementN;
               end
          end;
     end;
end;


{finds number of digits in number}
function Digits(num:integer):integer;
var
   digit:integer;
begin
        digit := 0;
        while(num <> 0) do
         begin
              num := (num div 10);
              digit := digit + 1;
              Digits := digit;
         end;
end;


{spaceWriter method writes spaces based on digits of matrix element}
procedure spaceWriter(num:integer);
var
   c:integer;
begin
     c := 0;
     while(c < num) do
     begin
          write(' ');
          c := c + 1;
     end;
end;

{dashWriter method writes dashes based on digits of matrix element}
procedure dashWriter(num:integer);
var
   c:integer;
begin
     c := 0;
     while(c < (num)) do
     begin
          write('-');
          c := c + 1;
     end;
end;


{dashCounter method count dashes based on digits of matrix element}
function dashCounter(num:integer):integer;
var
   c:integer;
begin
     c := 0;
     while(c < (num)) do
     begin
          c := c + 1;
     end;
     dashCounter := (c + (5*n));
end;

{fillMatrix method sets matrix volume and fills it with elements}
procedure fillMatrix();
var
   elementM:integer;
   elementN:integer;
begin
     write('write matrix size - Lines then Columns -> Lines: ');
     read(m);
     write(', Columns: ');
     read(n);
     writeln();

     SetLength(matrix, m, n);

     for elementM := 0 to m-1 do
     begin
          for elementN := 0 to n-1 do
          begin
               write(' ');
               read(matrix[elementM, elementN]);
               Delay(80);
          end;
     end;
end;



{writes matrix}
procedure writeMatrix(matr:intArray);
var
elementM:integer;
elementN:integer;
delt:integer;
dc:integer;
begin
     write('maximum element is: (');
     write((maxM + 1), ', ', (maxN + 1), ')');
     writeln(' ');
     writeln(' ');

     for elementM := 0 to m-1 do
     begin
          dc := dashCounter(Digits(matr[maxLineNum(elementN,matr), elementN]));
          writeln(' ');
          dashWriter(dc);
          writeln(' ');

          for elementN := 0 to n do
          begin
               if(elementN < n) then
               begin
                    write(matr[elementM, elementN]);

                    delt := abs(Digits(matr[elementM, elementN])- Digits(matr[maxLineNum(elementN,matr), elementN]));

                    if(delt > 0) then
                    begin
                         spaceWriter(delt);
                    end;
                    write('  |  ');

               end
               else
               begin
                    writeln(' ');
                    dashWriter(dc);
                    writeln(' ');
               end;

          end;
     end;
end;




begin
     fillMatrix();
     writeln(' ');
     findMax(matrix);
     writeMatrix(matrix);
     writeln(' ');
     //findMax();
     //delCross(matrix, RM);
     //writeMatrix();
     //writeln('');
     readln(waiter);
end.

