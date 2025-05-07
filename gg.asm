;-------------------------------------------\0
; PURPOSE : Test number 1                   \
; SYSTEM  : Turbo Assembler Ideal Mode      \ 
; AUTHOR  : Tavor Lavi                      \
;-------------------------------------------\

IDEAL
		
MODEL small

STACK 100h

DATASEG
    note dw 0D5Ah ; 1193180 / 131 -> (hex)
    game_over db "Game Over!$"
    rrestart db "Press 'R' restart$"
    instructions db "Press Esc to see instructions$"
    win db "You win!$"
    lose db "Looser! D:$"
    mmm db 0
    ttl db 1
    temp_char db '0$'
    leveltext db "Level:$"
    livestext db "Lives:$"
    spsp db "                                        $"
    turnstext db "Turns left:$"
    Turns dw 10
    delay_time dw 1
    level dw 1
    Lives dw 3
    sx dw 5fh
    sy dw 3fh
    sx1 dw 0a1h-20h
    sx2 dw 0b1h-20h
    sx3 dw 0c1h-20h
    sx4 dw 0d1h-20h
    sx5 dw 0e1h-20h
    sy1 dw 00h
    sy2 dw 00h
    sy3 dw 00h
    sy4 dw 00h
    sy5 dw 00h
    sx6 dw 0e1h+10H-20h
    sy6 dw 00h
    sx7 dw 0e1h+20H-20h
    sy7 dw 00h
    sx8 dw 0e1h+30H-20h
    sy8 dw 00h
    sx9 dw 0e1h+40H-20h
    sy9 dw 00h
    sx10 dw 0e1h+50H-20h
    sy10 dw 00h
    a dw 5 dup(0)
    sxx dw 10 dup(0)
    syy dw 10 dup(0)
    s dw 10 dup(0)
    sn dw 10
    hx dw 0125h+0ah
    hy dw 0h
    hhh db 0
    ssize dw 0ch
    NextRandom dw 0
    moving db 0h
    fx dw 0bbh
    fy dw 0aah
    ff dw 0fh
    ballxx dw 2eh
    ballyy dw 2eh
    dot_size dw 04h
    color db 2h
    cotx dw 00h
    coty dw 0c8h
    ud dw 1
    cot_size dw 04h
    xxx dw 2h
    time_aux db 0
    time_aux2 dw 0
    WINDOW_WIDTH DW 140h 
	WINDOW_HEIGHT DW 0c8h
    ballx dw 0h
    bally dw 0h
    dotx dw 0eh + 7fh
    doty dw 0eh + 79h
    dotxx dw 0
    dotyy dw 0
    holex dw 0125h
    holey dw 0AAh
    ball_size dw 08h ;ball size in pixels
    hole_size dw 08h
    ballxspeed dw 1h
    ballyspeed dw 1h
    filename db 'gg.bmp',0
    filehandle dw ?
    Header db 54 dup (0)
    Palette db 256*4 dup (0)
    ScrLine db 320 dup (0)
    ErrorMsg db 'Error', 13, 10,'$'
    msg db 'hello'
    lop dw 0
    heartchar   db 't', 04h, 04h, 't', 't', 04h, 04h, 't', 'n'
                db 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 'n'
                db 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 'n'
                db 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 'n'
                db 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 'n'
                db 't', 04h, 04h, 04h, 04h, 04h, 04h, 't', 'n'
                db 't', 't', 04h, 04h, 04h, 04h, 't', 't', 'n'
                db 't', 't', 't', 04h, 04h, 't', 't', 't', 'n'
                db '$'
    ballchar    db 't', 't', 0fh, 0fh, 0fh, 0fh, 't', 't', 'n'
                db 't', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 't', 'n'
                db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 'n'
                db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 'n'
                db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 'n'
                db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 'n'
                db 't', 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 't', 'n'
                db 't', 't', 0fh, 0fh, 0fh, 0fh, 't', 't', 'n'
                db '$'
    holechar    db 't', 't',   0,   0,   0,   0, 't', 't', 'n'
                db 't',   0,   0,   0,   0,   0,   0, 't', 'n'
                db   0,   0,   0,   0,   0,   0,   0,   0, 'n' 
                db   0,   0,   0,   0,   0,   0,   0,   0, 'n'
                db   0,   0,   0,   0,   0,   0,   0,   0, 'n'
                db   0,   0,   0,   0,   0,   0,   0,   0, 'n'
                db 't',   0,   0,   0,   0,   0,   0, 't', 'n'
                db 't', 't',   0,   0,   0,   0, 't', 't', 'n'
                db '$'
    dotchar		db 't', 0bh+10h, 0bh+10h, 0bh+10h,  't', 'n'
                db 0bh+10h, 0bh+10h, 0bh+10h, 0bh+10h, 0bh+10h, 'n'
                db 0bh+10h, 0bh+10h, 0bh+10h, 0bh+10h, 0bh+10h, 'n'
                db 0bh+10h, 0bh+10h, 0bh+10h, 0bh+10h, 0bh+10h, 'n'
                db 't', 0bh+10h, 0bh+10h, 0bh+10h, 't', 'n'
                db '$'
    dotcharp	db 't', 144, 144, 144, 't', 'n'
                db 144, 144, 144, 144, 144, 'n'
                db 144, 144, 144, 144, 144, 'n'
                db 144, 144, 144, 144, 144, 'n'
                db 't', 144, 144, 144, 't', 'n'
                db '$'
    spikechar   db 6bh, 't', 't', 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 't', 't', 6bh, 'n'
                db 't', 't', 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 't', 't', 'n'
                db 't', 6bh, 6bh,   0,   0, 6bh, 6bh,   0,   0, 6bh, 6bh, 't', 'n'
                db 6bh, 6bh, 6bh,   0,   0, 6bh, 6bh,   0,   0, 6bh, 6bh, 6bh, 'n'
                db 6bh, 6bh, 6bh,   0,   0, 6bh, 6bh,   0,   0, 6bh, 6bh, 6bh, 'n'
                db 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 'n'
                db 6bh, 6bh,   0, 6bh, 6bh, 6bh, 6bh, 6bh, 6bh,   0, 6bh, 6bh, 'n'
                db 6bh, 6bh,   0,   0, 6bh, 6bh, 6bh, 6bh,   0,   0, 6bh, 6bh, 'n'
                db 6bh, 6bh,   0,   0,   0,   0,   0,   0,   0,   0, 6bh, 6bh, 'n'
                db 't', 6bh, 6bh,   0,   0,   0,   0,   0,   0, 6bh, 6bh, 't', 'n'
                db 't', 't', 6bh, 6bh,   0,   0,   0,   0, 6bh, 6bh, 't', 't', 'n'
                db 6bh, 't', 't', 6bh, 6bh, 6bh, 6bh, 6bh, 6bh, 't', 't', 6bh, 'n'
                db '$'
		
