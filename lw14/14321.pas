PROGRAM CheckRecursiveSort(INPUT, OUTPUT);
VAR
  OutFile, F2, F3: TEXT;
 
{Копируем INPUT в OutFile}
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile InFile в OutFile}
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile,  Ch);
      WRITE(OutFile, Ch);
    END;
  WRITELN(OutFile)
END;

PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
  Switch := '2';
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '2'
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
        END
    END;
  WRITELN(F2);
  WRITELN(F3);
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Сливает F2, F3 в F1  в сортированном порядке}
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  WHILE NOT EOLN(F2) AND NOT EOLN(F3)
  DO
    BEGIN 
      READ(F2, Ch2);
      READ(F3, Ch3);
      WHILE NOT EOLN(F2) AND NOT EOLN(F3)      
      DO  
        BEGIN
          IF Ch2 < CH3
          THEN 
            BEGIN
              WRITE(F1, Ch2);
              READ(F2, Ch2);
            END
          ELSE
            BEGIN
              WRITE(F1, Ch3);
              READ(F3, Ch3);   
            END
        END
    END;
  
  {Копировать остаток F2 в F1 }
  IF EOLN(F2) AND EOLN(F3) 
  THEN
    BEGIN
      IF Ch2 < CH3
      THEN 
        WRITE(F1, Ch2)
      ELSE
        WRITE(F1, Ch3);
    END
  ELSE
    IF EOLN(F2) AND NOT EOLN(F3)
    THEN 
      BEGIN
        WRITE(F1, Ch3);
        WRITE(F1, Ch2);
        READ(F3, Ch3);
        WRITE(F1, Ch3)
      END
    ELSE 
      BEGIN
        WRITE(F1, Ch2);
        WRITE(F1, Ch3);
        READ(F2, Ch2);
        WRITE(F1, Ch2)
      END;

  WRITELN(F1);
END; {Merge}

   

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)
  THEN
    BEGIN
      IF NOT EOLN(F1)
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          RESET(F1);
          REWRITE(F2);
          REWRITE(F3);
          Split(F1, F2, F3);
          RESET(F2);
          RESET(F3);
          CopyFile(F2, OUTPUT);
          CopyFile(F3, OUTPUT);
          RESET(F2);
          RESET(F3);  
          RecursiveSort(F2);
          RecursiveSort(F3); 
          RESET(F2);
          RESET(F3);
          REWRITE(F1);
          Merge(F1, F2, F3); 
                
        END
    END
END;   {RecursiveSort}





BEGIN
  RecursiveSort(INPUT, OUTPUT);
  REWRITE(OutFile);
  CopyFile(INPUT, OutFile);
  RecursiveSort(OutFile); 
  RESET(OutFile);
  CopyFile(OutFile, OUTPUT);   
END.
