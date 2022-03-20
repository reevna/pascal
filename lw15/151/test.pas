PROGRAM CountReverses(INPUT, OUTPUT);
USES
  Count3;
VAR 
  Ch1, Ch2, Ch3, X100, X10, X1: CHAR;
BEGIN {CountReverses}
  Start;
  WRITE('Ввод: ');  
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch1);
      WRITE(Ch1);
      IF NOT EOLN
      THEN
        BEGIN
          READ(Ch2);
          WRITE(Ch2);
          WHILE NOT EOLN
          DO
            BEGIN
              READ(Ch3);
              WRITE(Ch3);
              IF ((Ch2 < Ch1) AND (Ch2 < Ch3)) OR ((Ch2 > Ch1) AND (Ch2 > Ch3))
              THEN
                Bump;
              Ch1:= Ch2;
              Ch2:= Ch3;
            END
        END
    END;
  Value(X100, X10, X1);
  WRITELN;
  WRITELN('Количество реверсов: ', X100, X10, X1, '.')
END.

