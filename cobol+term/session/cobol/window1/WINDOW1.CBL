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
      ************************************************************************
       PROCEDURE           DIVISION    USING
           MCPAREA
           SPAAREA
           LINKAREA.
       000-MAIN                SECTION.
           EVALUATE    MCP-STATUS      ALSO    MCP-EVENT
             WHEN      'LINK'          ALSO    ANY
               PERFORM  100-INIT
             WHEN      ANY             ALSO    'CLICKED'
               PERFORM  700-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'TICK'
           MOVE   SPACE      TO  MCP-PUTTYPE.
           MOVE   'window1'     TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      ************************************************************************
       700-CLICKED             SECTION.
           MOVE   'CHANGE'        TO  MCP-PUTTYPE.
           MOVE   'window1'          TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      ************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
