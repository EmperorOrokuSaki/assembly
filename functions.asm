; calculates the length of a string
slen:
  push ebx ; save the ebx pointer in the stack
  mov ebx, eax ; copy the content from eax to ebx

nextchar:
  cmp byte [eax], 0 ; check if the current byte is the null terminator
  jz finished ; jump to finished, if byte [eax] was the null terminator
  inc eax ; increase eax by one, if the condition wasn't met
  jmp nextchar ; loop

finished:
  sub eax, ebx ; subtract ebx from eax and assign it to eax
  pop ebx ; pop the value at the top of the stack to ebx
  ret ; return

; prints a string
sprint:
  push edx
  push ecx
  push ebx
  push eax
  call slen

  mov edx, eax ; assign the string length to edx
  pop eax

  mov ecx, eax ; load the message from eax
  mov ebx, 1 ; stdout file output
  mov eax, 4 ; write syscall
  int 80h ; software interrupt

  pop ebx
  pop ecx
  pop edx
  ret

; prints a string with line feed appendix
sprintlf:
  call sprint

  push eax     ; preserve the eax pointer in the stack.
               ; little-endian representation here

  mov eax, 0Ah ; assign the null terminator to eax.
               ; because eax is four bytes and little-endian, the content is:
               ; 0A 00 00 00
  
  push eax     ; push 0A 00 00 00 to the stack

  mov eax, esp ; assign the pointer to 0A (esp is the top of the stack) to eax
  call sprint  ; print the line feed character
  pop eax      ; remove the line feed character from the stack
  pop eax      ; retrieve the original eax value
  ret

; Gracefully exit the program
quit:
  mov ebx, 0 ; no errors arg
  mov eax, 1 ; exit syscall
  int 80h ; software interrupt
  ret
