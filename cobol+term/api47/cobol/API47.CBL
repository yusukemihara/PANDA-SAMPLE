       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         API47.
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
           DISPLAY  METHODTYPE
           EVALUATE    METHODTYPE 
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     ANY
               PERFORM 020-ERROR
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           DISPLAY 'reqstatus:' REQSTATUS.
           MOVE LOW-VALUE TO BODY.
           MOVE REQSTATUS TO HTTPSTATUS. 
           DISPLAY 'httpstatus:' HTTPSTATUS.
           EXIT.
      ************************************************************************
       020-ERROR                SECTION.
           DISPLAY '020-ERROR start' 
           MOVE 400 TO HTTPSTATUS. 
           EXIT.
