PROGRAM WriteLexico(INPUT, OUTPUT);

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





PROCEDURE Lexico(VAR F1, F2: TEXT);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch, Ch1, Ch2, Result: CHAR;
BEGIN
CopyFirst(F1);
READLN(Ch);
CopySecond(F2);
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
    END; {WHILE}
    WRITELN(Result)
END; {Lexico}

END; 

     





BEGIN
  Lexico(INPUT, OUTPUT)
END.
