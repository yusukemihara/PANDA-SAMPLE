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
               PERFORM  700-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'WINDOW1 init'
           INITIALIZE SCRAREA.
           MOVE   LNK-SUMMARY TO POPUP-SUMMARY.
           MOVE   LNK-BODY    TO POPUP-BODY.
           MOVE   LNK-BODY TO BGCOLOR.
           MOVE   LNK-ICON    TO POPUP-ICON.
           MOVE   LNK-TIMEOUT TO POPUP-TIMEOUT.
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'window1'     TO  MCP-WINDOW.
           DISPLAY 'WINDOW1 init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-CLICKED             SECTION.
           DISPLAY 'WINDOW1 clicked'.
           DISPLAY SUMMARYVALUE.
           MOVE   SUMMARY TO LNK-SUMMARY.
           MOVE   BODY    TO LNK-BODY.
           MOVE   ICON    TO LNK-ICON.
           MOVE   TIMEOUTVALUE TO LNK-TIMEOUT.
           DISPLAY 'TIMEOUT:' TIMEOUT.
           DISPLAY 'LNK-TIMEOUT:' LNK-TIMEOUT.

           MOVE   'CHANGE'        TO  MCP-PUTTYPE.
           MOVE   'window2'       TO  MCP-WINDOW.
           DISPLAY 'WINDOW1 clicked end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
