       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW2.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
       01  CNT   PIC S9(9)   BINARY.
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
           DISPLAY 'window2 init'
           INITIALIZE SCRAREA.
           MOVE 'window2' TO MCP-WINDOW.
           MOVE 'NEW' TO MCP-PUTTYPE.

           DISPLAY 'window2 init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       200-EVENT SECTION.
           DISPLAY 'window2 event'.

           MOVE 'window3' TO  MCP-WINDOW.
           MOVE 'NEW' TO MCP-PUTTYPE.

           DISPLAY 'window2 event end'.
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
