       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST2.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
       01  L               PIC 9(01) VALUE 0.
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
           DISPLAY  SCR-HTTP-METHOD2
           EVALUATE    SCR-HTTP-METHOD2
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     'POST'
               PERFORM 020-POST
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       020-POST                SECTION.
           DISPLAY '020-POST start' 
           MOVE 404 TO SCR-HTTP-STATUS2.
           EXIT.

      ************************************************************************
       010-GET               SECTION.
           DISPLAY '010-GET start' 

           MOVE 500 TO SCR-HTTP-STATUS2
           MOVE ZERO TO SCR-BODY2

           DISPLAY 'msgopen'
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

           PERFORM VARYING L FROM 1 BY 1 UNTIL L > 5
               DISPLAY ' '
               DISPLAY 'msgwrite ' L
               MOVE 'DB-MSG-C1'     TO DB-MSG-C1
               MOVE L               TO DB-MSG-I1
               MOVE L               TO DB-MSG-N1
               MOVE 'T'             TO DB-MSG-B1
               MOVE L               TO DB-MSG-A1(1)
               MOVE L               TO DB-MSG-A1(2)
               MOVE L               TO DB-MSG-A1(3)
               MOVE 'DB-MSG-R1C1'   TO DB-MSG-R1C1(1)
               MOVE 'DB-MSG-R1C1'   TO DB-MSG-R1C1(2)
               MOVE 'DB-MSG-R1C1'   TO DB-MSG-R1C1(3)
               MOVE 'DB-MSG-R2C1'   TO DB-MSG-R2C1(1)
               MOVE 'DB-MSG-R2C1'   TO DB-MSG-R2C1(2)
               MOVE 'DB-MSG-R2C1'   TO DB-MSG-R2C1(3)

               MOVE 'MSGWRITE' TO MCP-FUNC
               CALL 'MONFUNC'  USING
                    MCPAREA
                    DB-MSG
               IF (MCP-RC = ZERO)
                   DISPLAY '...ok'
               ELSE
                   DISPLAY '...ng'
                   GO TO LOOPEND
               END-IF
           END-PERFORM.
       LOOPEND.

           DISPLAY ' '
           DISPLAY 'msgclose'
           MOVE 'MSGCLOSE' TO MCP-FUNC
           CALL 'MONFUNC'  USING
                MCPAREA
                DB-MSG
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
               MOVE DB-MSG-OBJECT TO SCR-BODY2
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           MOVE 200 TO SCR-HTTP-STATUS2
           MOVE ZERO TO MCP-RC

           EXIT.
