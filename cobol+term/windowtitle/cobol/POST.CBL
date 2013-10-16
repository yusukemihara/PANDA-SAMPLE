       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         POST.
       ENVIRONMENT         DIVISION.
       CONFIGURATION           SECTION.
       DATA                DIVISION.
       LINKAGE                 SECTION.
            COPY    "MCPAREA".
            COPY    "SPAAREA".
            COPY    "LINKAREA".
            COPY    "SCRAREA".
      **************************************************************************
       PROCEDURE           DIVISION    USING
           MCPAREA
           SPAAREA
           LINKAREA
           SCRAREA.
       000-MAIN                SECTION.
           MOVE    METHODTYPE      IN POST  TO  RESMETHOD.
           MOVE    CONTENT-TYPE    IN POST  TO  RESCTYPE.
           MOVE    CONTENT-LENGTH  IN POST  TO  RESCLENGTH.
           MOVE    BODY            IN POST  TO  RESBODY.
           EXIT    PROGRAM.
