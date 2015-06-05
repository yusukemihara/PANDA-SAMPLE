       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         JSONIO.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
            COPY    "DB-BLOB".
            COPY    "DB-JSON".
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
           DISPLAY  SCR-HTTP-METHOD
           EVALUATE    SCR-HTTP-METHOD
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     'POST'
               PERFORM 020-POST
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           MOVE 404 TO SCR-HTTP-STATUS.
           EXIT.

      ************************************************************************
       020-POST               SECTION.
           DISPLAY '020-POST start' 
           DISPLAY SCR-BODY

           MOVE   'JSON2READ' TO  MCP-FUNC.
           MOVE   'json'      TO  MCP-TABLE.
           MOVE   'key'       TO  MCP-PATHNAME.
           MOVE   SCR-BODY    TO  DB-JSON-OBJECT.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-JSON.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "JSON2READ failure"
           END-IF.
           DISPLAY 'JSON2READ end' 

           MOVE 'JSONIO WRITE' TO DB-JSON-MSG.
           MOVE 'DB-JSON-RA1C3' TO DB-JSON-RA1C3(3).
           MOVE 'DB-JSON-RA2C2' TO DB-JSON-RA2C2(2,2).

           MOVE   'JSON2WRITE' TO  MCP-FUNC.
           MOVE   'json'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   SCR-BODY     TO  DB-JSON-OBJECT.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-JSON.
           IF (MCP-RC = ZERO OR 1)
               MOVE DB-JSON-OBJECT TO SCR-BODY
               MOVE 200 TO SCR-HTTP-STATUS
               CONTINUE
           ELSE
               DISPLAY "JSON2WRITE failure"
               MOVE LOW-VALUE TO SCR-BODY
               MOVE 500 TO SCR-HTTP-STATUS
           END-IF.
           DISPLAY 'JSON2WRITE end' 
           EXIT.
