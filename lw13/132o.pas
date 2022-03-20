PROGRAM WriteLexico(INPUT, OUTPUT);

PROCEDURE Lexico(VAR F1, F2: TEXT);
{Result 0, 1, 2 ���� ������������������ ������� F1 =, <, > ��� F2
��������������. ����������� ���������, ��������������� F1 � F2,
������ ���� ����������}
VAR
  Ch1, Ch2, Result: CHAR;
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
      THEN {Ch1 < Ch2 ��� F1 ������ F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 ��� F2 ������ F1}
          Result := '2'
    END; {WHILE}
  WRITELN(Result);  
END; {Lexico}

BEGIN
  Lexico(INPUT, OUTPUT)
END.
