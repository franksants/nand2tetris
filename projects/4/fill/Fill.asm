// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(PROGRAM)
  
  @24576
  D=M
  @BLINK
  D;JGT

  @CLEAR
  D;JEQ

  @PROGRAM
  0;JMP

(CLEAR)
  @COUNTER
  M=0
(WHITE_LOOP)

  @COUNTER
  D=M
  
  @SCREEN
  D=A+D
  A=D
  M=0

  @COUNTER
  M=M+1
  D=M

  @8192
  D=A-D

  @WHITE_LOOP
  D;JGT

  @PROGRAM
  0;JMP

(BLINK)
  @COUNTER
  M=0
(BLACK_LOOP)
  @COUNTER
  D=M
  @SCREEN
  D=A+D
  A=D
  M=-1

  @COUNTER
  M=M+1
  D=M


  @8192
  D=A-D
  @BLACK_LOOP
  D;JGT
 
     
  @PROGRAM
  0;JMP
