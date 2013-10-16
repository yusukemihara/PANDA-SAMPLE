       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
       01 CNT PIC 9(5) VALUE 1.
       01 C PIC 9(5) VALUE 1.
       01 D PIC 9(5) VALUE 1.
       LINKAGE                 SECTION.
            COPY    "MCPAREA".
            COPY    "SPAAREA".
            COPY    "LINKAREA".
            COPY    "SCRAREA".
      ************************************************************************
       PROCEDURE           DIVISION    USING
           MCPAREA
           SPAAREA
           LINKAREA
           SCRAREA.
       000-MAIN                SECTION.
           EVALUATE    MCP-STATUS
             WHEN      'LINK' 
               PERFORM  100-INIT
             WHEN      ANY  
               PERFORM  200-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'init window1'
           INITIALIZE WINDOW1.
           MOVE 'NEW' TO MCP-PUTTYPE.
           MOVE 'window1' TO  MCP-WINDOW.
           MOVE 100 TO TROW.
   
           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 400
             MOVE  CNT TO CELLDATA OF COLUMN1(CNT)
             MOVE 'INPUTCD'  TO CELLDATA OF COLUMN2(CNT)
             MOVE 'MEISYO'  TO CELLDATA OF COLUMN3(CNT)
             MOVE 'SURYO' TO CELLDATA OF COLUMN4(CNT)

             DIVIDE CNT BY 2 GIVING C REMAINDER D

             IF D = 0
               MOVE 'red' TO BGCOLOR OF COLUMN1(CNT) 
               MOVE 'red' TO BGCOLOR OF COLUMN2(CNT) 
               MOVE 'red' TO BGCOLOR OF COLUMN3(CNT) 
               MOVE 'red' TO BGCOLOR OF COLUMN4(CNT) 
             ELSE
               MOVE '' TO BGCOLOR OF COLUMN1(CNT) 
               MOVE '' TO BGCOLOR OF COLUMN2(CNT) 
               MOVE '' TO BGCOLOR OF COLUMN3(CNT) 
               MOVE '' TO BGCOLOR OF COLUMN4(CNT) 
             END-IF 

             ADD 1 TO CNT
           END-PERFORM.

           DISPLAY 'init window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       200-EVENT             SECTION.
           DISPLAY 'event 200 window1'.
           DISPLAY 'WINDOW:' MCP-WINDOW.
           DISPLAY 'WIDGET:' MCP-WIDGET.
           DISPLAY 'EVENT:' MCP-EVENT.

           MOVE   'window2' TO  MCP-WINDOW.
           MOVE 'CHANGE' TO MCP-PUTTYPE.
           DISPLAY 'event 200 window1 end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