CODESEG
    Start: 
    mov ax, @data
    mov ds, ax
    ; Graphic mode
    mov [a + 2], 5
    mov ax, [ballyy]
    mov [bally], ax
    mov ax, [ballxx]
    mov [ballx], ax
    mov ax, 13h
    int 10h
    call OpenFile
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap
chch:
    mov ah, 01h
    int 16h
    jz chch
    mov ah, 00h
    int 16h
    cmp al, 20h
    jne chch
    mov ax, 13h
    int 10h
    call level1
        proc level1
            call greenscreen
            call ballps
            ; call ifheart
            mov [Turns], 5
            mov [lives], 3
            mov [level], 1
            GAME1:
                call print
                mov [ttl], 1
                ;call drawspikes
                call fixctrl
                call checkh
                call heartt
                call sg
                call setxy
                call checkpower
                dec [Turns]
            ccc1:
                call checktime0
                call greenscreen
                call print
                ;call drawspike
                call drawhole
                call move_ball
                call ballinhole
                call balls1
                call drawball
                call stpmov
                call checkend
                mov al, 0
                cmp [ttl], al
                je GAME1
                jmp ccc1
        endp level1

        proc level2
            mov [hhh], 0
            call ifheart
            call greenscreen   
            call ballps
            
            GAME2:
                call print
                mov [ttl], 1
                ;call drawspike1
                ;call drawspike1
                ;call ifheart
                call fixctrl
                call sg
                call setxy
                call checkpower
                dec [Turns]
            ccc2:
                call checktime0
                call greenscreen
                call print
                ;call drawspike
                call drawhole
                call move_ball
                call ballinhole
                call balls1
                call balls2
                call drawball
                call stpmov
                call checkend
                mov al, 0
                cmp [ttl], al
                je GAME2
                jmp ccc2
        endp level2

        proc instt
            call OpenFile
            call ReadHeader
            call ReadPalette
            call CopyPal
            call CopyBitmap
            chchch:
                mov ah, 01h
                int 16h
                jz chchch
                mov ah, 00h
                int 16h
                cmp al, 20h
                jne chchch
                mov ax, 13h
                int 10h
        endp instt
            
        proc printstuts
            mov dx, 0
            mov bp, offset spsp
            call PrintText
            mov dx, 0
            mov bl, 144
            mov bp, offset livestext
            call PrintText
            mov dl, 6
            mov ax, [offset Lives]
            call PrintNumber

            mov dl, 14
            mov bl, 144
            mov bp, offset leveltext
            call PrintText
            mov dl, 6
            mov ax, [offset level]
            call PrintNumber

            mov dl, 27
            mov bl, 144
            mov bp, offset turnstext
            call PrintText
            mov dl, 6
            mov ax, [offset Turns]
            call PrintNumber
            ret
        endp printstuts

        proc checktime0
            CHECK_TIME:
                MOV AH,2Ch 					 ;get the system time
                INT 21h    					 ;CH = hour CL = minute DH = second DL = 1/100 seconds
                
                CMP DL, [TIME_AUX]  			 ;is the current time equal to the previous one(TIME_AUX)?
                JE CHECK_TIME
                mov [TIME_AUX], dl
                ret
        endp checktime0

        proc DrawCharacter ; draw a character, input: offset saved in bx, top left pixel position in (cx, dx).
            push dx
            push bx
            push ax
            push cx
            
            draw_line_loop:
                mov al, [bx]
                
                cmp al, '$'
                je end_line_loop
                
                cmp al, 'n'
                jne not_new_line
                inc dx
                pop cx
                push cx
                inc bx
                jmp draw_line_loop

                not_new_line:
                    cmp al, 't' ; dont draw pixel ('t' = transparent)
                    jne not_transparent
                    inc bx
                    inc cx
                    jmp draw_line_loop

                
                not_transparent:
                ;call DrawPixel
                    mov ah, 0ch
                    int 10H
                    
                    inc cx
                    inc bx
                
                    jmp draw_line_loop
                
                
                end_line_loop:
                    pop cx
                    pop ax
                    pop bx
                    pop dx
                    ret
        endp DrawCharacter

        proc resetball
            mov ax, [ballxx]
            mov [ballx], ax
            mov ax, [ballyy]
            mov [bally], ax
            mov [ttl], 0
            ret
        endp resetball

        
        proc Delay ; Sleep.
            
            
            mov al, 0
            mov ah, 86h
            mov cx, [offset delay_time]
            mov dx, 2
            int 15h

            
            
            ret
        endp

        proc ballinhole
            mov ax, [ballx]
            cmp ax, [holex]
            je xe
            jg aa
            jl ab
            mov ax, 1
            ret
            aa:
                mov ax, [holex]
                add ax, [hole_size]
                cmp ax, [ballx]
                jge xe
                ret
            ab:
                add ax, [ball_size]
                cmp [holex], ax
                jle xe
                ret
            xe:
                mov ax, [bally]
                cmp ax, [holey]
                je ye
                jg ba
                jl bb
            ba:
                mov ax, [holey]
                add ax, [hole_size]
                cmp ax, [bally]
                jge ye
                ret
            bb:
                add ax, [ball_size]
                cmp [holey], ax
                jle ye
                ret
            ye:
                inc [level]
                ; in al, 61h
                ; or al, 00000011b
                ; out 61h, al
                ; mov al, 0B6h
                ; out 43h, al
                ; mov ax, [note]
                ; out 42h, al ; Sending lower byte
                ; mov al, ah
                ; out 42h, al
                ; call checktime0
                ; in al, 61h
                ; and al, 11111100b
                ; out 61h, al
                call level2
                ret
        endp ballinhole

        proc balls
            mov ax, [ballx]
            cmp ax, [sx]
            je sxe
            jg sxg
            jl sxl
            sxg:
                mov ax, [sx]
                add ax, [ssize]
                cmp ax, [ballx]
                jge sxe
                ret
            sxl:
                add ax, [ball_size]
                cmp [sx], ax
                jle sxe
                ret
            sxe:
                mov ax, [bally]
                cmp ax, [sy]
                je sye
                jg syg
                jl syl
            syg:
                mov ax, [sy]
                add ax, [ssize]
                cmp ax, [bally]
                jge sye
                ret
            syl:
                add ax, [ball_size]
                cmp [sy], ax
                jle sye
                ret
            sye:
                call resetball
                dec [Lives]
                ret
        endp balls

        proc balls1
            mov ax, [ballx]
            cmp ax, [sx1]
            je sxe1
            jg sxg1
            jl sxl1
            sxg1:
                mov ax, [sx1]
                add ax, [ssize]
                cmp ax, [ballx]
                jge sxe1
                ret
            sxl1:
                add ax, [ball_size]
                cmp [sx1], ax
                jle sxe1
                ret
            sxe1:
                mov ax, [bally]
                cmp ax, [sy1]
                je sye1
                jg syg1
                jl syl1
            syg1:
                mov ax, [sy1]
                add ax, [ssize]
                cmp ax, [bally]
                jge sye1
                ret
            syl1:
                add ax, [ball_size]
                cmp [sy1], ax
                jle sye1
                ret
            sye1:
                call resetball
                dec [Lives]
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret
        endp balls1

        proc balls2 
            mov ax, [ballx] 
            cmp ax, [sx2] 
            je sxe2 
            jg sxg2 
            jl sxl2 
            sxg2: 
                mov ax, [sx2] 
                add ax, [ssize] 
                cmp ax, [ballx] 
                jge sxe2 
                ret 
            sxl2: 
                add ax, [ball_size] 
                cmp [sx2], ax 
                jle sxe2 
                ret 
            sxe2: 
                mov ax, [bally] 
                cmp ax, [sy2] 
                je sye2 
                jg syg2 
                jl syl2 
            syg2: 
                mov ax, [sy2] 
                add ax, [ssize] 
                cmp ax, [bally] 
                jge sye2 
                ret 
            syl2: 
                add ax, [ball_size] 
                cmp [sy2], ax  
                jle sye2 
                ret 
            sye2: 
                call resetball 
                dec [Lives] 
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret 
        endp balls2

        proc balls3 
            mov ax, [ballx] 
            cmp ax, [sx3] 
            je sxe3 
            jg sxg3 
            jl sxl3 
            sxg3: 
                mov ax, [sx3] 
                add ax, [ssize] 
                cmp ax, [ballx] 
                jge sxe3 
                ret 
            sxl3: 
                add ax, [ball_size] 
                cmp [sx3], ax 
                jle sxe3 
                ret 
            sxe3: 
                mov ax, [bally] 
                cmp ax, [sy3] 
                je sye3 
                jg syg3 
                jl syl3 
            syg3: 
                mov ax, [sy3]  
                add ax, [ssize] 
                cmp ax, [bally] 
                jge sye3 
                ret 
            syl3: 
                add ax, [ball_size] 
                cmp [sy3], ax 
                jle sye3 
                ret 
            sye3: 
                call resetball 
                dec [Lives] 
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret 
        endp balls3

        proc balls4 
            mov ax, [ballx] 
            cmp ax, [sx4] 
            je sxe4 
            jg sxg4 
            jl sxl4 
            sxg4: 
                mov ax, [sx4] 
                add ax, [ssize] 
                cmp ax, [ballx] 
                jge sxe4 
                ret 
            sxl4: 
                add ax, [ball_size] 
                cmp [sx4], ax 
                jle sxe4 
                ret 
            sxe4: 
                mov ax, [bally] 
                cmp ax, [sy4] 
                je sye4 
                jg syg4 
                jl syl4 
            syg4: 
                mov ax, [sy4] 
                add ax, [ssize] 
                cmp ax, [bally] 
                jge sye4 
                ret 
            syl4: 
                add ax, [ball_size] 
                cmp [sy4], ax 
                jle sye4 
                ret 
            sye4: 
                call resetball 
                dec [Lives] 
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret 
        endp balls4

        proc balls5 
            mov ax, [ballx] 
            cmp ax, [sx5] 
            je sxe5 
            jg sxg5 
            jl sxl5 
            sxg5: 
                mov ax, [sx5] 
                add ax, [ssize] 
                cmp ax, [ballx] 
                jge sxe5 
                ret 
            sxl5: 
                add ax, [ball_size] 
                cmp [sx5], ax 
                jle sxe5 
                ret 
            sxe5: 
                mov ax, [bally] 
                cmp ax, [sy5] 
                je sye5 
                jg syg5 
                jl syl5 
            syg5: 
                mov ax, [sy5] 
                add ax, [ssize] 
                cmp ax, [bally] 
                jge sye5 
                ret 
            syl5: 
                add ax, [ball_size] 
                cmp [sy5], ax 
                jle sye5 
                ret 
            sye5: 
                call resetball 
                dec [Lives] 
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret 
        endp balls5

        proc balls6
            mov ax, [ballx]
            cmp ax, [sx6]
            je sxe6
            jg sxg6
            jl sxl6
            sxg6:
                mov ax, [sx6]
                add ax, [ssize]
                cmp ax, [ballx]
                jge sxe6
                ret
            sxl6:
                add ax, [ball_size]
                cmp [sx6], ax
                jle sxe6
                ret
            sxe6:
                mov ax, [bally]
                cmp ax, [sy6]
                je sye6
                jg syg6
                jl syl6
            syg6:
                mov ax, [sy6]
                add ax, [ssize]
                cmp ax, [bally]
                jge sye6
                ret
            syl6:
                add ax, [ball_size]
                cmp [sy6], ax
                jle sye6
                ret
            sye6:
                call resetball
                dec [Lives]
                ret
        endp balls6

        proc balls7
            mov ax, [ballx]
            cmp ax, [sx7]
            je sxe7
            jg sxg7
            jl sxl7
            sxg7:
                mov ax, [sx7]
                add ax, [ssize]
                cmp ax, [ballx]
                jge sxe7
                ret
            sxl7:
                add ax, [ball_size]
                cmp [sx7], ax
                jle sxe7
                ret
            sxe7:
                mov ax, [bally]
                cmp ax, [sy7]
                je sye7
                jg syg7
                jl syl7
            syg7:
                mov ax, [sy7]
                add ax, [ssize]
                cmp ax, [bally]
                jge sye7
                ret
            syl7:
                add ax, [ball_size]
                cmp [sy7], ax
                jle sye7
                ret
            sye7:
                call resetball
                dec [Lives]
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret
        endp balls7

        proc balls8
            mov ax, [ballx]
            cmp ax, [sx8]
            je sxe8
            jg sxg8
            jl sxl8
            sxg8:
                mov ax, [sx8]
                add ax, [ssize]
                cmp ax, [ballx]
                jge sxe8
                ret
            sxl8:
                add ax, [ball_size]
                cmp [sx8], ax
                jle sxe8
                ret
            sxe8:
                mov ax, [bally]
                cmp ax, [sy8]
                je sye8
                jg syg8
                jl syl8
            syg8:
                mov ax, [sy8]
                add ax, [ssize]
                cmp ax, [bally]
                jge sye8
                ret
            syl8:
                add ax, [ball_size]
                cmp [sy8], ax
                jle sye8
                ret
            sye8:
                call resetball
                dec [Lives]
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret
        endp balls8

        proc balls9
            mov ax, [ballx]
            cmp ax, [sx9]
            je sxe9
            jg sxg9
            jl sxl9
            sxg9:
                mov ax, [sx9]
                add ax, [ssize]
                cmp ax, [ballx]
                jge sxe9
                ret
            sxl9:
                add ax, [ball_size]
                cmp [sx9], ax
                jle sxe9
                ret
            sxe9:
                mov ax, [bally]
                cmp ax, [sy9]
                je sye9
                jg syg9
                jl syl9
            syg9:
                mov ax, [sy9]
                add ax, [ssize]
                cmp ax, [bally]
                jge sye9
                ret
            syl9:
                add ax, [ball_size]
                cmp [sy9], ax
                jle sye9
                ret
            sye9:
                call resetball
                dec [Lives]
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret
        endp balls9

        
        proc balls10
            mov ax, [ballx]
            cmp ax, [sx10]
            je sxe10
            jg sxg10
            jl sxl10
            sxg10:
                mov ax, [sx10]
                add ax, [ssize]
                cmp ax, [ballx]
                jge sxe10
                ret
            sxl10:
                add ax, [ball_size]
                cmp [sx10], ax
                jle sxe10
                ret
            sxe10:
                mov ax, [bally]
                cmp ax, [sy10]
                je sye10
                jg syg10
                jl syl10
            syg10:
                mov ax, [sy10]
                add ax, [ssize]
                cmp ax, [bally]
                jge sye10
                ret
            syl10:
                add ax, [ball_size]
                cmp [sy10], ax
                jle sye10
                ret
            sye10:
                call resetball
                dec [Lives]
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
                ret
        endp balls10

        proc checkend
            mov ax, 0
            cmp ax, [Turns]
            je ddd
            mov ax, 0
            cmp ax, [Lives]
            je ddd
            ret
            ddd:
                call gmor
                ret
        endp checkend

        proc fixctrl
            mov ax, [ballx]
            add ax, 1eh
            cmp ax, 315
            jge sit2
            sit1:
                mov ax, [ballx]
                add ax, 1eh
                mov [dotx], ax
                jmp contt

            sit2:
                mov ax, [ballx]
                sub ax, 1eh
                mov [dotx], ax
                jmp contt
            contt:
                mov ax, [bally]
                mov [doty], ax
                mov [coty], 0c8h
                mov [cotx], 0h
                mov [color], 02h
                ret
        endp fixctrl

        proc sg
            call drawball
            call drawhole
            ;CHECK_KP:
                ;mov ah, 01h
                ;int 16h
            CHECK_A:  
                mov ah, 01h
                int 16h
                jz CHECK_A
                mov ah, 00h
                int 16h
                cmp al, 20h
                je spn
                cmp ah, 4bh
                JE left
                cmp ah, 4dh
                je right
                cmp ah, 48h
                JE spdp
                cmp ah, 50h
                je spdm
                cmp al, 0d
                je spn
                jmp CHECK_A
            right:
                call drawdott
                call drawhole
                ;call drawspike
                call drawball
                call move_dot_r
                call drawdot
                call print
                jmp CHECK_A
                
            left:
                call drawdott
                call drawhole
                ;call drawspike
                call drawball
                call move_dot_l
                call drawdot
                call print
                jmp CHECK_A

            spdp:
                call drawcot
                call move_cot
                call print
                jmp CHECK_A
            spdm:
                call drawot
                call move_ot
                call print
                jmp CHECK_A
            spn:
                ret
        endp sg

        proc GetLength  ; Get length of variable, where its offset is on bp. (mov bp, offset var)
            push bx
            mov bx, bp
            xor cx, cx
            length_loop:
                cmp [byte bx], "$"
                je end_length_loop
                
                inc bx
                inc cx
                jmp length_loop

            end_length_loop:
                pop bx
                ret
        endp

        proc GetCrsr
            push ax
            push bx
            push cx
            
            xor ax, ax
            mov ah, 03h
            xor bh, bh
            int 10h

            pop cx
            pop bx
            pop ax
        endp

        proc PrintNumber
            push cx
            push dx
            push bx
            push ax

            ; cmp ax, 0
            ; jne number_is_not_0
            ; 	mov [temp_char], '0'
            ; 	mov bp, offset temp_char
            ; 	mov bx, 035h
            ; 	call GetCrsr

            ; 	call PrintText

            ; 	pop ax
            ; 	pop bx
            ; 	pop dx
            ; 	pop cx
            ; 	ret
            ; number_is_not_0:

            ; initilize count:
            xor cx, cx
            xor dx, dx

            Label1:
                ; if ax is zero:
                cmp ax, 0
                je Print1
                
                ; initilize bx to 10:
                mov bx, 10
                
                xor dx, dx
                ; extract the last digit:
                div bx
                
                ; push it in the stack:
                push dx
                
                ; increment the count:
                inc cx
                
                jmp Label1

            Print1:
                ; check if count:

                ; is greater than zero:
                cmp cx, 0
                je Endprint
                
                ; pop the top of stack:
                pop dx

                ; add 48 so that it represents the ASCII value of digits:
                add dx, '0' 
                
                ; interuppt to print a character:
                push bx
                push cx
                push dx

                mov [temp_char], dl
                mov bp, offset temp_char
                mov bx, 144
                call GetCrsr

                call PrintText

                pop dx
                pop cx
                pop bx
                
                ; decrease the count:
                dec cx
                jmp Print1
            
            Endprint:
                pop ax
                pop bx
                pop dx
                pop cx
                ret
        endp
            
        proc PrintText ; Print a variable to screen, offset saved in bp, dh - row, dl - column, bl - color.
            push ax
            push bx
            push cx
            push es

            push ax
            mov ax, @data
            mov es, ax
            pop ax

            xor ax, ax
            mov ah, 02h
            xor bh, bh
            
            int 10h
            
            xor ax, ax
            mov ah, 13h ; WRITE THE STRING
            mov al, 01h; ATTRIBUTE IN BL, MOVE CURSOR TO THAT POSITION
            mov bh, 0
            ;mov bl, 5 ;GREEN
            call GetLength
            ;mov cx, 7 ; LENGTH OF THE STRING
            int 10h
            
            pop es
            pop cx
            pop bx
            pop ax

            ret
        endp

        proc setxy
            mov ax, [dotx]
            sub ax, [ballx]
            mov bx, 0h
            cmp ax, bx
            jl mx
            px:
                mov bl, 03h
                div bl
                xor ah, ah
                mov [ballxspeed], ax
                mov ax, [doty]
                sub ax, [bally]
                mov bx, 0h
                cmp ax, bx
                jge py
                jl my
            mx:
                neg ax
                mov bl, 03h
                div bl
                xor ah, ah
                neg ax
                mov [ballxspeed], ax
                mov ax, [doty]
                sub ax, [bally]
                mov bx, 0h
                cmp ax, bx
                jl my
            py:
                mov bl, 03h
                div bl
                xor ah, ah
                mov [ballyspeed], ax
                ret
            my:
                neg ax
                mov bl, 03h
                div bl
                xor ah, ah
                neg ax
                mov [ballyspeed], ax
                ret
        endp setxy

        proc drawspikes
            loop1start:
                mov ax, 10
                cmp [lop], ax
                jl lolo
                lolo:
                    mov ax, 0
                    mov bx, [lop]
                    cmp [s + bx], ax
                    je loop1start
                    xor ax, ax
                    xor bh, 0h
                    mov cx, [sxx + bx]
                    mov dx, [syy + bx]

                    DRAW_S_HORIZONTAL:
                        mov ah, 0ch
                        mov al, 04h
                        mov bh, 00h
                        int 10h 
                        add cx, 2
                        MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
                        SUB AX, [sxx+bx]
                        CMP AX, [ssize]
                        JNG DRAW_S_HORIZONTAL    ;cx-ballx > ballsize
                        
                        MOV CX, [sxx+bx]				 ;the CX register goes back to the initial column
                        add DX, 2    				 ;we advance one line
                        MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
                        SUB AX, [syy+bx]
                        CMP AX, [ssize]
                        JNG DRAW_S_HORIZONTAL
                                        

        endp drawspikes

        ; proc drawspike
        ;     xor ax, ax
        ;     xor bh, 0h
        ;     mov cx, [a]
        ;     mov dx, [a]

		;     DRAW_S_HORIZONTAL:
        ;         mov ah, 0ch
        ;         mov al, 04h
        ;         mov bh, 00h
        ;         int 10h 
        ;         add cx, 2
        ;         MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
		; 	    SUB AX, [a]
		; 	    CMP AX, [ssize]
		; 	    JNG DRAW_S_HORIZONTAL    ;cx-ballx > ballsize
                
        ;         MOV CX, [a]				 ;the CX register goes back to the initial column
		; 	    add DX, 2    				 ;we advance one line
		; 	    MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
		; 	    SUB AX, [a]
		; 	    CMP AX, [ssize]
		; 	    JNG DRAW_S_HORIZONTAL
        ;     ret
        ; endp drawspike

        proc drawspike1
            xor ax, ax
            xor bh, 0h
            mov cx, [sx1]
            mov dx, [sy1]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike1
        proc drawspike2
            xor ax, ax
            xor bh, 0h
            mov cx, [sx2]
            mov dx, [sy2]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike2
        proc drawspike3
            xor ax, ax
            xor bh, 0h
            mov cx, [sx3]
            mov dx, [sy3]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike3
        proc drawspike4
            xor ax, ax
            xor bh, 0h
            mov cx, [sx4]
            mov dx, [sy4]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike4
        proc drawspike5
            xor ax, ax
            xor bh, 0h
            mov cx, [sx5]
            mov dx, [sy5]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike5
        proc drawspike6
            xor ax, ax
            xor bh, 0h
            mov cx, [sx6]
            mov dx, [sy6]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike6
        proc drawspike7
            xor ax, ax
            xor bh, 0h
            mov cx, [sx7]
            mov dx, [sy7]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike7
        proc drawspike8
            xor ax, ax
            xor bh, 0h
            mov cx, [sx8]
            mov dx, [sy8]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike8
        proc drawspike9
            xor ax, ax
            xor bh, 0h
            mov cx, [sx9]
            mov dx, [sy9]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike9
        proc drawspike10
            xor ax, ax
            xor bh, 0h
            mov cx, [sx10]
            mov dx, [sy10]
            mov bx, offset spikechar
            call drawcharacter
            ret
        endp drawspike10

        proc print
            call heartt
            cmp [level], 1
            je lvl1
            cmp [level], 2
            je lvl2
            cmp [level], 3
            je lvl3
            cmp [level], 4
            je lvl4
            cmp [level], 5
            je lvl5001
            cmp [level], 6
            je lvl61
            cmp [level], 7
            je lvl71
            cmp [level], 8
            je lvl81
            cmp [level], 9
            je lvl91
            cmp [level], 10
            jge lvl101
            lvl1:
                call printstuts
                call drawspike1
                call balls1
                call heartt
                ret
            lvl2:
                call printstuts
                call drawspike1
                call drawspike2
                call balls1
                call balls2
                call heartt
                ret
            lvl3:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call balls1
                call balls2
                call balls3
                call heartt
                ret
            lvl4:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call drawspike4
                call balls1
                call balls2
                call balls3
                call balls4
                call heartt
                ret
            lvl61:
                jmp lvl6
            lvl5001:
                jmp lvl5
            lvl71:
                jmp lvl7
            lvl81:
                jmp lvl8
            lvl91:
                jmp lvl9
            lvl101:
                jmp lvl1001
            lvl5:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call drawspike4
                call drawspike5
                call balls1
                call balls2
                call balls3
                call balls4
                call balls5
                call heartt
                ret
            lvl1001:
                jmp lvl10
            lvl6:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call drawspike4
                call drawspike5
                call drawspike6
                call balls1
                call balls2
                call balls3
                call balls4
                call balls5
                call balls6
                call heartt
                ret
            lvl7:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call drawspike4
                call drawspike5
                call drawspike6
                call drawspike7
                call balls1
                call balls2
                call balls3
                call balls4
                call balls5
                call balls6
                call balls7
                call heartt
                ret
            lvl8:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call drawspike4
                call drawspike5
                call drawspike6
                call drawspike7
                call drawspike8
                call balls1
                call balls2
                call balls3
                call balls4
                call balls5
                call balls6
                call balls7
                call balls8
                call heartt
                ret
            lvl9:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call drawspike4
                call drawspike5
                call drawspike6
                call drawspike7
                call drawspike8
                call drawspike9
                call balls1
                call balls2
                call balls3
                call balls4
                call balls5
                call balls6
                call balls7
                call balls8
                call balls9
                call heartt
                ret
            lvl10:
                call printstuts
                call drawspike1
                call drawspike2
                call drawspike3
                call drawspike4
                call drawspike5
                call drawspike6
                call drawspike7
                call drawspike8
                call drawspike9
                call drawspike10
                call balls1
                call balls2
                call balls3
                call balls4
                call balls5
                call balls6
                call balls7
                call balls8
                call balls9
                call balls10
                call heartt
                ret
        endp print

        proc ballps
            mov [ballx], 2eh
            mov [ballxx], 2eh
            add [Turns], 2
            ball:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl ball
                mov bx, 9ah
                cmp ax, bx 
                jg ball
                mov [bally], ax
                mov [ballyy], ax
            heee:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl heee
                mov bx, 9ah
                cmp ax, bx 
                jg heee
                mov [hy], ax
            hole:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl hole
                mov bx, 9ah
                cmp ax, bx 
                jg hole
                mov [holey], ax
            s1:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s1
                mov bx, 9ah
                cmp ax, bx 
                jg s1
                mov [sy1], ax
            s2:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s2
                mov bx, 9ah
                cmp ax, bx 
                jg s2
                mov [sy2], ax
            s3:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s3
                mov bx, 9ah
                cmp ax, bx 
                jg s3
                mov [sy3], ax
            s4:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s4
                mov bx, 9ah
                cmp ax, bx 
                jg s4
                mov [sy4], ax
            s5:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s5
                mov bx, 9ah
                cmp ax, bx 
                jg s5
                mov [sy5], ax
            

            s6:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s6
                mov bx, 9ah
                cmp ax, bx 
                jg s6
                mov [sy6], ax

            s7:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s7
                mov bx, 9ah
                cmp ax, bx 
                jg s7
                mov [sy7], ax

            s8:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s8
                mov bx, 9ah
                cmp ax, bx 
                jg s8
                mov [sy8], ax

            s9:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s9
                mov bx, 9ah
                cmp ax, bx 
                jg s9
                mov [sy9], ax

            s10:
                call prg
                mov bx, 2eh
                cmp ax, bx
                jl s10
                mov bx, 9ah
                cmp ax, bx 
                jg s10
                mov [sy10], ax
            ssss:
                ret
        endp ballps

        proc stpmov
            mov al, 0
            cmp al, [ttl]
            je t
            inc al
            cmp al, [ttl]
            je tt
            inc al
            cmp al, [ttl]
            je ttt
            inc al
            cmp al, [ttl]
            je tttt
            inc al
            cmp al, [ttl]
            je ttttt
            t:
                ;call nxtlvl
                ret
            tt:
                cmp [mmm], 20
                je tl
                inc [mmm]
                ret
            ttt:
                cmp [mmm], 20
                je tl
                inc [mmm]
                ret
            tttt:
                cmp [mmm], 20
                je tl
                inc [mmm]
                ret
            ttttt:
                cmp [mmm], 20
                je tl
                inc [mmm]
                ret
            tl:
                mov [mmm], 0
                dec [ttl]
                mov ax, 0h
                cmp [ballxspeed], ax
                jl xm
            xp:
                mov bl, 2
                mov ax, [ballxspeed]
                div bl
                xor ah, ah
                mov [ballxspeed], ax
                mov ax, 0h
                cmp [ballyspeed], ax
                jl ym
                jge yp
            xm:
                mov bl, 2
                mov ax, [ballxspeed]
                neg ax
                div bl
                neg ax
                xor ah, ah
                mov [ballxspeed], ax
                mov ax, 0h
                cmp [ballyspeed], ax
                jl ym
            yp:
                mov bl, 2
                mov ax, [ballyspeed]
                div bl
                xor ah, ah
                mov [ballyspeed], ax
                ret
            ym:
                mov bl, 2
                mov ax, [ballyspeed]
                neg ax
                div bl
                neg ax
                xor ah, ah
                mov [ballyspeed], ax
                ret
        endp stpmov

        proc nxtlvl
            mov [ballxspeed], 0
            mov [ballyspeed], 0
        endp nxtlvl

        proc checkpower
            cmp [color], 0ah
            je lightg1
            cmp [color],0eh
            je ylw1
            cmp [color],0ch
            je lightr1
            ret
            lightg1:
                mov [ttl], 1
                ret
			ylw1:
                mov [ttl], 2
                mov bl, 2
                mov ax, [ballxspeed]
                cmp ax, 0h
                jl ylwmx
                xor ah, ah
                mul bl
                mov [ballxspeed], ax
                mov bl, 2
                mov ax, [ballyspeed]
                cmp ax, 0h
                jl ylwmy
                mul bl
                mov [ballyspeed], ax
                ret
            ylwmx:
                xor ah, ah
                neg ax
                mul bl
                neg ax
                mov [ballxspeed], ax
                mov bl, 2
                mov ax, [ballyspeed]
                cmp ax, 0h
                jl ylwmy
                xor ah, ah
                mul bl
                mov [ballyspeed], ax
                ret
            ylwmy:
                xor ah, ah
                neg ax
                mul bl
                neg ax
                mov [ballyspeed], ax
                ret
			lightr1:
                mov [ttl], 2
                mov bl, 3
                mov ax, [ballxspeed]
                cmp ax, 0h
                jl rmx
                mul bl
                mov [ballxspeed], ax
                mov bl, 3
                mov ax, [ballyspeed]
                cmp ax, 0h
                jl rmy
                mul bl
                mov [ballyspeed], ax
                ret
            rmx:
                neg ax
                mul bl
                neg ax
                mov [ballxspeed], ax
                mov bl, 3
                mov ax, [ballyspeed]
                cmp ax, 0h
                jl rmy
                mul bl
                mov [ballyspeed], ax
                ret
            rmy:
                neg ax
                mul bl
                neg ax
                mov [ballyspeed], ax
                ret
        endp checkpower
        
        proc prg
            push dx
            xor dx, dx

            mov ax, [NextRandom]
            mov dx, 25173
            imul dx

            add  ax, 13849
            xor  ax, 62832
            mov  [NextRandom], ax

            pop dx
            ret
        endp prg
        
        PROC greenscreen 
            MOV AH, 06h    ; Scroll up function
            XOR AL, AL     ; Clear entire screen
            XOR CX, CX     ; Upper left corner CH=row, CL=column
            MOV DX, 184FH  ; lower right corner DH=row, DL=column 
            MOV BH, 144    ; YellowOnBlue
            INT 10H
            ret
        ENDP greenscreen 

        PROC clear_screen
			MOV AH,00h                   ;set the configuration to video mode
			MOV AL,13h                   ;choose the video mode
			INT 10h    					 ;execute the configuration 
		
			MOV AH,0Bh 					 ;set the configuration
			MOV BH,00h 					 ;to the background color
			MOV BL,00h 					 ;choose black as background color
			INT 10h    					 ;execute the configuration
			
			RET
        ENDP clear_screen

        PROC drawball
            xor ax, ax
            xor bh, 0h
            mov cx, [ballx]
            mov dx, [bally]
            mov bx, offset ballchar
            call DrawCharacter
