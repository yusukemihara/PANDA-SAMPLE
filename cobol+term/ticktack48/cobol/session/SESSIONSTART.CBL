       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         SESSIONSTART.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       INPUT-OUTPUT         SECTION.
       DATA                DIVISION.
       FILE                SECTION.
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
           DISPLAY  MCP-STATUS
           DISPLAY  HTTP-METHOD
           EVALUATE    HTTP-METHOD 
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     ANY
               PERFORM 020-ERROR
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           MOVE LOW-VALUE TO BODY.
           IF USER = 'sample' AND PASSWORD = 'sample'
             DISPLAY 'auth ok'
             MOVE 200 TO HTTP-STATUS
           ELSE
             DISPLAY 'auth ng'
             MOVE 403 TO HTTP-STATUS
           END-IF
           DISPLAY 'user:' USER
           DISPLAY 'password:' PASSWORD
           DISPLAY 'session-type:' SESSION-TYPE
           EXIT.
      ************************************************************************
       020-ERROR                SECTION.
           DISPLAY '020-ERROR start' 
           MOVE 400 TO HTTP-STATUS. 
           EXIT.
