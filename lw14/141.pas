PROGRAM ReverseInput(INPUT, OUTPUT);
 
PROCEDURE Reverse(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN {Reverse}
  IF NOT EOLN(F)
  THEN 
    BEGIN 
      READ(F, Ch);
      Reverse(F);
      WRITE(Ch)
    END
END;

BEGIN
  Reverse(INPUT);
  WRITELN
END.     


