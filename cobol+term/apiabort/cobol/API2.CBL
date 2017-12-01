       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         API2.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
       01  RC              PIC 9(5) VALUE 0.
            COPY    "DB-BLOB".
            COPY    "DB-MSG".
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
           CALL    "cobabort"      USING SCR-HTTP-METHOD.
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
           DISPLAY SCR-CONTENT-TYPE

           MOVE 'MSGREAD'        TO MCP-FUNC.
           MOVE 'msg'            TO MCP-TABLE.
           MOVE 'key'            TO MCP-PATHNAME.
           MOVE SCR-CONTENT-TYPE TO DB-MSG-CONTENT-TYPE.
           MOVE SCR-BODY         TO DB-MSG-OBJECT.
           CALL 'MONFUNC'     USING
                MCPAREA
                DB-MSG.
           IF (MCP-RC = ZERO OR 1)
               CONTINUE
           ELSE
               DISPLAY "MSGREAD failure"
               MOVE ZERO TO SCR-BODY
               MOVE 400 TO SCR-HTTP-STATUS
               EXIT
           END-IF.
           DISPLAY 'MSGREAD end' 

           DISPLAY SCR-CONTENT-TYPE

           MOVE 'MSGWRITE' TO  MCP-FUNC
      *    MOVE SCR-CONTENT-TYPE TO DB-MSG-CONTENT-TYPE
           CALL 'MONFUNC'      USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO OR 1)
               MOVE DB-MSG-OBJECT TO SCR-BODY
               CONTINUE
           ELSE
               DISPLAY "msgwrite failure"
               MOVE ZERO TO SCR-BODY
               MOVE 400 TO SCR-HTTP-STATUS
               EXIT
           END-IF.
           MOVE ZERO TO MCP-RC
           EXIT.
