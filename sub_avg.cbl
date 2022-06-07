       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUB_AVG.

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT STUDENT ASSIGN TO
               'INDEX-STU-RECORD.TXT'
                   ORGANIZATION IS INDEXED
                   RECORD KEY IS STUDENT-NUMBER
                   ACCESS MODE IS SEQUENTIAL
                   FILE STATUS IS WS-FS.

       DATA DIVISION.
           FILE SECTION.
           FD STUDENT.
           01 STUDENT-FILE.
               05 STUDENT-NUMBER  PIC 9(6).
               05 STUDENT-NAME    PIC X(10).
               05 STUDENT-SCORE    PIC 9(2).
           01 STUDENT-AVG.
               05 STUDENT-AVG-NAME    PIC X(15).
               05 FILLER PIC X(5)    VALUE SPACES.
               05 STUDENT-AVG-SCORE    PIC 9(2).9(2).

           WORKING-STORAGE SECTION.
           01 WS-STUDENT-RECORD.
               05 WS-STUDENT-NUMBER  PIC 9(6).
               05 WS-STUDENT-NAME    PIC X(10).
               05 WS-STUDENT-SCORE    PIC 9(2).
           01 WS-EOF PIC A(1).
           01 WS-EXISTED-TOTAL PIC A(1).
           77 WS-FS               PIC 9(02).

           01 WS-TOTAL-MARKS PIC 9(10)V9(2) VALUE 0.
           01 WS-COUNT PIC 9(10) VALUE 0.
           01 WS-AVG-MARKS PIC 9(2)V9(2) VALUE 0.
           01 COUNTER PIC 9 VALUE 0.

           LINKAGE SECTION.
           PROCEDURE DIVISION.
            OPEN INPUT STUDENT.
               PERFORM UNTIL WS-EOF='Y'
               READ STUDENT INTO WS-STUDENT-RECORD
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END
                       IF WS-STUDENT-NUMBER IS NUMERIC
                        DISPLAY WS-STUDENT-NUMBER"-"WS-STUDENT-NAME
                                               "-"WS-STUDENT-SCORE
                        COMPUTE WS-TOTAL-MARKS = WS-TOTAL-MARKS 
                                                + WS-STUDENT-SCORE
                        COMPUTE WS-COUNT = WS-COUNT + 1
                       ELSE
                        MOVE 'Y' TO WS-EXISTED-TOTAL
                        MOVE 'Y' TO WS-EOF
                       END-IF
               END-READ
               END-PERFORM.
           CLOSE STUDENT.

           CALL 'CALCULATE_AVG' 
               USING WS-TOTAL-MARKS, WS-COUNT, WS-AVG-MARKS.
           DISPLAY '==========='.
           DISPLAY 'Count: 'WS-COUNT.
           DISPLAY 'Total marks: 'WS-TOTAL-MARKS.
           DISPLAY 'AVG: 'WS-AVG-MARKS.
           GOBACK.
       END PROGRAM SUB_AVG.
