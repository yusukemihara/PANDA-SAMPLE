      * 日本語いーゆーしーじぇぴー
       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOWCOLOR.
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
           EVALUATE    MCP-STATUS ALSO MCP-EVENT 
             WHEN      'LINK' ALSO ANY
               PERFORM  100-INIT
             WHEN      ANY  ALSO 'ACTIVATE'
               PERFORM  700-EVENT
             WHEN      ANY  ALSO 'CLICKED'
               PERFORM  800-EVENT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'label init'
           INITIALIZE SCRAREA.
           MOVE   'windowcolor' TO  MCP-WINDOW.
           MOVE   'CURRENT'        TO  MCP-PUTTYPE
           DISPLAY 'label init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'label event'.
           MOVE COLOR TO BGCOLOR.
           MOVE   'windowcolor' TO  MCP-WINDOW.
           MOVE   'CURRENT'        TO  MCP-PUTTYPE
           DISPLAY 'label event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       800-EVENT             SECTION.
           DISPLAY 'label event'.
           MOVE   'dialog' TO  MCP-WINDOW.
           MOVE   'NEW'        TO  MCP-PUTTYPE
           DISPLAY 'label event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
           EXIT.
