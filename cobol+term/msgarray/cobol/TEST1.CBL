       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
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
           EVALUATE    SCR-HTTP-METHOD 
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     'POST'
               PERFORM 020-POST
           END-EVALUATE
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           MOVE 404 TO SCR-HTTP-STATUS.
           EXIT.

      ************************************************************************
       020-POST               SECTION.
           DISPLAY '020-POST start' 

           MOVE 500 TO SCR-HTTP-STATUS

           DISPLAY 'msgyopen'
           DISPLAY SCR-BODY
           MOVE 'MSGOPEN' TO MCP-FUNC
           MOVE 'msg1'    TO MCP-TABLE
           MOVE 0         TO DB-MSG-MODE
           MOVE SCR-BODY  TO DB-MSG-OBJECT
           CALL 'MONFUNC' USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           PERFORM WITH TEST AFTER UNTIL (MCP-RC NOT = ZERO)
               DISPLAY 'msgread'
               MOVE 'MSGREAD'  TO MCP-FUNC
               CALL 'MONFUNC' USING
                    MCPAREA
                    DB-MSG
               IF (MCP-RC = ZERO)
                   DISPLAY '----'
                   DISPLAY DB-MSG-DATA
               END-IF
           END-PERFORM

           DISPLAY 'msgclose'
           MOVE 'MSGCLOSE' TO MCP-FUNC
           CALL 'MONFUNC'  USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
           END-IF

           MOVE ZERO TO SCR-BODY
           MOVE 200 TO SCR-HTTP-STATUS
           MOVE ZERO TO MCP-RC

           EXIT.