; 
; 		    DRAW_BALL_HORIZONTAL:
;                 mov ah, 0ch
;                 mov al, 0fh
;                 mov bh, 00h
;                 int 10h 
;                 inc cx
;                 MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
; 			    SUB AX, [ballx]
; 			    CMP AX, [ball_size]
; 			    JNG DRAW_BALL_HORIZONTAL    ;cx-ballx > ballsize
;                 
;                 MOV CX, [ballx]				 ;the CX register goes back to the initial column
; 			    INC DX       				 ;we advance one line
; 			    MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
; 			    SUB AX, [bally]
; 			    CMP AX, [ball_size]
; 			    JNG DRAW_BALL_HORIZONTAL
            ret
        ENDP drawball 

        ;description
        PROC ifheart
            llll:
                call prg
                ;mov ax, 33301
                mov bl, 4
                div ax
                cmp ah, 0
                je jjjj
                ; cmp ax, 4
                ; jg llll
                ; cmp ax, 3
                ; jmp jjjj
                mov [hhh], 0
                ret
            jjjj:
                mov [hhh], 1
                ret
        ENDP ifheart

        proc heartt
            cmp [hhh], 0
            jg thth
            ret
            thth:
                call drawheart
                call checkh
                ret
        endp heartt
        proc drawheart
            xor ax, ax
            xor bh, 0h
            mov cx, [hx]
            mov dx, [hy]
            mov bx, offset heartchar
            call DrawCharacter
            ret
        endp drawheart

        proc checkh
            mov ax, [ballx]
            cmp ax, [hx]
            je xee
            jg aae
            jl abe
            ret
            aae:
                mov ax, [hx]
                add ax, [hole_size]
                cmp ax, [ballx]
                jge xee
                ret
            abe:
                add ax, [ball_size]
                cmp [hx], ax
                jle xee
                ret
            xee:
                mov ax, [bally]
                cmp ax, [hy]
                je yee
                jg bae
                jl bbe
            bae:
                mov ax, [hy]
                add ax, [hole_size]
                cmp ax, [bally]
                jge yee
                ret
            bbe:
                add ax, [ball_size]
                cmp [hy], ax
                jle yee
                ret
            yee:
                mov ax, [lives]
                inc ax
                mov [lives], ax
                dec [hhh]
                in al, 61h
                or al, 00000011b
                out 61h, al
                mov al, 0B6h
                out 43h, al
                mov ax, [note]
                out 42h, al ; Sending lower byte
                mov al, ah
                out 42h, al
                call checktime0
                in al, 61h
                and al, 11111100b
                out 61h, al
                ret
        endp checkh


        PROC drawbal
            xor ax, ax
            xor bh, 0h
            mov cx, [ballx]
            mov dx, [bally]

		    DRAW_BAL_HORIZONTAL:
                mov ah, 0ch
                mov al, 144
                mov bh, 00h
                int 10h
                inc cx
                MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			    SUB AX, [ballx]
			    CMP AX, [ball_size]
			    JNG DRAW_BAL_HORIZONTAL      ;cx-ballx > ballsize
                
                MOV CX, [ballx]				 ;the CX register goes back to the initial column
			    INC DX       				 ;we advance one line
			    MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			    SUB AX, [bally]
			    CMP AX, [ball_size]
			    JNG DRAW_BAL_HORIZONTAL
            ret
        ENDP drawbal

        proc gmor
            mov bl, 0fh
            mov dh, 11
            mov dl, 55
            mov bp, offset game_over
            call PrintText
            mov bl, 0fh
            mov dh, 12
            mov dl, 52
            mov bp, offset rrestart
            call PrintText
            mov bl, 0fh
            mov dh, 13
            mov dl, 47
            mov bp, offset instructions
            call PrintText
            ggggg:
                mov ah, 01h
                int 16h
                jz ggggg
                mov ah, 00h
                int 16h
                cmp al, 27
                je escesc
                cmp al, 114
                JE ggagain
                cmp al, 82
                je ggagain
                jmp ggggg
            escesc:
                call instt
            ggagain:
                call level1
        endp gmor
        
        PROC drawg
            xor ax, ax
            xor bh, 0h
            mov cx, [fx]
            mov dx, [fy]

        DRAW_G_HORIZONTAL:
                mov ah, 0ch
                mov al, 0fh
                mov bh, 01h
                int 10h 
                inc cx
                MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			    SUB AX, [fx]
			    CMP AX, [ff]
			    JNG DRAW_G_HORIZONTAL    ;cx-ballx > ballsize
                
                MOV CX, [fx]				 ;the CX register goes back to the initial column
			    INC DX       				 ;we advance one line
			    MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			    SUB AX, [fy]
			    CMP AX, [ff]
			    JNG DRAW_G_HORIZONTAL
            ret
        ENDP drawg

        PROC drawcot
            xor ax, ax
            mov bh, 0h
            mov cx, [cotx]
            mov dx, [coty]
			;cmp [coty], 21h
			;je darkr
			;jl darkr
			cmp [coty], 42h
			je lightr
			jl lightr
			;cmp [coty], 63h
			;je orng
			;jl orng
			cmp [coty], 84h
			je ylw
			jl ylw
			cmp [coty], 0c8h
			je lightg
			jl lightg
			jmp DRAW_COT_HORIZONTAL
			lightg:
				mov [color], 0ah
				jmp DRAW_COT_HORIZONTAL
			ylw:
				mov [color], 0eh
				jmp DRAW_COT_HORIZONTAL
			darkr:
				mov [color], 70h
				jmp DRAW_COT_HORIZONTAL
			orng:
				mov [color], 2ah
				jmp DRAW_COT_HORIZONTAL
			lightr:
				mov [color], 0ch

		    DRAW_COT_HORIZONTAL:
                mov ah, 0ch
                mov al, [color]
                mov bh, 00h
                int 10h 
                inc cx
                MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			    SUB AX, [cotx]
			    CMP AX, [cot_size]
			    JNG DRAW_COT_HORIZONTAL      ;cx-ballx > ballsize
                
                MOV CX, [cotx]				 ;the CX register goes back to the initial column
			    INC DX       				 ;we advance one line
			    MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			    SUB AX, [coty]
			    CMP AX, [cot_size]
			    JNG DRAW_COT_HORIZONTAL
            ret
        ENDP drawcot  

		PROC drawot
            xor ax, ax
            mov bh, 0h
            mov cx, [cotx]
            mov dx, [coty]

		    DRAW_OT_HORIZONTAL:
                mov ah, 0ch
                mov al, 144
                mov bh, 00h
                int 10h 
                inc cx
                MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			    SUB AX, [cotx]
			    CMP AX, [cot_size]
			    JNG DRAW_OT_HORIZONTAL      ;cx-ballx > ballsize
                
                MOV CX, [cotx]				 ;the CX register goes back to the initial column
			    INC DX       				 ;we advance one line
			    MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			    SUB AX, [coty]
			    CMP AX, [cot_size]
			    JNG DRAW_OT_HORIZONTAL
            ret
        ENDP drawot  

		PROC move_cot
			cmp [coty],0h
			je n
			dec [coty]
		n: 
			ret
        ENDP move_cot
		
		PROC move_ot
			cmp [coty],0c8h
			je q
			inc [coty]
		q: 
			ret
        ENDP move_ot

 
        PROC drawhole 
            xor ax, ax
            xor bh, 0h
            mov cx, [holex]
            mov dx, [holey]
            mov bx, offset holechar
            call DrawCharacter
		    ; DRAW_HOLE_HORIZONTAL:
            ;     mov ah, 0ch
            ;     mov al, 00h
            ;     mov bh, 01h
            ;     int 10h 
            ;     inc cx
            ;     MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			;     SUB AX, [holex]
			;     CMP AX, [hole_size]
			;     JNG DRAW_HOLE_HORIZONTAL    ;cx-ballx > ballsize
            ;     
            ;     MOV CX, [holex]				 ;the CX register goes back to the initial column
			;     INC DX       				 ;we advance one line
			;     MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			;     SUB AX, [holey]
			;     CMP AX, [hole_size]
			;     JNG DRAW_HOLE_HORIZONTAL
            ret
        ENDP drawhole 
        PROC drawf
            xor ax, ax
            xor bh, 0h
            mov cx, [fx]
            mov dx, [fy]

		    DRAW_F_HORIZONTAL:
                mov ah, 0ch
                mov al, 02h
                mov bh, 01h
                int 10h 
                inc cx
                MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			    SUB AX, [fx]
			    CMP AX, [ff]
			    JNG DRAW_F_HORIZONTAL    ;cx-ballx > ballsize
                
                MOV CX, [fx]				 ;the CX register goes back to the initial column
			    INC DX       				 ;we advance one line
			    MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			    SUB AX, [fy]
			    CMP AX, [ff]
			    JNG DRAW_F_HORIZONTAL
            ret
        ENDP drawf

        PROC move_ball
            mov ax, [ballx]
            add ax, [ballxspeed]
            cmp ax, 00h
            jle negxspeed
            mov bx, [WINDOW_WIDTH]
            sub bx, [ball_size]
            cmp ax,bx
            jge negxspeed
            mov ax, [ballxspeed]
            add [ballx], ax
        yyy:
            mov ax, [ballyspeed]
            add ax, [bally]
            cmp ax, 00h
            jle negyspeed
            mov bx, [WINDOW_HEIGHT]
            sub bx, [ball_size]
            cmp ax,bx
            jge negyspeed
            mov ax, [ballyspeed]
            add [bally], ax
            ret
            negxspeed:
                neg [ballxspeed]
            negnegx:
                mov ax, [ballxspeed]
                add [ballx], ax
                mov ax, [ballx]
                cmp ax, 0h
                jle negnegx
                mov bx, [WINDOW_WIDTH]
                sub bx, [ball_size]
                cmp ax,bx
                jge negxspeed
                jmp yyy        
            negyspeed:
                neg [ballyspeed]
            negnegy:
                mov ax, [ballyspeed]
                add [bally], ax
                mov ax, [bally]
                cmp ax, 0h
                jle negyspeed
                mov bx, [WINDOW_HEIGHT]
                sub bx, [ball_size]
                cmp ax,bx
                jge negyspeed
                ret
        ENDP move_ball

        PROC drawdot
            xor ax, ax
            mov bh, 0h
            mov cx, [dotx]
            mov dx, [doty]
            mov bx, offset dotchar
            call DrawCharacter

		    ; DRAW_DOT_HORIZONTAL:
            ;     mov ah, 0ch
            ;     mov al, 03h
            ;     mov bh, 00h
            ;     int 10h 
            ;     inc cx
            ;     MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			;     SUB AX, [dotx]
			;     CMP AX, [dot_size]
			;     JNG DRAW_DOT_HORIZONTAL      ;cx-ballx > ballsize
            ;     
            ;     MOV CX, [dotx]				 ;the CX register goes back to the initial column
			;     INC DX       				 ;we advance one line
			;     MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			;     SUB AX, [doty]
			;     CMP AX, [dot_size]
			;     JNG DRAW_DOT_HORIZONTAL
            ret
        ENDP drawdot  

        PROC drawdott
            xor ax, ax
            mov bh, 0h
            mov cx, [dotxx]
            mov dx, [dotyy]
            mov bx, offset dotcharp
            call DrawCharacter
            ret
        endp drawdott

		PROC move_dot_l
			mov ax, [dotx]
            mov [dotxx], ax
            mov ax, [doty]
            mov [dotyy], ax
			mov ax, [ballx]
			cmp [dotx], ax 
			JE comp1l
			JG comp2l
			jl comp3l

			comp1l:
				mov ax, [bally]
				cmp [doty], ax
				jl rev1l
				jg rev3l

			comp2l:
				mov ax, [bally]
				cmp [doty], ax
				JE rev4ll
				jl rev4ll
				jg rev3l

			comp3l:
				mov ax, [bally]
				cmp [doty], ax
				je rev2l
				jg rev2l
				jl rev1l

			rev1l:
                cmp [dotx], 1
                jle revnonee
				inc [doty]
				sub [dotx], 1
				ret

			rev2l:
                cmp [doty], 195
                jge revnonee
				inc [dotx]
				inc [doty]
				ret
            rev4ll:
                jmp rev4l
            revnonee:
                ret

			rev3l:

                cmp [dotx], 315
                jge revnonee

				inc [dotx]
				sub [doty], 1
				ret

			rev4l:
                cmp [doty], 1
                jle revnonee
				sub [dotx], 1
				sub [doty], 1
				ret
            
        ENDP move_dot_l

		PROC move_dot_r
			mov ax, [dotx]
            mov [dotxx], ax
            mov ax, [doty]
            mov [dotyy], ax
			mov ax, [ballx]
			cmp [dotx], ax 
			JE comp1
			JG comp2
			jl comp3

			comp1:
				mov ax, [bally]
				cmp [doty], ax
				jl rev4
				jg rev222

			comp2:
				mov ax, [bally]
				cmp [doty], ax
				JE rev3
				jl rev4
				jg rev3

			comp3:
				mov ax, [bally]
				cmp [doty], ax
				je rev1
				jg rev2
				jl rev1

			rev3:
                cmp [doty], 195
                jge revnone
				inc [doty]
				sub [dotx], 1
				ret
            rev222:
                jmp rev2

			rev4:
                cmp [dotx], 315
                jge revnone
				inc [dotx]
				inc [doty]
				ret
            revnone:
                ret

			rev1:
                cmp [doty], 1
                jle revnone
				inc [dotx]
				sub [doty], 1
				ret

			rev2:
                cmp [dotx], 1
                jle revnone
				sub [dotx], 1
				sub [doty], 1
				ret
            ; revnone:
            ;     ret
            
        ENDP move_dot_r

    



















        proc OpenFile
        ; Open file
            mov ah, 3Dh
            xor al, al
            mov dx, offset filename
            int 21h
            jc openerror
            mov [filehandle], ax
            ret
        openerror:
            mov dx, offset ErrorMsg
            mov ah, 9h
            int 21h
            ret
        endp OpenFile
        proc ReadHeader
        ; Read BMP file header, 54 bytes
            mov ah,3fh
            mov bx, [filehandle]
            mov cx,54
            mov dx,offset Header
            int 21h
            ret
        endp ReadHeader
        proc ReadPalette
        ; Read BMP file color palette, 256 colors * 4 bytes (400h)
            mov ah,3fh
            mov cx,400h
            mov dx,offset Palette
            int 21h
            ret
        endp ReadPalette
        proc CopyPal
        ; Copy the colors palette to the video memory
        ; The number of the first color should be sent to port 3C8h
        ; The palette is sent to port 3C9h
            mov si,offset Palette
            mov cx,256
            mov dx,3C8h
            mov al,0
            ; Copy starting color to port 3C8h
            out dx,al
            ; Copy palette itself to port 3C9h
            inc dx
        PalLoop:
            ; Note: Colors in a BMP file are saved as BGR values rather than RGB.
            mov al,[si+2] ; Get red value.
            shr al,2 ; Max. is 255, but video palette maximal
            ; value is 63. Therefore dividing by 4.
            out dx,al ; Send it.
            mov al,[si+1] ; Get green value.
            shr al,2
            out dx,al ; Send it.
            mov al,[si] ; Get blue value.
            shr al,2
            out dx,al ; Send it.
            add si,4 ; Point to next color.
            ; (There is a null chr. after every color.
            loop PalLoop
            ret
        endp CopyPal
        proc CopyBitmap
        ; BMP graphics are saved upside-down.
        ; Read the graphic line by line (200 lines in VGA format),
        ; displaying the lines from bottom to top.
            mov ax, 0A000h
            mov es, ax
            mov cx,200
        PrintBMPLoop:
            push cx
            ; di = cx*320, point to the correct screen line
            mov di,cx
            shl cx,6
            shl di,8
            add di,cx
            ; Read one line
            mov ah,3fh
            mov cx,320
            mov dx,offset ScrLine
            int 21h
            ; Copy one line into video memory
            cld ; Clear direction flag, for movsb
            mov cx,320
            mov si,offset ScrLine
            rep movsb ; Copy line to the screen
            ;rep movsb is same as the following code:
            ;mov es:di, ds:si
            ;inc si
            ;inc di
            ;dec cx
            ;loop until cx=0
            pop cx
            loop PrintBMPLoop
            ret
        endp CopyBitmap
        mov ah, 00h
        int 16h
    Exit:
        mov ax, 4C00h
        int 21h
END start