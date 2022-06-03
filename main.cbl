       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENT-MANAGEMENT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 TRACK-MENU PIC 9.
       77 TRACK-MORE PIC X.


       PROCEDURE DIVISION.

       100-MAIN-MENU.
           DISPLAY "HELLO, THIS IS CLASS T1.C5 ^^!"
           DISPLAY "1. GET ALL STUDENT".
           DISPLAY "2. ADD STUDENT".
           DISPLAY "3. UPDATE STUDENT BY ID".
           DISPLAY "4. DELETE STUDENT".
           DISPLAY "5. SEARCH RECORD BY ID".
           DISPLAY "6. AVG STUDENT SCORE IN CLASS".
           DISPLAY "7. EXIT".

           ACCEPT TRACK-MENU.

           EVALUATE TRACK-MENU
           WHEN 1 CALL "SUB_GET_ALL"
           WHEN 2 CALL "SUB_ADD"
           WHEN 3 CALL "SUB_UPDATE"
           WHEN 4 CALL "SUB_DELETE"
           WHEN 5 CALL "SUB_SEARCH"
           WHEN 6 CALL "SUB_AVG"
           WHEN 7 PERFORM 101-STOP-PROGRAM
           WHEN OTHER
           DISPLAY "WRONG NUMBER!!"
           END-EVALUATE.

           PERFORM 102-GO-ON-MENU.



       101-STOP-PROGRAM.
           STOP RUN.
       102-GO-ON-MENU.
           DISPLAY "BACK TO MENU? Y/N"
           ACCEPT TRACK-MORE

           IF TRACK-MORE EQUAL "Y"
           GO TO 100-MAIN-MENU
           ELSE
           PERFORM 101-STOP-PROGRAM
           END-IF.


