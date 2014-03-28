       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         WINDOW1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       WORKING-STORAGE         SECTION.
            COPY    "DB-WORK".
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
           EVALUATE MCP-STATUS ALSO MCP-WIDGET
             WHEN 'LINK' ALSO ANY
               PERFORM 100-INIT
             WHEN 'PUTG' ALSO 'button1'
               PERFORM  700-UPLOAD
             WHEN 'PUTG' ALSO 'button3'
               PERFORM  800-EXPORT
           END-EVALUATE.
           EXIT    PROGRAM.
      *
      ************************************************************************
       100-INIT                SECTION.
           DISPLAY 'init'
           INITIALIZE SCRAREA.
           INITIALIZE SPAAREA.
           MOVE   'window1' TO  MCP-WINDOW.
           MOVE LOW-VALUE TO OBJECTDATA OF FCB1.
           MOVE LOW-VALUE TO OBJECTDATA OF PIXMAP1.
           DISPLAY 'init end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       700-UPLOAD             SECTION.
           DISPLAY 'event'.
           DISPLAY 'FILENAME:' FILENAME.
           DISPLAY 'OBJ FCB1:' OBJECTDATA OF FCB1.
           DISPLAY 'OBJ PIXMAP1:' OBJECTDATA OF PIXMAP1.

           IF OBJECTDATA OF FCB1 NOT = LOW-VALUE
             DISPLAY 'LOAD PIXMAP1 from FCB1'

             MOVE   OBJECTDATA OF FCB1
                                 TO  DB-WORK-OBJECT
             MOVE   'BLOBEXPORT' TO  MCP-FUNC
             MOVE   'work'       TO  MCP-TABLE
             MOVE   'key'        TO  MCP-PATHNAME
             STRING './cobol/' MCP-TERM '.dat' 
               DELIMITED BY SPACE
               INTO DB-WORK-FILE
             CALL   'MONFUNC'     USING
                  MCPAREA
                  DB-WORK

             MOVE   'BLOBIMPORT' TO  MCP-FUNC
             MOVE   'work'       TO  MCP-TABLE
             MOVE   'key'        TO  MCP-PATHNAME
             CALL   'MONFUNC'     USING
                  MCPAREA
                  DB-WORK

             MOVE DB-WORK-OBJECT TO OBJECTDATA OF PIXMAP1 
             MOVE DB-WORK-FILE TO  SPA-TMPFILE

           ELSE
             MOVE LOW-VALUE TO OBJECTDATA OF PIXMAP1
             DISPLAY 'SET LOW-VALUE TO PIXMAP1'
             INITIALIZE SPAAREA
           END-IF.

           MOVE LOW-VALUE TO OBJECTDATA OF FCB1.

           MOVE   'window1' TO  MCP-WINDOW.
           DISPLAY 'event end'
           PERFORM 900-PUT-WINDOW.
           EXIT.
      ************************************************************************
       800-EXPORT             SECTION.
           IF SPA-TMPFILE = SPACE
             MOVE LOW-VALUE TO OBJECTDATA OF PIXMAP1
           ELSE
             MOVE   SPA-TMPFILE TO  DB-WORK-FILE
             MOVE   'BLOBIMPORT' TO  MCP-FUNC
             MOVE   'work'       TO  MCP-TABLE
             MOVE   'key'        TO  MCP-PATHNAME
             CALL   'MONFUNC'     USING
                  MCPAREA
                  DB-WORK

             MOVE   'BLOBEXPORT' TO  MCP-FUNC
             MOVE   'work'       TO  MCP-TABLE
             MOVE   'key'        TO  MCP-PATHNAME
             MOVE   './cobol/export.dat' TO DB-WORK-FILE
             CALL   'MONFUNC'     USING
                  MCPAREA
                  DB-WORK

             MOVE DB-WORK-OBJECT TO OBJECTDATA OF PIXMAP1 
             INITIALIZE SPA-TMPFILE
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
