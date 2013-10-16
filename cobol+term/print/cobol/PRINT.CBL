       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         PRINT.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       INPUT-OUTPUT         SECTION.
       DATA                DIVISION.
       FILE                SECTION.
       WORKING-STORAGE     SECTION.
            01  IMPORTPATH.
              02 IMPORTDIR PIC X(7).
              02 IMPORTFILE PIC X(8).
            COPY    "DB-PATH".
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
           DISPLAY  METHODTYPE
           EVALUATE    METHODTYPE 
             WHEN     'GET'
     *         PERFORM 010-GET
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           DISPLAY 'filename:' FILENAME

           MOVE   'BLOBLOOKUP' TO  MCP-FUNC.
           MOVE   'work'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   FILENAME     TO  DB-WORK-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-WORK.
           IF DB-WORK-OBJECT = LOW-VALUE
           THEN
             MOVE   'BLOBIMPORT' TO  MCP-FUNC
             MOVE   "./data/"    TO IMPORTDIR
             MOVE   FILENAME     TO IMPORTFILE
             MOVE   IMPORTPATH   TO DB-WORK-FILE
           DISPLAY 'importpath:' IMPORTPATH
             CALL   'MONFUNC'     USING
                  MCPAREA
                  DB-WORK
             MOVE   'BLOBREGISTER' TO  MCP-FUNC
             MOVE   FILENAME       TO  DB-WORK-FILE
             CALL   'MONFUNC'     USING
                  MCPAREA
                  DB-WORK
           END-IF.
           MOVE DB-WORK-OBJECT TO BODY.
           DISPLAY 'body:' DB-WORK-OBJECT
           EXIT.
