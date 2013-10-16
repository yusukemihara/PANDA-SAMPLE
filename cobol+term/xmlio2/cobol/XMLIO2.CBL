       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         XMLIO2.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
       01  RC              PIC 9(5) VALUE 0.
       01  IN-CONTEXT      PIC 9(5) VALUE 0.
       01  OUT-CONTEXT     PIC 9(5) VALUE 0.
            COPY    "DB-BLOB".
            COPY    "DB-XML2".
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
           DISPLAY  SCR-METHODTYPE
           EVALUATE    SCR-METHODTYPE 
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     'POST'
               PERFORM 020-POST
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           MOVE 404 TO SCR-HTTPSTATUS.
           EXIT.

      ************************************************************************
       020-POST               SECTION.
           DISPLAY '020-POST start' 
           DISPLAY SCR-BODY

           MOVE   'XMLOPEN' TO  MCP-FUNC.
           MOVE   'xml2'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   SCR-BODY   TO  DB-XML2-OBJECT.
           MOVE   0          TO  DB-XML2-MODE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML2.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "XMLOPEN failure"
           END-IF.
           MOVE DB-XML2-CONTEXT TO IN-CONTEXT.
           DISPLAY 'input XMLOPEN end' 

           MOVE   'XMLOPEN' TO  MCP-FUNC.
           MOVE   'xml2'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   1          TO  DB-XML2-MODE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML2.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "XMLOPEN failure"
           END-IF.
           MOVE DB-XML2-CONTEXT TO OUT-CONTEXT.
           DISPLAY 'output XMLOPEN end' 
           DISPLAY DB-XML2-OBJECT

           PERFORM WITH TEST AFTER UNTIL (RC NOT = ZERO)
               DISPLAY 'xml read' 
               MOVE   'XMLREAD' TO  MCP-FUNC
               MOVE   IN-CONTEXT TO DB-XML2-CONTEXT
               CALL   'MONFUNC'     USING
                    MCPAREA
                    DB-XML2
               MOVE MCP-RC TO RC
               IF (RC = ZERO)
                   CONTINUE
               ELSE
                   GO TO LOOPEND
               END-IF
               DISPLAY 'recordname:' DB-XML2-RECORDNAME
               DISPLAY 'xml readend' 

               DISPLAY 'xml write' 
               MOVE   'XMLWRITE' TO  MCP-FUNC
               MOVE   OUT-CONTEXT TO DB-XML2-CONTEXT
               CALL   'MONFUNC'     USING
                    MCPAREA
                    DB-XML2
               MOVE MCP-RC TO RC
               IF (RC = ZERO)
                   CONTINUE
               ELSE
                   GO TO LOOPEND
               END-IF

               DISPLAY 'xml writeend' 
           END-PERFORM.
       LOOPEND.

           MOVE   'XMLCLOSE' TO  MCP-FUNC
           MOVE   IN-CONTEXT TO DB-XML2-CONTEXT
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML2.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'XMLCLOSE end' 
               CONTINUE
           ELSE
               DISPLAY "XMLCLOSE failure"
           END-IF.

           MOVE   'XMLCLOSE' TO  MCP-FUNC
           MOVE   OUT-CONTEXT TO DB-XML2-CONTEXT
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML2.
           IF (MCP-RC = ZERO OR 1)
               DISPLAY 'XMLCLOSE end' 
               CONTINUE
           ELSE
               DISPLAY "XMLCLOSE failure"
           END-IF.

           MOVE  DB-XML2-OBJECT TO SCR-BODY
           DISPLAY DB-XML2-OBJECT
           DISPLAY SCR-BODY

           EXIT.
