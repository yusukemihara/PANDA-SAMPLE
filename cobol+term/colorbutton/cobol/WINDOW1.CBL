       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
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
           DISPLAY 'init'
           INITIALIZE SCRAREA.
           MOVE   'window1' TO  MCP-WINDOW.
           MOVE '#FFFF00' TO COLOR.
           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event'.
           DISPLAY COLOR.

           MOVE COLOR TO BGCOLOR. 

           MOVE   'window1' TO  MCP-WINDOW.
           DISPLAY 'event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
