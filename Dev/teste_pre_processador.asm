main:

loadn r0, #256 ; 0x0100
loadn r1, #45678
storei r0, r1
@GET r1, r0, r2, EBPos.y
halt