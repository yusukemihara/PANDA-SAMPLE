       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         ENTRYTEST.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
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
               PERFORM  700-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'entry init'
           INITIALIZE SCRAREA.
           MOVE 'entrytest' TO MCP-WINDOW.
           MOVE 'T' TO EDITABLE OF E1.
           MOVE 'T' TO EDITABLE OF NE1.
           DISPLAY 'entry init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'entry event'.
           IF EDITABLE OF E1 = 'T'
             MOVE 'F' TO EDITABLE OF E1
             MOVE 'F' TO EDITABLE OF NE1
           ELSE
             MOVE 'T' TO EDITABLE OF E1
             MOVE 'T' TO EDITABLE OF NE1
           END-IF
           MOVE VALUE1 TO STYLE OF E1.
           MOVE VALUE1 TO STYLE OF NE1
           DISPLAY 'entry event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
