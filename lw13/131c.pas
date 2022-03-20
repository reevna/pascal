PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile InFile � OutFile}
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile,  Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;

PROCEDURE CopySwap(VAR F1, F2: TEXT; VAR Sorted: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN  {CopySwap F1 � F2} 
  Sorted := 'Y';
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch2);  
          IF Ch1 <= Ch2
          THEN
            BEGIN
              WRITE(F2, Ch1);
              Ch1 := Ch2
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

PROCEDURE BubbleSort(VAR InFile, OutFile: TEXT);
VAR
  Sorted: CHAR;
  F1, F2: TEXT;
BEGIN { BubbleSort }
  { �������� InFile � F1 }
  REWRITE(F1); 
  RESET(InFile); 
  CopyFile(InFile, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { �������� F1 � F2,�������� �����������������
       � ����������� ������ �������� ������� �� �������}
      RESET(F1);      
      REWRITE(F2);    
      CopySwap(F1, F2, Sorted);
      { �������� F2 � F1 }
      RESET(F2);
      REWRITE(F1);
      CopyFile(F2, F1)
    END;
  { �������� F1 � OutFile}
  RESET(F1);
  REWRITE(OutFile);
  CopyFile(F1, OutFile)
END;
  
BEGIN
  BubbleSort(INPUT, OUTPUT)
END.{ BubbleSort }



