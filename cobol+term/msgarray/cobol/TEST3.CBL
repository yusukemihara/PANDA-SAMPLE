       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST3.
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
           DISPLAY  SCR-HTTP-METHOD3
           EVALUATE    SCR-HTTP-METHOD3
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     'POST'
               PERFORM 020-POST
           END-EVALUATE
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           MOVE 404 TO SCR-HTTP-STATUS3.
           EXIT.

      ************************************************************************
       020-POST               SECTION.
           DISPLAY '020-POST start' 

           MOVE 500 TO SCR-HTTP-STATUS3

           DISPLAY 'msgopen(read)'
           DISPLAY SCR-BODY3
           MOVE 'MSGOPEN' TO MCP-FUNC
           MOVE 'msg1'    TO MCP-TABLE
           MOVE 0         TO DB-MSG-MODE
           MOVE SCR-BODY3 TO DB-MSG-OBJECT
           CALL 'MONFUNC' USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           DISPLAY 'msgread'
           MOVE 'MSGREAD'  TO MCP-FUNC
           CALL 'MONFUNC' USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '----'
               DISPLAY DB-MSG-DATA
           END-IF

           DISPLAY 'msgclose(read)'
           MOVE 'MSGCLOSE' TO MCP-FUNC
           CALL 'MONFUNC'  USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
           END-IF

           DISPLAY 'msgopen(write)'
           MOVE 'MSGOPEN' TO MCP-FUNC
           MOVE 'msg1'    TO MCP-TABLE
           MOVE 1         TO DB-MSG-MODE
           CALL 'MONFUNC' USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           DISPLAY 'msgwrite'
           MOVE 'MSGWRITE' TO MCP-FUNC
           MOVE 'msg1'     TO MCP-TABLE
           CALL 'MONFUNC' USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           DISPLAY 'msgunescape'
           MOVE 'MSGUNESCAPE' TO MCP-FUNC
           MOVE 'msg1'        TO MCP-TABLE
           CALL 'MONFUNC'     USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           DISPLAY 'msgclose(write)'
           MOVE 'MSGCLOSE' TO MCP-FUNC
           CALL 'MONFUNC'  USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
               MOVE DB-MSG-OBJECT TO SCR-BODY3
           ELSE
               DISPLAY '...ng'
               MOVE ZERO TO SCR-BODY3
           END-IF

           MOVE 200 TO SCR-HTTP-STATUS3
           MOVE ZERO TO MCP-RC

           EXIT.
