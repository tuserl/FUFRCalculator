.model small
.stack 100h   
.data  
    textfptedu db " ______ _____ _______            _                 _   _             ", 13, 10
     db "|  ____|  __ \__   __|          | |               | | (_)            ", 13, 10
     db "| |__  | |__) | | |      ___  __| |_   _  ___ __ _| |_ _  ___  _ __  ", 13, 10
     db "|  __| |  ___/  | |     / _ \/ _` | | | |/ __/ _` | __| |/ _ \| '_ \ ", 13, 10
     db "| |    | |      | |    |  __/ (_| | |_| | (_| (_| | |_| | (_) | | | |", 13, 10
     db "|_|    |_|      |_|     \___|\__,_|\__,_|\___\__,_|\__|_|\___/|_| |_|", 13, 10, "$"
    
    linea db "Nhap a: $"
    lineb db 0Dh,0Ah,"Nhap b: $"  
    linekq db 0Dh,0Ah,"KQ: $"   
    
     linekqsum db 0Dh,0Ah,"tong (sum):         $"   
     linekqsub db 0Dh,0Ah,"hieu (difference):  $"   
     linekqmul db 0Dh,0Ah,"tich (dot product): $"   
     linekqdiv db 0Dh,0Ah,"thuong (quotient):  $"   
    
    linee db 0Dh,0AH,24h   
    lineina db 0Dh,0Ah,"a[$"   
    lineina1 db "] = $"   
    count dw 0
    a dw  10 dup(0) 
    len dw 10     
    
    num1 dw 0
    num2 dw 0  
    num3 dw 0    
    ;-----modules' var------
    num0 dw 0    
    seen_decimal db 0
    divisor dw 1    
    fixed_val dw 1234; Represents 12.34 
    decimal_places equ 100; scaled by 100 const var not editable   
    tong dw 0
    hieu dw 0 
    tich dw 0
    thuong dw 0
    ;-------------------------  
    
    ;-------------------------------STUDENT-------------
    student_count dw 0   ; Number of students 
    name_max_length db 23

    ; Array of 3 strings (each 12 bytes: max_len + cur_len + 10 chars) 
    ;| Max Length (1B) | Current Length (1B) | Name (N Bytes) N DUP('$') |    
    students DB 30 DUP(30, 0, '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$', '$')              
    ;students DB 30 DUP(20, 0, 20 DUP('$'))
    
    ;students DB 20, 0, 20 DUP('$')  ;line student testx016
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')  ;line student testx016
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')  ;line student testx016
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    ;         DB 20, 0, 20 DUP('$') 
    ;         DB 20, 0, 20 DUP('$')   
    
    
    students_pt1_score dw  30 dup(0)   
    students_pt2_score dw  30 dup(0)   
    students_pt3_score dw  30 dup(0)
    
    students_lab1_score dw  30 dup(0)
    students_lab2_score dw  30 dup(0)  
    
    students_pres1_score dw  30 dup(0)
    students_pres2_score dw  30 dup(0)
    
    students_fe_score dw  30 dup(0)
    students_fr_score dw  30 dup(0)
           
   
    ;students DB 30 DUP(20, 0, 20 DUP('$'))  ; 30 students, each 22 bytes //line student testx015

    ;30 DUP(...) Creates 30 student entries.
    students_indexinc dw 32 ;21 will work not 22 I dont know why 22( set it to 22 only works if i use  //line student testx016 and remove //line student testx015)

   
    score  dw 30 dup(0)  ;khai bao bien mang 

    students_index dw 0 
    pt1_index dw 0   
    students_global_index dw 0      
    
    linetest db 0Dh,0Ah,"N: $"   
    lineborderline db 0Dh,0Ah,"-------------------------------------------------------------------------$"
    line_student_index db 0Dh,0Ah,"Sinh Vien Thu $" 
    line_student_colon db ": $"      
    line_student_name db 0Dh,0Ah,"Vui Long Nhap Ten: $" 
    line_student_pt1 db 0Dh,0Ah,"Vui Long Nhap Diem PT1: $"    
    line_student_pt2 db 0Dh,0Ah,"Vui Long Nhap Diem PT2: $" 
    line_student_pt3 db 0Dh,0Ah,"Vui Long Nhap Diem PT3: $"   
    line_student_lab1 db 0Dh,0Ah,"Vui Long Nhap Diem Lab1: $"    
    line_student_lab2 db 0Dh,0Ah,"Vui Long Nhap Diem Lab2: $" 
    line_student_pres1 db 0Dh,0Ah,"Vui Long Nhap Diem Pres1: $"  
    line_student_pres2 db 0Dh,0Ah,"Vui Long Nhap Diem Pres2: $"  
    line_student_fe db 0Dh,0Ah,"Vui Long Nhap Diem FE: $"  
    line_student_n db 0Dh,0Ah,"Vui Long Nhap So Luong Sinh Vien: $"  
    line_bar db "=========================================================================",0Dh,0Ah,24h 
    line_barspace db "                          $" 
    line_bartitle db "STUDENT RESULTS$"           
    line_barname DB 0DH, 0AH, "Full Name$"              ;
   ; line_barscore DB "     PT1  PT2  PT3  Lab1 Lab2 Pres1 Pres2  FE   FR", 0DH, 0AH, "$"
    line_barscore DB "               PT1  PT2  PT3  Lab1 Lab2 Pres1 Pres2  FE   FR$";, 0DH, 0AH, "$"

    
    ;--moldule student--
    s_pt1 dw 0
    s_pt2 dw 0
    s_pt3 dw 0
    s_ptR dw 0
    
    s_lab1 dw 0
    s_lab2 dw 0
    s_labR dw 0
    
    s_pres1 dw 0
    s_pres2 dw 0
    s_presR dw 0
    
    s_fe dw 0  
    s_feR dw 0
    s_fr dw 0
    
    ;---------------------------END STUDENT-----------  
    
    char_count db 0  ; Stores the number of printed characters   
    colorc db 0111b ; usually bl   
    default_text_color db 0111b;
    
.code     

;----------------Main---------------------------
main proc
    mov ax,@data
    mov ds,ax        
    
    ;----------------begin----------------  
    
    ; Set text mode (80x25)
    mov ax, 03h
    int 10h

    call welcomescreen
 
    ; Wait for key press
    mov ah, 00h
    int 16h  
    
    call program_setN  
    call program5       
    
    ;-----------------end----------------    
          
    mov ah,4Ch       
    int 21h
main endp

program_setN proc
    lea dx,line_student_n 
    call printf
    call scanf_int
    mov student_count,ax 
    ret
program_setN endp

program1 proc    
    lea dx,linea       
    call printf    
            
    call scanf_int 
    mov num1,ax        
                
    lea dx,lineb
    call printf
    
    call scanf_int   
    mov num2,ax     
     
    mov ax,num1
    mul num2 
     
    lea dx,linekq
    call printf   
    call printf_int  
    
    mov ax,num1 
    xor dx,dx
    div num2   
    mov num0,dx
      
    lea dx,linekq
    call printf  
    call printf_int  
    
    lea dx,linekq
    call printf    
    mov ax,num0
    call printf_int      
    ret
program1 endp

program2 proc
    ;------Input-----------
    xor si,si
    mov cx,len
    nhapmang:
        lea dx, lineina
        call printf    
       
        mov dx,count  
        add dx,30h
        call printf_c
        
        lea dx, lineina1
        call printf    
        
        call scanf_int
        mov a[si],ax
        
        inc count   
        add si,2
    loop nhapmang
    ;-------View------------
    mov cx,len      
    xor si,si  
    call printf_endl
    viewmang: 
          
        mov ax,a[Si]         
        call printf_int
        
        mov dl,','
        call printf_c  
        
        add si,2         
    loop viewmang  
    ;--------TIM MAX----------
    mov cx,len
    xor si,si
    mov ax,a[si]  
    timmax:     
           cmp ax,a[si]
           jnb next  
           mov ax,a[si] 
           next:          
           add si,2
    loop timmax
  
    call printf_endl
    call printf_int
    ret    
program2 endp  

program3 proc
    lea dx,linea
    call printf
    
    call scanf_float
    mov num1,ax   
    
    lea dx,lineb
    call printf  
    
    call scanf_float
    mov num2,ax   
     
    lea dx,linekqsum 
    call printf  
    
    mov ax,num1
    add ax,num2           
    mov tong,ax
    call printf_float  
    
    lea dx,linekqsub
    call printf  
    
    mov ax,num1
    sub ax,num2 
    mov hieu,ax
    call printf_float
    
    lea dx,linekqmul 
    call printf  
    
    mov ax,num1 
    mov bx,num2  
    mov tich,ax 
    call mul_float
    
    call printf_float     
    
    lea dx,linekqdiv 
    call printf   
    
    mov ax,num1 
    mov bx,num2    
    call div_float
    mov thuong,ax    
    
    call printf_float
    ret
program3 endp

program4 proc   
    call scanf_float
    mov num1,ax
    call printf_endl
    call scanf_float
    mov num2,ax
    call printf_endl
    call scanf_float
    mov num3,ax   
    call printf_endl   
    mov ax,num1
    add ax,num2
    add ax,num3 
    mov num1,ax 
    mov ax,3  
    call int_to_float   
    mov bx,ax
    mov ax,num1    
    call div_float
    mov bx,30
    call mul_float
    call printf_float
    ret
program4 endp

 
program5 proc
         mov cx,student_count 
         xor si,si         
        
         mov students_global_index,0
         ;call set_student_index
        
         nhapname:                 
                 
                 
                  
                 lea dx,line_student_index
                 call printf  
                 
                
                 
                 mov ax,si
                 add ax,1  
                 
                 call printf_int
                 
                 lea dx,line_student_colon
                 call printf
                 
                 mov students_global_index,si
                 call set_student_index   
                       
                 lea dx,line_student_name
                 call printf
                 
                 call scanf_string   
                 
                 lea dx,line_student_pt1
                 call printf
                 
                 call scanf_float      
                 mov s_pt1,ax      
                 
                 lea dx,line_student_pt2
                 call printf
                 
                 call scanf_float      
                 mov s_pt2,ax      
                 
                 lea dx,line_student_pt3
                 call printf
                 
                 call scanf_float      
                 mov s_pt3,ax    
                 
                 
                 lea dx,line_student_lab1
                 call printf
                 
                 call scanf_float      
                 mov s_lab1,ax      
                 
                 lea dx,line_student_lab2
                 call printf
                 
                 call scanf_float      
                 mov s_lab2,ax 
                 
                 lea dx,line_student_pres1
                 call printf
                 
                 call scanf_float      
                 mov s_pres1,ax  
                 
                 lea dx,line_student_pres2
                 call printf
                 
                 call scanf_float      
                 mov s_pres2,ax   
                 
                 lea dx,line_student_fe
                 call printf
                 
                 call scanf_float      
                 mov s_fe,ax     
                
                
                 call set_student_info_at_index 
  
                 call printf_endl
 
                 call clearscreen    
                 
                 push cx
                 mov cx,1
                 call view_student_table
                 pop cx                   
                 
                 add si,1
                  
         loop nhapname            
         
         ;mov cx,student_count   
         ;xor si,si  
         ;sStudent:
            
         
         ;   loop sStudent
        call clearscreen    
        xor si,si
        mov cx,student_count   
        call view_student_table
                  
    ret
program5 endp   

view_student_table proc
         
         push cx
         push si 

         call printf_header
           
         lea dx,lineborderline 
         call printf 
         
         view_student:            
            
            call printf_endl
            
            mov students_global_index,si    
            call get_student_info_at_index     
            
            
            mov bl, 00000110b  ; Yellow text
            ;mov bl, 00001110b  ; Yellow text               

           ; call print_colored_string   
            
            call printf_cstring
            
            call print_remaining_spaces  ; Fill remaining spaces
            
            mov al, '|'         ; Print separator for visualization
            mov bl, 00001111b   ; White text
            call print_colored_char
     
            
                
           
            ;call printf_tab
            ;call printf_tab
            
            mov ax,s_pt1
            call printf_float  
            mov dl," "
            call printf_c
            ;call printf_endl    
            
            mov ax,s_pt2
             call printf_float  
            mov dl," "
            call printf_c
            ;call printf_endl    
            
            mov ax,s_pt3
             call printf_float  
            mov dl," "
            call printf_c
            ;call printf_endl    
            
            ;(pt1+pt2+pt3)/3*.3
            mov ax,s_pt1
            add ax,s_pt2
            add ax,s_pt3   
            push ax
            mov ax,3
            call int_to_float
            mov bx,ax
            pop ax
            call div_float
            mov bx,30
            call mul_float   
            mov s_ptR, ax      ;
            ;call printf_float --
            ;call printf_endl --
            
            mov ax,s_lab1
             call printf_float  
            mov dl," "
            call printf_c
            ;call printf_endl 
               
            mov ax,s_lab2
            call printf_float  
            mov dl," "
            call printf_c
            ;call printf_endl  
            
            mov ax,s_lab1
            add ax,s_lab2
            push ax
            mov ax,2
            call int_to_float    
            mov bx,ax
            pop ax
            call div_float 
            mov bx,20
            call mul_float
            mov s_labR,ax   ;
            ;call printf_float ;-- 
            ;call printf_endl 
            
            mov ax,s_pres1
             call printf_float  
            mov dl," "
            call printf_c
              mov dl," "
            call printf_c
            ;call printf_endl  
            
            mov ax,s_pres2
            call printf_float  
             mov dl," "
            call printf_c
              mov dl," "
            call printf_c
            ;call printf_endl   
            
            mov ax,s_pres1
            add ax,s_pres2
            push ax
            mov ax,2
            call int_to_float    
            mov bx,ax
            pop ax
            call div_float 
            mov bx,10
            call mul_float
            mov s_presR,ax ;
            ;call printf_float ;-- 
            ;call printf_endl 
             
           
                      
            mov ax,s_fe
             call printf_float  
            mov dl," "
            call printf_c
            ;call printf_endl
            
            mov ax,s_fe  
            mov bx,40
            call mul_float 
            mov s_feR,ax     ; 
            ;call printf_float ;-- 
            ;call printf_endl 
            
            mov ax,s_ptR
            add ax,s_labR
            add ax,s_presR
            add ax,s_feR
            mov s_fr,ax   
            mov colorc, 00001110b 
            ;mov colorc, 00001100b  
                          
            call printf_float    
            
            ;call printf_endl  

            add si,1      
         
         loop view_student   
         
         lea dx,lineborderline 
         call printf     
         
         pop si
         pop cx    
    ret
view_student_table endp
 
 
generate_random_color proc
    ; Save registers
    push ax
    push dx

    ; Generate a random color using system time
    mov ah, 2Ch        ; Get system time
    int 21h            ; CH = hours, CL = minutes, DH = seconds, DL = hundredths

    mov al, dl         ; Use hundredths for randomness
    and al, 00001111b  ; Limit to 16 colors (0-15)

    cmp al, 0          ; Avoid black (0)
    jne skip_black
    mov al, 1          ; If black, set to blue (1)
skip_black: 
    ; Return random color in AL
    pop dx
    pop ax
    ret
generate_random_color endp


generate_random_text_color proc
    ; Save registers
    push ax
    push dx

    ; Generate a random color using system time
    mov ah, 2Ch        ; Get system time
    int 21h            ; CH = hours, CL = minutes, DH = seconds, DL = hundredths

    mov al, dl         ; Use hundredths for randomness
    and al, 00001111b  ; Limit to 16 text colors (0-15)

    cmp al, 0          ; Avoid black (0)
    jne skip_text_black
    mov al, 1          ; If black, set to blue (1)
skip_text_black:

    ; Store the final attribute (Background=0, Text=Random)
    mov bl, al         ; BL = 0000TTTT (Text color only, Background = Black)

    ; Restore registers
    pop dx
    pop ax
    ret
generate_random_text_color endp 

generate_random_rainbow_text_color_bak proc
    ; Save registers
    push ax
    push dx

    ; Generate a random color using system time
    mov ah, 2Ch        ; Get system time
    int 21h            ; CH = hours, CL = minutes, DH = seconds, DL = hundredths

    mov al, dl         ; Use hundredths for randomness
    and al, 00000111b  ; Limit to 0-7
    or al, 00001000b   ; Force bright colors (8-15)

    mov bl, al         ; BL = 0000TTTT (Bright text color only, Background = Black)

    ; Restore registers
    pop dx
    pop ax
    ret
generate_random_rainbow_text_color_bak endp  

generate_random_rainbow_text_color proc
    ; Save registers
    push ax
    push dx

    ; Generate a random number using system time
    mov ah, 2Ch        ; Get system time
    int 21h            ; CH = hours, CL = minutes, DH = seconds, DL = hundredths

    mov al, dl         ; Use hundredths for randomness
    and al, 00001111b  ; Limit range to 0-15 (all colors)

    ; Ensure we exclude dark colors (7 = Light Gray, 8 = Dark Gray)
check_valid_color:
    cmp al, 7          ; Is it Light Gray?
    je regenerate_color
    cmp al, 8          ; Is it Dark Gray?
    je regenerate_color
    jmp valid_color

regenerate_color:
    inc al             ; Increase color value to skip bad ones
    and al, 00001111b  ; Keep it within 0-15 range
    jmp check_valid_color  ; Recheck

valid_color:
    mov bl, al         ; Store valid random color in BL
    and bl, 00001111b  ; Ensure background stays black (0000xxxx)

    ; Restore registers
    pop dx
    pop ax
    ret
generate_random_rainbow_text_color endp



print_random_colored_char proc
    ; Save registers
    push dx
    push bx
    push cx
    push ax

    ; Get current cursor position
    mov ah, 03h        ; BIOS function: Get cursor position
    mov bh, 0          ; Page number
    int 10h            ; Cursor row in DH, column in DL

    ; Generate a random color
    call generate_random_rainbow_text_color  
    ;mov bl,al

    ; Print the character with random color
    mov ah, 09h        ; BIOS function: Write character and attribute
    mov bh, 0          ; Page number
    mov cx, 1          ; Print once
    int 10h            ; Call BIOS

    ; Move cursor to the right
    inc dl             ; Increase column position
    mov ah, 02h        ; BIOS function: Set cursor position
    int 10h            ; Update cursor position

    ; Increment character counter
    inc char_count 

    ; Restore registers
    pop ax
    pop cx
    pop bx
    pop dx

    ret
print_random_colored_char endp


print_colored_char proc
    ; Save registers
    push dx
    push bx
    push cx

    ; Get current cursor position
    mov ah, 03h        ; BIOS function: Get cursor position
    mov bh, 0          ; Page number
    int 10h            ; Cursor row in DH, column in DL

    ; Print the character with color from BL
    mov ah, 09h        ; BIOS function: Write character and attribute
    mov bh, 0          ; Page number
    mov cx, 1          ; Print once
    int 10h            ; Call BIOS

    ; Move cursor to the right
    inc dl             ; Increase column position
    mov ah, 02h        ; BIOS function: Set cursor position
    int 10h            ; Update cursor position

    ; Increment character counter
    ;inc byte [char_count] 
    ;inc byte ptr char_count  
    inc char_count 
     
    ; Restore registers
    pop cx
    pop bx
    pop dx

    ret
print_colored_char endp

print_remaining_spaces proc
    ; Save registers
    push ax
    push cx

    ; Load max width
    mov al, name_max_length         ; Max width
    sub al, char_count  ; Remaining spaces = Max width - Printed chars
    mov cl, al         ; Store in CL

    cmp cl, 0
    jle done           ; If no spaces needed, exit

print_space_loop:
    mov al, ' '        ; Space character
    mov bl, 00001111b  ; White color (change if needed)
    call print_colored_char  ; Print space

    loop print_space_loop   ; Repeat for remaining spaces

done:
    pop cx
    pop ax
    ret
print_remaining_spaces endp



print_colored_string proc
    ; Save registers
    push si
    mov char_count,0
    mov si, dx  ; Load string address

next_char:
    mov al, [si]     ; Load character
    cmp al, '$'      ; Check for end of string
    je done_next_char          ; Exit if end

    call print_colored_char  ; Print character with color
    ;call print_random_colored_char
    
    inc si           ; Move to next character
    jmp next_char    ; Repeat

done_next_char:
    pop si          ; Restore registers
    ret
print_colored_string endp




set_student_index proc  
    xor dx,dx
    
    mov ax,students_global_index
    mov bx,students_indexinc
    mul bx 
    mov students_index,ax
  
    mov ax, students_global_index
    mov bx,2
    mul bx 
    mov pt1_index,ax
    
    ret
set_student_index endp

get_student_info_at_index proc ; return students_index 
    push si    
             call set_student_index  
             mov si,pt1_index             ;load pt1_index
             
             MOV AX, students_pt1_score[SI]
             mov s_pt1,ax                 ;s_pt1 save :v
             
             MOV AX, students_pt2_score[SI]
             mov s_pt2,ax                 
             
             MOV AX, students_pt3_score[SI]
             mov s_pt3,ax                 
             
             MOV AX, students_lab1_score[SI]
             mov s_lab1,ax                 ;s_lab1 save     
             
             MOV AX, students_lab2_score[SI]
             mov s_lab2,ax         
             
             MOV AX, students_pres1_score[SI]
             mov s_pres1,ax                 ;s_pres1 save    
             
             MOV AX, students_pres2_score[SI]
             mov s_pres2,ax                         
             
             MOV AX, students_fe_score[SI]
             mov s_fe,ax                 
    pop si
    ret
get_student_info_at_index endp      

set_student_info_at_index proc ; parameter students_global_index, return students_index
    push si 
                  
             mov si,pt1_index             ;load pt1_index
             
             mov ax,s_pt1
             MOV students_pt1_score[SI],ax  
             
             mov ax,s_pt2   
             MOV students_pt2_score[SI],ax  
             
             mov ax,s_pt3   
             MOV students_pt3_score[SI],ax
             
             mov ax,s_lab1   
             MOV students_lab1_score[SI],ax  
             
             mov ax,s_lab2   
             MOV students_lab2_score[SI],ax  
             
             mov ax,s_pres1
             MOV students_pres1_score[SI],ax  
             
             mov ax,s_pres2
             MOV students_pres2_score[SI],ax    
             
             mov ax,s_fe
             MOV students_fe_score[SI],ax    
                   
    pop si
    ret                     
set_student_info_at_index endp

set_student_info_at_index_bak proc   
    
      
         ;--------SORT Test----------
        mov cx,len
        xor si,si
        mov al,students[si+2]  
        sort_student:  
               mov students_global_index,si    
               call get_student_info_at_index 
                  
               mov si, students_index    
               cmp al,students[si+2]
               jnb nextSort  
               mov al,students[si+2]
               mov si,pt1_index 
               mov dx,s_pt1
               
               nextSort:         
                
               add si,1
        loop sort_student
         
         mov num0,ax
         mov num1,dx
         call printf_int   
         
         ;------------------
         
         
             mov si,students_index       ;load students_index
            
             lea dx,line_student_index
             call printf
             
      
             mov dx, students_global_index 
             add dl,31h
             call printf_c  
                    
             lea dx,line_student_colon
             call printf 
             
            
             
             lea dx,line_student_name
             call printf
      
             
             call scanf_string  
             
            
      
             add si,students_indexinc  
             mov students_index,si        ;save students_index
             
             mov si,pt1_index             ;load pt1_index
             
             lea dx,line_student_pt1
             call printf
             
             call scanf_float      
                  
             mov students_pt1_score[si],ax   

             
             add si,2
             mov pt1_index,si            ;save pt1_index
             
             call printf_endl
             
             inc students_global_index
    ret
set_student_info_at_index_bak endp   



scanf_string proc 
    push si
             mov si,students_index             
             MOV AH, 0Ah     ; DOS input function
             ;MOV DX, OFFSET student_name  ; Point to buffer
             LEA DX, students[SI]  
             INT 21h         ; Call DOS interrupt   
           
             ;mov bl, students[SI+1]  ; Get actual length of input    
             ;xor bh,bh
             ;mov byte ptr students[SI+2+BX], '$'  ; Append '$' after input
   pop si                        
    ret    
scanf_string endp  

printf_string proc
      push si     
            mov si,students_index 
            lea dx,students[si+2]    
            ;lea dx,[students + si + 2]
            call printf  
            
           
            ;call printf_endl
            pop si
    ret
printf_string endp    

printf_cstring proc  ;parameter mov bl, 00000110b  ; Yellow text ;dx string
     push si     
            mov si,students_index 
            lea dx,students[si+2]   
            call print_colored_string 
           
            pop si
    ret
printf_cstring endp    

print_colored_stringFPT proc
    ; Save registers
    push si
    push ax
    push dx
    push bx
    push cx

    ; Read current cursor position
    mov ah, 03h    ; BIOS function: Get cursor position
    mov bh, 0      ; Page number
    int 10h        ; Now DH = row, DL = column

    mov si, offset textfptedu   ; Load string address

next_char1:
    mov al, [si]               ; Load character from string
    cmp al, '$'                ; End of string?
    je done1                    ; If yes, exit function

    cmp al, 13                 ; Is it a carriage return?
    je handle_carriage_return1  ; Yes, move cursor back to start

    cmp al, 10                 ; Is it a newline?
    je handle_newline1          ; Yes, move cursor down

    ;call generate_random_rainbow_text_color1 ; Get random color in BL
    call print_colored_char    ; Print character with color

    inc si                     ; Move to next character
    jmp next_char1              ; Repeat

handle_carriage_return1:
    mov dl, 0                  ; Move cursor to start of line
    inc si                     ; Skip this character
    jmp next_char1

handle_newline1:
    inc dh                     ; Move cursor down one row
    mov dl, 0                  ; Reset to start of new line
    mov ah, 02h                ; BIOS set cursor position
    int 10h                    ; Update cursor
    inc si                     ; Skip this character
    jmp next_char1

done1:
    ; Restore registers
    pop cx
    pop bx
    pop dx
    pop ax
    pop si
    ret
print_colored_stringFPT endp


printf_header proc
    lea dx,line_bar
    call printf
    lea dx,line_barspace
    call printf 
    
    lea dx,line_bartitle
    call printf    
    
        call printf_endl  
    
    lea dx,line_bar
    call printf     
    
   

    
    lea dx,line_barname                 
    call printf
    
  ;  call printf_tab

    
    lea dx,line_barscore
    call printf               
                      
    ret
printf_header endp

;-----------------MODULES-----------------------         
printf proc ;print dx              
          push ax
          mov ah,09h
          int 21h
          pop ax 
          ret
printf endp  

printf_endl proc ;print 0Dh,0Ah           
          push ax
          mov ah,09h 
          lea dx,linee
          int 21h
          pop ax 
          ret
printf_endl endp  

printf_c proc   ;print dl
         push ax
         mov ah,02h
         int 21h
         pop ax 
         ret
printf_c endp

printf_cc proc   ;print dl read colorc
         push ax
         
         mov al, dl         ; Character to print
         mov bl, colorc   ; Red text (change this for other colors)
         call print_colored_char
         
         pop ax  
         ret
printf_cc endp

printf_int proc ;print ax     
         push cx 
         push dx
         mov bx,10
         xor cx,cx 
         tach:    
            inc cx
            xor dx,dx    
            div bx 
            push dx
            cmp ax,0
         jne tach
         view:
            pop dx  
            add dl,30h 
            ;printchar
            call printf_cc
         loop view   
         
         pop dx
         pop cx    
         ret    
printf_int endp

scanf_int proc ;return ax  
          push cx
          mov bx,10
          mov num0,0
          nhap:
            mov ah,01h 
            int 21h   
            cmp al, 0Dh
            je endnhap
            sub al,30h      
            xor ch,ch
            mov cl,al
            mov ax,num0 
            mul bx
            add ax,cx
            mov num0,ax         
         jmp nhap
         endnhap: 
         mov ax,num0  
         pop cx
         ret                 
scanf_int endp

scanf_float proc ;return ax (fixed-point with two decimal places)  
          push cx
          mov bx,10
          mov num0,0
          mov seen_decimal,0 
          mov divisor,1
          nhapf:
            mov ah,01h 
            int 21h   
            
            cmp al, 0Dh
            je endnhapf
            
            cmp al,2Eh
            je seen_decimal_part
           
            
            sub al,30h      
            xor ch,ch
            mov cl,al
            mov ax,num0 
            mul bx
            add ax,cx
            mov num0,ax  
            
            cmp seen_decimal,1
            je incdivisor: 
            
            jmp nhapf   

            seen_decimal_part:
                mov seen_decimal,1 
                jmp nhapf  
            incdivisor:
                mov ax,divisor
                mul bx 
                mov divisor,ax
                jmp nhapf               
         
         endnhapf:
            mov bx,decimal_places;100  
            mov ax,num0 
            mul bx      
            div divisor    
                        
         pop cx
         ret                 
scanf_float endp

printf_float proc ;print ax     
         push cx
         mov bx,decimal_places   
         xor dx,dx
         div bx
         call printf_int         
         push dx
         mov dl,2Eh
         call printf_c
         pop dx
         mov ax,dx 
         cmp ax,10
         jnb skipfirst0  
         push ax
         mov dl,30h
         call printf_cc
         pop ax
         skipfirst0:
            call printf_int       
        
         mov al,default_text_color
         mov colorc, al
         
         pop cx   
          
         ret    
printf_float endp   

div_float proc   ;parameter ax bx, return ax 
    xor dx,dx   
    push bx
    mov bx,decimal_places
    mul bx
    pop bx 
    div bx    
    mov bx,decimal_places   
    mul bx  
    ;mov bx,10
    div bx 
    ret
div_float endp

mul_float proc   ;parameter ax bx, return ax 
    xor dx,dx
    mul bx        
    mov bx,decimal_places
    div bx       
    ret
mul_float endp  

int_to_float proc ;parameter ax,return ax
    mov bx,decimal_places
    mul bx
    ret                    
int_to_float endp

clearscreen proc    
    push ax
   
    MOV AX, 3  
    INT 10H      ; Call BIOS interrupt
   
    call welcomescreen
    
    pop ax   
    ret
clearscreen endp     

printf_tab proc
    push ax
    mov ah,0EH ; BIOS teletype output
    mov al,09h ; ASCII Tab charater
    int 10h
    pop ax
    ret
printf_tab endp 

fptlogo_screen proc     
    call printf_endl
    lea dx,textfptedu   
    ;call printf;
    mov bl,00000110b
    call print_colored_stringFPT  
    ret    
fptlogo_screen endp 
    
welcomescreen proc    
    ; Set cursor position (row 5, column 10)
    mov ah, 02h
    mov bh, 0     ; Page number
    mov dh, 5     ; Row
    mov dl, 10    ; Column
    int 10h  
    call fptlogo_screen
    ret
welcomescreen endp

end main   
