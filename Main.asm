include 'win32ax.inc'

.data
 title db 'Number of Woodall numbers not exceeding the length of the unsigned dd', 0
 output dd '' , 0
 formatstring db "%d"


.code

  start:
    mov ebx, 0
    loop_outer:  
      inc ebx
      mov eax, 2
  
      mov ecx, 0
      inner_loop:
        imul eax, 2   ; finding 2^n
  
        inc ecx       ; Increment
        cmp ecx, ebx  ; Compare cx to the limit
        jle inner_loop; Loop while less or equal
  
      imul eax, ebx   ; finding n * 2^n    
      dec eax         ; finding n * 2^n - 1
  
  ;mov [woodall], eax

      jno loop_outer  ; loop while not overflow

      dec ebx
  
      invoke wsprintf , output , formatstring , ebx
      invoke MessageBox , 0 , output , title , MB_OK
  
            invoke  ExitProcess , 0

.end start




