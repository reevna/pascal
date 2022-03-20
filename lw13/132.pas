PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2: CHAR;


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


PROCEDURE Compare(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN   
  RESET(F1);
  RESET(F2);
  Result := '0';
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F2, Ch1);  
          IF 
          THEN
            BEGIN
              


               
              
            END
          ELSE
            BEGIN
              WRITE(F2, Ch2);
              Sorted := 'N'
            END
        END;
      WRITELN(F2, Ch1) 
    END
END;










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
    END {WHILE}
END; {Lexico}


