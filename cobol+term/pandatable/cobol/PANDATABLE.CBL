       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         PANDATABLE.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
       01  CNT             PIC 9(5) VALUE 0.
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
             WHEN     'LINK'       
               PERFORM  010-INIT
             WHEN     'PUTG'       
               PERFORM  100-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-INIT                SECTION.
           DISPLAY '010-init'
           INITIALIZE PANDATABLE1.

           MOVE 2 TO TROWATTR.

           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 1000
             MOVE 'label' TO CELLDATA OF COLUMN1(CNT)
             MOVE 'text1' TO CELLDATA OF COLUMN2(CNT)
             MOVE 'text2' TO CELLDATA OF COLUMN3(CNT)
             MOVE 'text3' TO CELLDATA OF COLUMN4(CNT)
             ADD 1 TO CNT
           END-PERFORM

           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'window'     TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
       010-INIT-END.
           EXIT.
      ************************************************************************
       100-EVENT                SECTION.
           DISPLAY '100-event'
           DISPLAY TROW.
           DISPLAY TCOLUMN.
           DISPLAY TVALUE.

           MOVE 1 TO CNT.
           PERFORM UNTIL CNT > 1000
             MOVE 'black' TO FGCOLOR OF COLUMN1(CNT)
             MOVE 'black' TO FGCOLOR OF COLUMN2(CNT)
             MOVE 'black' TO FGCOLOR OF COLUMN3(CNT)
             MOVE 'black' TO FGCOLOR OF COLUMN4(CNT)
             MOVE 'white' TO BGCOLOR OF COLUMN1(CNT)
             MOVE 'white' TO BGCOLOR OF COLUMN2(CNT)
             MOVE 'white' TO BGCOLOR OF COLUMN3(CNT)
             MOVE 'white' TO BGCOLOR OF COLUMN4(CNT)
             ADD 1 TO CNT
           END-PERFORM

           MOVE 'PeachPuff' TO BGCOLOR OF COLUMN1(TROW)
           MOVE 'PeachPuff' TO BGCOLOR OF COLUMN2(TROW)
           MOVE 'PeachPuff' TO BGCOLOR OF COLUMN3(TROW)
           MOVE 'PeachPuff' TO BGCOLOR OF COLUMN4(TROW)

           EVALUATE TCOLUMN  
             WHEN     1
               MOVE 'moccasin' TO BGCOLOR OF COLUMN1(TROW)
               MOVE 'red'      TO FGCOLOR OF COLUMN1(TROW)
             WHEN     2       
               MOVE 'moccasin' TO BGCOLOR OF COLUMN2(TROW)
               MOVE 'red'      TO FGCOLOR OF COLUMN2(TROW)
             WHEN     3       
               MOVE 'moccasin' TO BGCOLOR OF COLUMN3(TROW)
               MOVE 'red'      TO FGCOLOR OF COLUMN3(TROW)
             WHEN     4       
               MOVE 'moccasin' TO BGCOLOR OF COLUMN4(TROW)
               MOVE 'red'      TO FGCOLOR OF COLUMN4(TROW)
           END-EVALUATE.

           PERFORM 900-PUT-WINDOW.
       100-CLICKED-END.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
       900-PUT-WINDOW-END.
           EXIT.
