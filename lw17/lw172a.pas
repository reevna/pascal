PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  D, N: INTEGER;
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа,  в соответствующее целое число N}
VAR
  Ch: CHAR;
BEGIN
  D := -1;
  IF NOT EOLN
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9
    END
END;

BEGIN
  N := 0;
  WRITELN(MAXINT);
  ReadDigit(INPUT, D);

  IF D = -1
  THEN 
    WRITELN(D);
 
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER)
BEGIN 
  WHILE(D <> -1) AND (N <= (MAXINT - D) DIV 10) 
  DO 
    BEGIN
      N := N*10 + D;
      ReadDigit(INPUT, D)    
    END
  
    WRITELN('-2');
  WRITELN(N);

END.

