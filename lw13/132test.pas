PROGRAM CompareWords(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Result: CHAR;
  F1,F2 : TEXT;

PROCEDURE CopyFirst(VAR F1: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFirst в F1}
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1)
END;

PROCEDURE CopySecond(VAR F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopySecond в F2}
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT,  Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END;




PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2: CHAR;
BEGIN   
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF Ch1 < Ch2 
        THEN 
          Result := '1'
        ELSE
          Result := '2'
    END;
  IF NOT EOLN(F1) AND EOLN(F2)
  THEN
    Result := '1'
  ELSE
    Result := '2'        
END;



BEGIN 
 
 CopyFirst(VAR Ch: CHAR; VAR F1: TEXT); 
 CopySecond(VAR Ch: CHAR; VAR F2: TEXT);
 Lexico(VAR F1, F2: TEXT; VAR Result: CHAR); 
 WRITELN(Result)
END.


