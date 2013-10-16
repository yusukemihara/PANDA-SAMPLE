      * 日本語いーゆーしーじぇぴー
       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         LABELTEST.
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
           DISPLAY 'label init'
           INITIALIZE SCRAREA.
           MOVE   'labeltest' TO  MCP-WINDOW.
           MOVE   '初<span color="red"  > あお</span>最' TO LTEXT.
           DISPLAY 'label init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'label event'.
           MOVE   ETEXT TO LTEXT.
           MOVE   'blue-rev' TO STYLE.
           MOVE   'labeltest' TO  MCP-WINDOW.
           DISPLAY 'label event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
