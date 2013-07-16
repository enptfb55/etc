#set complaints 1
# --------------------patch---------------------
define nop
    set * (unsigned char *) $arg0 = 0x90
end
document nop
Patch byte at address arg0 to a NOP insn
Usage: nop addr
end
define nopn
    set $nop_off = 0
    set $nop_adr = $arg0
    while ( $nop_off < $arg1 )
        nop $nop_adr
        set $nop_adr = $nop_adr + 1
        set $nop_off = $nop_off + 1
    end
end
document nopn
Patch arg1 bytes at address arg0 to a NOP insn
Usage: nopn addr count
end
#
define retf
    set *(unsigned char*)$arg0 = 0xC3
end
document retf
Patch function arg0 to return at enter
end
#
define null
    set * (unsigned char *) $arg0 = 0
end
document null
Patch byte at address arg0 to  NULL
Usage: null addr
end
#
define int3
    set * (unsigned char *) $arg0 = 0xCC
end
document int3
Patch byte at address arg0 to an INT3 insn
Usage: int3 addr
end
#
# Quickly attaches to a running process, dumps
# threads state and releases
#
define snap
    dont-repeat
    set pagination off
    set print vtbl on
    set print demangle on
    set print union on
    set print object on
    set print pretty on
    set print array on
    set print object on
    set print static-members on
    set logging file gdb.log
    set logging redirect on
    set logging on
    attach $arg0
    thread apply all bt full
    output $_siginfo
    detach
end
document snap
usage: snap PID - attaches to process, dumps all threads state, detaches.
end

define snap_file
    dont-repeat
    set pagination off
    set print vtbl on
    set print demangle on
    set print union on
    set print object on
    set print pretty on
    set print array on
    set print object on
    set print static-members on
    set logging file $arg0
    set logging redirect on
    set logging on
    thread apply all bt full
    set logging redirect off
    set logging off
end
document snap_file
usage: snap FILE - dumps all threads state to FILE.
end


