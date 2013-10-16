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
           MOVE LOW-VALUE TO OBJECTDATA OF FCB1.
           MOVE LOW-VALUE TO OBJECTDATA OF PIXMAP1.
           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-EVENT             SECTION.
           DISPLAY 'event'.
           DISPLAY 'FILENAME:' FILENAME.
           DISPLAY 'OBJ FCB1:' OBJECTDATA OF FCB1.
           DISPLAY 'OBJ PIXMAP1:' OBJECTDATA OF PIXMAP1.

           IF OBJECTDATA OF FCB1 NOT = LOW-VALUE
             MOVE OBJECTDATA OF FCB1 TO OBJECTDATA OF PIXMAP1 
             DISPLAY 'LOAD PIXMAP1 from FCB1'
           ELSE
             MOVE LOW-VALUE TO OBJECTDATA OF PIXMAP1
             DISPLAY 'SET LOW-VALUE TO PIXMAP1'
           END-IF.
           MOVE LOW-VALUE TO OBJECTDATA OF FCB1.

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
