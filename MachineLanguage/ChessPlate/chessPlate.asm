@SCREEN
D=A
@R14
M=D

@0
D=A
@R15
M=D

@0
D=A
@R10
M=D

(OUTER_BLOCKROW)
  @R15
  D=M
  @16
  D=D-A
  @DONE_DRAW
  D;JGE

  @R14
  D=M
  @R13
  M=D

  @0
  D=A
  @R11
  M=D

(ROW_LOOP)
  @R11
  D=M
  @16
  D=D-A
  @END_OF_BLOCK_ROWS
  D;JGE

  @R10
  D=M
  @R9
  M=D

  @0
  D=A
  @R12
  M=D

(COL_LOOP)
  @R12
  D=M
  @32
  D=D-A
  @END_COLS
  D;JGE

  @R9
  D=M
  @WRITE_ZERO
  D;JNE

  @R13
  A=M
  M=-1
  @AFTER_WRITE
  0;JMP

(WRITE_ZERO)
  @R13
  A=M
  M=0

(AFTER_WRITE)
  @R13
  M=M+1

  @1
  D=A
  @R9
  D=D-M
  @R9
  M=D

  @R12
  M=M+1
  @COL_LOOP
  0;JMP

(END_COLS)
  @R11
  M=M+1
  @ROW_LOOP
  0;JMP

(END_OF_BLOCK_ROWS)
  @R13
  D=M
  @R14
  M=D

  @R15
  M=M+1

  @1
  D=A
  @R10
  D=D-M
  @R10
  M=D

  @OUTER_BLOCKROW
  0;JMP

(DONE_DRAW)

(LOOP_WAIT_KEY)
  @KBD
  D=M
  @NO_KEY
  D;JEQ
  @INVERT_SCREEN
  0;JMP

(NO_KEY)
  @LOOP_WAIT_KEY
  0;JMP

(INVERT_SCREEN)
  @KBD
  D=M
  @WAIT_RELEASE
  D;JEQ
(WAIT_KEY_RELEASE_LOOP)
  @KBD
  D=M
  @WAIT_KEY_RELEASE_LOOP
  D;JNE

  @SCREEN
  D=A
  @R13
  M=D

(INVERT_LOOP)
  @R13
  D=M
  @24576
  D=D-A
  @END_INVERT
  D;JGE

  @R13
  A=M
  D=M
  D=!D
  @R13
  A=M
  M=D

  @R13
  M=M+1
  @INVERT_LOOP
  0;JMP

(END_INVERT)
  @LOOP_WAIT_KEY
  0;JMP
