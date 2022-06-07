Hello Team.
Here is step to run:
* If you using vscode and execute with command line:
1. install cobc
2. cobc -x main.cbl sub_add.cbl sub_delete.cbl sub_get_all.cbl sub_search.cbl sub_update.cbl sub_index2sequential.cbl sub_calculate_avg.cbl sub_sequential2index.cbl sub_avg.cbl 
3. ./main
* If you using OpenCobol:
1. Indexed file in folder /bin/
2. Run sub_* with type Module to build subroutine file
3. Run main file with type Execute

********************FUNCTION************************
1. GET ALL STUDENT
2. ADD STUDENT
3. UPDATE STUDENT BY ID
4. DELETE STUDENT
5. SEARCH RECORD BY ID
6. AVG STUDENT SCORE IN CLASS
***************************************************
Using file Temp (SEQUENTIAL FILE) to save state of INDEXED FILE --> Data will never be lost in INDEXED FILE.

