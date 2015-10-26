       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
            COPY    "DB-PUSH".
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
           DISPLAY 'window1 init'
           INITIALIZE SCRAREA.
           MOVE 'window1' TO MCP-WINDOW.
           MOVE 'NEW' TO MCP-PUTTYPE.

           DISPLAY 'window1 init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       200-EVENT SECTION.
           DISPLAY 'window1 event'.

           DISPLAY '================'.
           INITIALIZE DB-PUSH.

           MOVE 'PUSHEVENT' TO MCP-FUNC
           MOVE 'push' TO MCP-TABLE
           MOVE 'push' TO MCP-PATHNAME
           MOVE SCR-ENTRY1 TO DB-PUSH-EVENT
           MOVE SCR-ENTRY2 TO DB-PUSH-ID
           MOVE SCR-ENTRY3 TO DB-PUSH-COMMENT
           CALL 'MONFUNC' USING
             MCPAREA
             DB-PUSH.

           MOVE 'window1' TO MCP-WINDOW.
           MOVE 'PUTG' TO MCP-PUTTYPE.

           DISPLAY 'SCR-E1:' SCR-ENTRY1.
           DISPLAY 'SCR-E2:' SCR-ENTRY2.
           DISPLAY 'SCR-E2:' SCR-ENTRY3.
           DISPLAY 'DB-PUSH-EVENT:'   DB-PUSH-EVENT.
           DISPLAY 'DB-PUSH-ID:'      DB-PUSH-ID.
           DISPLAY 'DB-PUSH-COMMENT:' DB-PUSH-COMMENT.

           DISPLAY 'window1 event end'.
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE 'PUTWINDOW' TO MCP-FUNC.
           CALL 'MONFUNC' USING
             MCPAREA.
           EXIT.
