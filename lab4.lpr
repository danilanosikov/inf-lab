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




function delta(x, x0:integer):integer;
begin
     delta := (x - x0);
end;

{removes line and column of max element}

procedure delCross(matr:intArray);
var
   cm:integer;
   cn:integer;
begin
     cm := 0;
     cn := 0;
     SetLength(RM, (m - 1), (n - 1));
     while(cm < m) do
     begin
          while(cn < n) do
          begin
               if((cm <> (maxM)) and (cn <> (maxN))) then
               begin
                    RM[cm, cn] := matr[cm, cn];
               end;
               cn := cn + 1;
          end;
          cn := cn + 1;
     end;
end;


{findMax method finds maximum element in matrix}



procedure findMax(matr:intArray);
var
   cm:integer;
   cn:integer;
   mx:integer;
   mxm:integer;
   mxn:integer;
begin
        cm := 0;
        mx := 0;
        while(cm < (Length(matr)-1)) do
        begin
             cn := 0;
             while(cn < (Length(matr[0])-1)) do
              begin
                    if(matr[cm,cn] > mx) then
                      begin
                           mx := matr[cm, cn];
                           mxm := cm;
                           mxn := cn;
                      end;
                    cn := cn + 1;
              end;
              cm := cm + 1;
        end;
        maxM := mxm;
        maxN := mxn;
end;


{finds number of digits in number}


function numberDigit(num:integer):integer;
var
   digit:integer;

begin
        digit := 0;
        while(num <> 0) do
         begin
              num := (num div 10);
              digit := digit + 1;

         end;
         numberDigit := digit;
end;


{
digitWrite method writes spaces based on digits of matrix element
}

procedure digitWrite(digit:integer);
var
   c:integer;
begin
     c := 0;
     while(c < digit) do
     begin
          write(' ');
          c := c + 1;
     end;
end;


{fillMatrix method sets matrix volume and fills it with elements}

procedure fillMatrix();
var
   counterM:integer;
   counterN:integer;
begin
     counterM:=0;
     counterN:= 0;

     readln(m);
     readln(n);
     writeln(' ');

     SetLength(matrix, m, n) ;

     while(counterM <> m) do
     begin
          while(counterN <> n) do
          begin
               readln(matrix[counterM, counterN]);
               Delay(200);

               counterN := counterN + 1;
               Delay(200);
          end;
          counterN := 0;
          counterM := counterM + 1;
     end;
end;




procedure writeMatrix(matr:intArray);
var
cm:integer;
cn:integer;
deltaA:integer;
begin
     writeln(maxM, maxN);
     cm := 0;
     while(cm < m) do
     begin
          cn := 0;
          while(cn <= n) do
          begin
               if(cn< n) then
               begin
                    write(matr[cm, cn]);
                    write('   ');
                    if(cm = 0) then
                    begin
                         deltaA := delta(numberDigit(matr[cm,cn]), numberDigit(matr[(maxM), cn]));
                         if(deltaA < 0) then
                         begin
                              digitWrite(abs(deltaA));
                         end;
                    end;

                    if((cm > 0) and (cm < (m-1))) then
                    begin
                         deltaA := delta(numberDigit(matr[cm,cn]), numberDigit(matr[(maxM), cn]));

                         if(deltaA < 0) then
                         begin
                              digitWrite(abs(deltaA));
                         end;
                    end;

                    if(cm = (m-1)) then
                    begin
                         deltaA := delta(numberDigit(matr[cm,cn]), numberDigit(matr[(maxM), cn]));
                         if(deltaA < 0) then
                         begin
                              digitWrite(abs(deltaA));
                         end;
                    end;

               end
               else if (cn = n) then
               begin
                    writeln(' ');
                    writeln(' ');
               end;
               cn := cn + 1
          end;
          cm := cm + 1
     end;
end;




begin
     fillMatrix();
     writeln(' ');
     findMax(matrix);
     writeMatrix(matrix);
     writeln(' ');
     //findMax();
     //delCross();
     //writeMatrix(RM);
     //writeln('');
     readln(waiter);
end.

