module run_proc_0021

use kind_values
use lattice
use proclist_pars

implicit none
contains

subroutine run_proc_ru_interaction_6(cell)

    integer(kind=iint), dimension(4), intent(in) :: cell


! Disable processes

    if(can_do(ru_interaction_0,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_0,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_1,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_1,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_10,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_10,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_10,cell + (/ -1, -1, 0, 1/))) then
        call del_proc(ru_interaction_10,cell + (/ -1, -1, 0, 1/))
    end if
    if(can_do(ru_interaction_11,cell + (/ -1, -1, -1, 1/))) then
        call del_proc(ru_interaction_11,cell + (/ -1, -1, -1, 1/))
    end if
    if(can_do(ru_interaction_11,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_11,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_12,cell + (/ 0, 0, -1, 1/))) then
        call del_proc(ru_interaction_12,cell + (/ 0, 0, -1, 1/))
    end if
    if(can_do(ru_interaction_13,cell + (/ 0, -1, -1, 1/))) then
        call del_proc(ru_interaction_13,cell + (/ 0, -1, -1, 1/))
    end if
    if(can_do(ru_interaction_14,cell + (/ -1, 0, -1, 1/))) then
        call del_proc(ru_interaction_14,cell + (/ -1, 0, -1, 1/))
    end if
    if(can_do(ru_interaction_15,cell + (/ -1, -2, -1, 1/))) then
        call del_proc(ru_interaction_15,cell + (/ -1, -2, -1, 1/))
    end if
    if(can_do(ru_interaction_16,cell + (/ -2, -1, -1, 1/))) then
        call del_proc(ru_interaction_16,cell + (/ -2, -1, -1, 1/))
    end if
    if(can_do(ru_interaction_17,cell + (/ -2, -2, -1, 1/))) then
        call del_proc(ru_interaction_17,cell + (/ -2, -2, -1, 1/))
    end if
    if(can_do(ru_interaction_2,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_2,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_3,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_3,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_4,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_4,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_5,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_5,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_6,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_6,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_7,cell + (/ 0, 0, -1, 1/))) then
        call del_proc(ru_interaction_7,cell + (/ 0, 0, -1, 1/))
    end if
    if(can_do(ru_interaction_7,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_7,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_8,cell + (/ -1, 0, 0, 1/))) then
        call del_proc(ru_interaction_8,cell + (/ -1, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_8,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_8,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_9,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(ru_interaction_9,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(ru_interaction_9,cell + (/ -1, 0, -1, 1/))) then
        call del_proc(ru_interaction_9,cell + (/ -1, 0, -1, 1/))
    end if

! Update the lattice
    call replace_species(cell + (/-1, -1, -1, ru_slab_p2/),empty,ru)
    call replace_species(cell + (/0, 0, 0, ru_slab_p1/),ru,empty)

! Update rate constants

    if(can_do(ru_interaction_0,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_0(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_0(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_0(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 2, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 2, 1, 0, 1/),gr_ru_interaction_0(cell + (/ 2, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_0(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 1, 2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 1, 2, 0, 1/),gr_ru_interaction_0(cell + (/ 1, 2, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_0(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_0(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_0(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_0(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 1, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 1, 1, -1, 1/),gr_ru_interaction_0(cell + (/ 1, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_0(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 2, 2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 2, 2, 0, 1/),gr_ru_interaction_0(cell + (/ 2, 2, 0, 0/)))
    end if
    if(can_do(ru_interaction_0,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_0,cell + (/ 0, 1, -1, 1/),gr_ru_interaction_0(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_1(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_1(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 1, 0, -1, 1/),gr_ru_interaction_1(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_1(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_1(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 2, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 2, 1, 0, 1/),gr_ru_interaction_1(cell + (/ 2, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_1(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_1(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_1(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_1(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 2, 0, 0, 1/),gr_ru_interaction_1(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_1(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ 1, -1, 0, 1/),gr_ru_interaction_1(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_1,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_1,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_1(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_10(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ 0, -1, 1, 1/),gr_ru_interaction_10(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_10(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_10(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_10(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ -2, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ -2, -1, 0, 1/),gr_ru_interaction_10(cell + (/ -2, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_10(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ -2, -2, 0, 1/),gr_ru_interaction_10(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ -1, -1, 1, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ -1, -1, 1, 1/),gr_ru_interaction_10(cell + (/ -1, -1, 1, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_10(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_10(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_10(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ -1, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ -1, -2, 0, 1/),gr_ru_interaction_10(cell + (/ -1, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_10,cell + (/ 0, 0, 1, 1/))) then
        call update_rates_matrix(ru_interaction_10,cell + (/ 0, 0, 1, 1/),gr_ru_interaction_10(cell + (/ 0, 0, 1, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_11(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_11(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_11(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_11(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_11(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_11(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_11(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_11(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_11(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_11(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_11(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_11,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_11,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_11(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_12(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_12(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 1, 0, -1, 1/),gr_ru_interaction_12(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_12(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_12(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_12(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_12(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_12(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_12(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_12(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_12(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_12(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 1, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 1, 1, -1, 1/),gr_ru_interaction_12(cell + (/ 1, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_12,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_12,cell + (/ 0, 1, -1, 1/),gr_ru_interaction_12(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 0, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 0, -2, -1, 1/),gr_ru_interaction_13(cell + (/ 0, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 1, 0, -1, 1/),gr_ru_interaction_13(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_13(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_13(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_13(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_13(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_13(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_13(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 1, -1, -1, 1/),gr_ru_interaction_13(cell + (/ 1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_13(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_13(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_13(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ 1, -1, 0, 1/),gr_ru_interaction_13(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_13,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_13,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_13(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_14(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -1, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -1, 1, -1, 1/),gr_ru_interaction_14(cell + (/ -1, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_14(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -2, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -2, 0, -1, 1/),gr_ru_interaction_14(cell + (/ -2, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_14(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_14(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_14(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_14(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_14(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_14(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_14(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_14(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_14(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_14,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_14,cell + (/ 0, 1, -1, 1/),gr_ru_interaction_14(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_15(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ 0, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ 0, -2, -1, 1/),gr_ru_interaction_15(cell + (/ 0, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_15(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -2, -3, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -2, -3, -1, 1/),gr_ru_interaction_15(cell + (/ -2, -3, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_15(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_15(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_15(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_15(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_15(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ 0, -2, 0, 1/),gr_ru_interaction_15(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -1, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -1, -2, 0, 1/),gr_ru_interaction_15(cell + (/ -1, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_15(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_15(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_15,cell + (/ -1, -3, -1, 1/))) then
        call update_rates_matrix(ru_interaction_15,cell + (/ -1, -3, -1, 1/),gr_ru_interaction_15(cell + (/ -1, -3, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_16(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_16(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -2, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -2, 0, -1, 1/),gr_ru_interaction_16(cell + (/ -2, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_16(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_16(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -3, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -3, -2, -1, 1/),gr_ru_interaction_16(cell + (/ -3, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_16(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_16(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_16(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -2, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -2, -1, 0, 1/),gr_ru_interaction_16(cell + (/ -2, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_16(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_16(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_16(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_16,cell + (/ -3, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_16,cell + (/ -3, -1, -1, 1/),gr_ru_interaction_16(cell + (/ -3, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_17(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_17(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_17(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_17(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -3, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -3, -2, -1, 1/),gr_ru_interaction_17(cell + (/ -3, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_17(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_17(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_17(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -1, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -1, -2, 0, 1/),gr_ru_interaction_17(cell + (/ -1, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -2, -2, 0, 1/),gr_ru_interaction_17(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_17(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_17(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -3, -3, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -3, -3, -1, 1/),gr_ru_interaction_17(cell + (/ -3, -3, -1, 0/)))
    end if
    if(can_do(ru_interaction_17,cell + (/ -2, -3, -1, 1/))) then
        call update_rates_matrix(ru_interaction_17,cell + (/ -2, -3, -1, 1/),gr_ru_interaction_17(cell + (/ -2, -3, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_18(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_18(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_18(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_18(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_18(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_18(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_18(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_18(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_18(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_18(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_18(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_18(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_18(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_18,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_18,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_18(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_19(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 1, 0, -1, 1/),gr_ru_interaction_19(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_19(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -1, 0, -2, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -1, 0, -2, 1/),gr_ru_interaction_19(cell + (/ -1, 0, -2, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_19(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_19(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_19(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -1, -1, -2, 1/),gr_ru_interaction_19(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_19(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_19(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_19(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 0, 0, -2, 1/),gr_ru_interaction_19(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_19(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 1, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 1, 1, -1, 1/),gr_ru_interaction_19(cell + (/ 1, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_19(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_19,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_19,cell + (/ 0, 1, -1, 1/),gr_ru_interaction_19(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ -1, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ -1, 1, -1, 1/),gr_ru_interaction_2(cell + (/ -1, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_2(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_2(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_2(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 1, 2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 1, 2, 0, 1/),gr_ru_interaction_2(cell + (/ 1, 2, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_2(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 0, 2, 0, 1/),gr_ru_interaction_2(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_2(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_2(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_2(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ -1, 1, 0, 1/),gr_ru_interaction_2(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_2(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_2(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_2,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_2,cell + (/ 0, 1, -1, 1/),gr_ru_interaction_2(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_20(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_20(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_20(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_20(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_20(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_20(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ -1, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ -1, -2, 0, 1/),gr_ru_interaction_20(cell + (/ -1, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_20(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_20(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_20(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ 0, -2, 0, 1/),gr_ru_interaction_20(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_20(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ 1, -1, 0, 1/),gr_ru_interaction_20(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_20,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_20,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_20(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_21(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 0, -1, -2, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 0, -1, -2, 1/),gr_ru_interaction_21(cell + (/ 0, -1, -2, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 0, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 0, -2, -1, 1/),gr_ru_interaction_21(cell + (/ 0, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 1, 0, -1, 1/),gr_ru_interaction_21(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_21(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_21(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_21(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_21(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -1, -1, -2, 1/),gr_ru_interaction_21(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -1, -2, -2, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -1, -2, -2, 1/),gr_ru_interaction_21(cell + (/ -1, -2, -2, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_21(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_21(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_21(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 1, -1, -1, 1/),gr_ru_interaction_21(cell + (/ 1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_21(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_21,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_21,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_21(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_22(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_22(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_22(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_22(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_22(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -2, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -2, -1, 0, 1/),gr_ru_interaction_22(cell + (/ -2, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -2, -2, 0, 1/),gr_ru_interaction_22(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_22(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_22(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_22(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -1, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -1, -2, 0, 1/),gr_ru_interaction_22(cell + (/ -1, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_22(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_22(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_22,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_22,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_22(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_23(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_23(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_23(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_23(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_23(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -1, -1, -2, 1/),gr_ru_interaction_23(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -2, -1, -2, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -2, -1, -2, 1/),gr_ru_interaction_23(cell + (/ -2, -1, -2, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -2, -2, -2, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -2, -2, -2, 1/),gr_ru_interaction_23(cell + (/ -2, -2, -2, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ 0, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ 0, 0, 0, 1/),gr_ru_interaction_23(cell + (/ 0, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_23(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_23(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_23,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_23,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_23(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_3(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_3(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_3(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_3(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_3(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ -1, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ -1, -2, 0, 1/),gr_ru_interaction_3(cell + (/ -1, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_3(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ -1, -2, -1, 1/),gr_ru_interaction_3(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 0, -2, 0, 1/),gr_ru_interaction_3(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_3(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_3(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_3(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ 1, -1, 0, 1/),gr_ru_interaction_3(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_3,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_3,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_3(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_4(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_4(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_4(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -2, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -2, 0, -1, 1/),gr_ru_interaction_4(cell + (/ -2, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_4(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -2, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -2, -1, 0, 1/),gr_ru_interaction_4(cell + (/ -2, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_4(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_4(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_4(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_4(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -2, 0, 0, 1/),gr_ru_interaction_4(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -1, 1, 0, 1/),gr_ru_interaction_4(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_4(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_4,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_4,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_4(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_5(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_5(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_5(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_5(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -2, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -2, -1, 0, 1/),gr_ru_interaction_5(cell + (/ -2, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_5(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -2, -2, 0, 1/),gr_ru_interaction_5(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -2, -2, -1, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -2, -2, -1, 1/),gr_ru_interaction_5(cell + (/ -2, -2, -1, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_5(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_5(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -1, -2, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -1, -2, 0, 1/),gr_ru_interaction_5(cell + (/ -1, -2, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_5(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_5(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_5,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_5,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_5(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 1, 0, 1, 1/),gr_ru_interaction_6(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_6(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_6(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_6(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_6(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_6(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_6(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_6(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_6(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_6(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 0, 0, 1, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 0, 0, 1, 1/),gr_ru_interaction_6(cell + (/ 0, 0, 1, 0/)))
    end if
    if(can_do(ru_interaction_6,cell + (/ 1, 1, 1, 1/))) then
        call update_rates_matrix(ru_interaction_6,cell + (/ 1, 1, 1, 1/),gr_ru_interaction_6(cell + (/ 1, 1, 1, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 0, -1, -1, 1/),gr_ru_interaction_7(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_7(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 1, 0, -1, 1/),gr_ru_interaction_7(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_7(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_7(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_7(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_7(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_7(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_7(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 1, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 1, 1, -1, 1/),gr_ru_interaction_7(cell + (/ 1, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_7(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_7,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_7,cell + (/ 0, 1, -1, 1/),gr_ru_interaction_7(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_8(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ -1, 0, 1, 1/),gr_ru_interaction_8(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_8(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ -1, 0, -1, 1/),gr_ru_interaction_8(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_8(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ -2, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ -2, -1, 0, 1/),gr_ru_interaction_8(cell + (/ -2, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_8(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_8(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ -2, 0, 0, 1/),gr_ru_interaction_8(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ -1, 1, 0, 1/),gr_ru_interaction_8(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_8(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_8(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ 0, 0, 1, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ 0, 0, 1, 1/),gr_ru_interaction_8(cell + (/ 0, 0, 1, 0/)))
    end if
    if(can_do(ru_interaction_8,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(ru_interaction_8,cell + (/ 0, 1, 1, 1/),gr_ru_interaction_8(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ -1, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ -1, 1, -1, 1/),gr_ru_interaction_9(cell + (/ -1, 1, -1, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ 1, 1, 0, 1/),gr_ru_interaction_9(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ 0, 1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ 0, 1, 0, 1/),gr_ru_interaction_9(cell + (/ 0, 1, 0, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ -2, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ -2, 0, -1, 1/),gr_ru_interaction_9(cell + (/ -2, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ -1, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ -1, -1, -1, 1/),gr_ru_interaction_9(cell + (/ -1, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ -2, -1, -1, 1/),gr_ru_interaction_9(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ 0, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ 0, -1, 0, 1/),gr_ru_interaction_9(cell + (/ 0, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ 1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ 1, 0, 0, 1/),gr_ru_interaction_9(cell + (/ 1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ -1, 0, 0, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ -1, 0, 0, 1/),gr_ru_interaction_9(cell + (/ -1, 0, 0, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ 0, 0, -1, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ 0, 0, -1, 1/),gr_ru_interaction_9(cell + (/ 0, 0, -1, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ -1, -1, 0, 1/),gr_ru_interaction_9(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(ru_interaction_9,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(ru_interaction_9,cell + (/ 0, 1, -1, 1/),gr_ru_interaction_9(cell + (/ 0, 1, -1, 0/)))
    end if

! Enable processes

    call add_proc(ru_interaction_23, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_23(cell + (/ -1, -1, -1, 0/)))
    select case(get_species(cell + (/0, -1, -1, ru_slab_p2/)))
    case(ru)
        call add_proc(ru_interaction_21, cell + (/ 0, -1, -1, 1/), gr_ru_interaction_21(cell + (/ 0, -1, -1, 0/)))
    case(empty)
        call add_proc(ru_interaction_16, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_16(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/0, 0, -1, ru_slab_p2/)))
    case(ru)
        call add_proc(ru_interaction_19, cell + (/ 0, 0, -1, 1/), gr_ru_interaction_19(cell + (/ 0, 0, -1, 0/)))
    case(empty)
        call add_proc(ru_interaction_17, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_17(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/-1, -1, 0, ru_slab_p1/)))
    case(ru)
        call add_proc(ru_interaction_5, cell + (/ -1, -1, 0, 1/), gr_ru_interaction_5(cell + (/ -1, -1, 0, 0/)))
    case(empty)
        call add_proc(ru_interaction_19, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_19(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/-1, 0, 0, ru_slab_p1/)))
    case(ru)
        call add_proc(ru_interaction_4, cell + (/ -1, 0, 0, 1/), gr_ru_interaction_4(cell + (/ -1, 0, 0, 0/)))
    case(empty)
        call add_proc(ru_interaction_21, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_21(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/1, 1, 0, ru_slab_p1/)))
    case(ru)
        call add_proc(ru_interaction_0, cell + (/ 1, 1, 0, 1/), gr_ru_interaction_0(cell + (/ 1, 1, 0, 0/)))
    end select

    select case(get_species(cell + (/1, 0, 0, ru_slab_p1/)))
    case(ru)
        call add_proc(ru_interaction_1, cell + (/ 1, 0, 0, 1/), gr_ru_interaction_1(cell + (/ 1, 0, 0, 0/)))
    end select

    select case(get_species(cell + (/-2, -2, -1, ru_slab_p2/)))
    case(empty)
        call add_proc(ru_interaction_12, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_12(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/-2, -1, -1, ru_slab_p2/)))
    case(empty)
        call add_proc(ru_interaction_13, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_13(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/-1, -2, -1, ru_slab_p2/)))
    case(empty)
        call add_proc(ru_interaction_14, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_14(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/-1, 0, -1, ru_slab_p2/)))
    case(empty)
        call add_proc(ru_interaction_15, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_15(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/-1, -1, -1, ru_slab_p1/)))
    case(empty)
        call add_proc(ru_interaction_18, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_18(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/0, 0, 0, ru_slab_p2/)))
    case(ru)
        call add_proc(ru_interaction_18, cell + (/ 0, 0, 0, 1/), gr_ru_interaction_18(cell + (/ 0, 0, 0, 0/)))
    end select

    select case(get_species(cell + (/0, 1, 0, ru_slab_p1/)))
    case(ru)
        call add_proc(ru_interaction_2, cell + (/ 0, 1, 0, 1/), gr_ru_interaction_2(cell + (/ 0, 1, 0, 0/)))
    end select

    select case(get_species(cell + (/-1, 0, -1, ru_slab_p1/)))
    case(empty)
        call add_proc(ru_interaction_20, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_20(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/0, -1, 0, ru_slab_p2/)))
    case(ru)
        call add_proc(ru_interaction_20, cell + (/ 0, -1, 0, 1/), gr_ru_interaction_20(cell + (/ 0, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/0, 0, -1, ru_slab_p1/)))
    case(empty)
        call add_proc(ru_interaction_22, cell + (/ -1, -1, -1, 1/), gr_ru_interaction_22(cell + (/ -1, -1, -1, 0/)))
    end select

    select case(get_species(cell + (/-1, -1, 0, ru_slab_p2/)))
    case(ru)
        call add_proc(ru_interaction_22, cell + (/ -1, -1, 0, 1/), gr_ru_interaction_22(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/0, -1, 0, ru_slab_p1/)))
    case(ru)
        call add_proc(ru_interaction_3, cell + (/ 0, -1, 0, 1/), gr_ru_interaction_3(cell + (/ 0, -1, 0, 0/)))
    end select


end subroutine run_proc_ru_interaction_6

end module run_proc_0021
