.include "m16def.inc" 
.def temp=r16 
;-----назначение регистров-----
.def aexp=r17
.def am=r18
.def dexp=r19
.def dm=r20
.def xexp=r21
.def xm=r22
.def d=r23
.def n=r24
.def i=r25
.def k=r27
.org 0x0000 ; 
rjmp reset ; 
.org 0x0030 ; 
reset:
ldi temp,low(RAMEND) ; 
out SPL,TEMP ; 
ldi temp,high(RAMEND)
out SPH,TEMP
;------назначение значений регистрам------
ldi aexp,49
ldi am,1
ldi dexp,1
ldi dm,1
ldi xexp,1
ldi xm ,-1
ldi d,1
ldi i,4
ldi k,0

mrt1:
cp k,i
breq exit;k<i
;------подпрограмма-----
rcall kish
;-----сравнение --------
cp n,xm
breq exit;y=x
cp n,xm
brne m3;y не равно x
; --- Выход ---
exit:
nop
;-----вызов подпрограммы-------
kish:
lsr dexp;d/2
lsr aexp
lsr aexp
lsr aexp;a/8
mul aexp,xexp
mov aexp,r0
mul am,xm
mov am,r0
add xexp,aexp
mul dexp,xexp
mul dm,xm
mov dm,r0
ret
m3:
dec i
mov aexp,n; x=y
rjmp mrt1
ret
//1 Мг= 154,00
//4 Мг= 38,50
