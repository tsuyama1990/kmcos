module run_proc_0005

use kind_values
use lattice
use proclist_pars

implicit none
contains

subroutine run_proc_FePt_interaction_2(cell)

    integer(kind=iint), dimension(4), intent(in) :: cell


! Disable processes

    if(can_do(FePt_interaction_0,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_0,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, 0, 1, 1/))) then
        call del_proc(FePt_interaction_0,cell + (/ -1, 0, 1, 1/))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_1,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, -1, 1, 1/))) then
        call del_proc(FePt_interaction_1,cell + (/ 0, -1, 1, 1/))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, -1, -1, 1/))) then
        call del_proc(FePt_interaction_10,cell + (/ -2, -1, -1, 1/))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_10,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_11,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -2, 0, 1/))) then
        call del_proc(FePt_interaction_11,cell + (/ -2, -2, 0, 1/))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_2,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_3,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, 0, -1, 1/))) then
        call del_proc(FePt_interaction_3,cell + (/ -1, 0, -1, 1/))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_4,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, -1, 1, 1/))) then
        call del_proc(FePt_interaction_4,cell + (/ -2, -1, 1, 1/))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_5,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -2, 0, 1/))) then
        call del_proc(FePt_interaction_5,cell + (/ 0, -2, 0, 1/))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_6,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -2, 1, 1/))) then
        call del_proc(FePt_interaction_6,cell + (/ -1, -2, 1, 1/))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, -1, -1, 1/))) then
        call del_proc(FePt_interaction_7,cell + (/ 0, -1, -1, 1/))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_7,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_8,cell + (/ 0, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, 0, 0, 1/))) then
        call del_proc(FePt_interaction_8,cell + (/ -2, 0, 0, 1/))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -2, -1, 1/))) then
        call del_proc(FePt_interaction_9,cell + (/ -1, -2, -1, 1/))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, 0, 0, 1/))) then
        call del_proc(FePt_interaction_9,cell + (/ 0, 0, 0, 1/))
    end if

! Update the lattice
    call replace_species(cell + (/0, 0, 0, fept_origin/),fe,pt)
    call replace_species(cell + (/-1, -1, 0, fept_origin/),pt,fe)

! Update rate constants

    if(can_do(FePt_interaction_0,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_0(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_0(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_0(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -2, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -2, 1, 1, 1/),gr_FePt_interaction_0(cell + (/ -2, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 1, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 1, 3, 1/),gr_FePt_interaction_0(cell + (/ 0, 1, 3, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_0(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_0(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -2, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -2, 0, 2, 1/),gr_FePt_interaction_0(cell + (/ -2, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_0(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_0(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_0(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_0(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_0(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_0(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_0(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_0(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_0(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_0(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_0(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_0(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 1, 2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 1, 2, 1, 1/),gr_FePt_interaction_0(cell + (/ 1, 2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_0(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_0(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, 2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, 2, 1, 1/),gr_FePt_interaction_0(cell + (/ -1, 2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 1, 1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 1, 1, 2, 1/),gr_FePt_interaction_0(cell + (/ 1, 1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_0(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_0(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_0(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_0(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_0(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, 1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, 1, 2, 1/),gr_FePt_interaction_0(cell + (/ -1, 1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 2, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 2, 1, 1, 1/),gr_FePt_interaction_0(cell + (/ 2, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 3, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 3, 1, 1/),gr_FePt_interaction_0(cell + (/ 0, 3, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -3, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -3, 0, 1, 1/),gr_FePt_interaction_0(cell + (/ -3, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -1, 0, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -1, 0, 3, 1/),gr_FePt_interaction_0(cell + (/ -1, 0, 3, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_0(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_0(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_0,cell + (/ 0, 2, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_0,cell + (/ 0, 2, 2, 1/),gr_FePt_interaction_0(cell + (/ 0, 2, 2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_1(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 2, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 2, 0, 2, 1/),gr_FePt_interaction_1(cell + (/ 2, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_1(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_1(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, -2, 1, 1/),gr_FePt_interaction_1(cell + (/ 1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_1(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 2, -1, 1, 1/),gr_FePt_interaction_1(cell + (/ 2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_1(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_1(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_1(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_1(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_1(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_1(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_1(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_1(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_1(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_1(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, -1, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, -1, 3, 1/),gr_FePt_interaction_1(cell + (/ 0, -1, 3, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_1(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_1(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, 2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, 2, 1, 1/),gr_FePt_interaction_1(cell + (/ 1, 2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_1(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_1(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_1(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, 1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, 1, 2, 1/),gr_FePt_interaction_1(cell + (/ 1, 1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, 0, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, 0, 3, 1/),gr_FePt_interaction_1(cell + (/ 1, 0, 3, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, -3, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, -3, 1, 1/),gr_FePt_interaction_1(cell + (/ 0, -3, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_1(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_1(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_1(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_1(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, -2, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, -2, 2, 1/),gr_FePt_interaction_1(cell + (/ 0, -2, 2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_1(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 2, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 2, 1, 1, 1/),gr_FePt_interaction_1(cell + (/ 2, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 1, -1, 2, 1/),gr_FePt_interaction_1(cell + (/ 1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_1(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_1(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_1,cell + (/ 3, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_1,cell + (/ 3, 0, 1, 1/),gr_FePt_interaction_1(cell + (/ 3, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_10(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, 1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, 1, -2, 1/),gr_FePt_interaction_10(cell + (/ -1, 1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, 1, -1, 1/),gr_FePt_interaction_10(cell + (/ -2, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_10(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_10(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_10(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_10(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -4, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -4, -1, -1, 1/),gr_FePt_interaction_10(cell + (/ -4, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_10(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_10(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_10(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_10(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_10(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_10(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_10(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_10(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, -2, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, -2, -2, 1/),gr_FePt_interaction_10(cell + (/ -2, -2, -2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_10(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_10(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_10(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_10(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, 2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, 2, -1, 1/),gr_FePt_interaction_10(cell + (/ -1, 2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, 0, -2, 1/),gr_FePt_interaction_10(cell + (/ -2, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_10(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_10(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_10(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, -1, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, -1, -3, 1/),gr_FePt_interaction_10(cell + (/ -2, -1, -3, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_10(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_10(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_10(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_10(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -3, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -3, -1, -2, 1/),gr_FePt_interaction_10(cell + (/ -3, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -3, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -3, -2, -1, 1/),gr_FePt_interaction_10(cell + (/ -3, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -3, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -3, 0, -1, 1/),gr_FePt_interaction_10(cell + (/ -3, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -1, 0, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -1, 0, -3, 1/),gr_FePt_interaction_10(cell + (/ -1, 0, -3, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_10(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_10(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_10,cell + (/ -2, -3, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_10,cell + (/ -2, -3, -1, 1/),gr_FePt_interaction_10(cell + (/ -2, -3, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_11(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_11(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_11(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -2, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, -2, 2, 1/),gr_FePt_interaction_11(cell + (/ -2, -2, 2, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_11(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_11(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_11(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_11(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_11(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_11(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_11(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_11(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_11(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_11(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_11(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_11(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -2, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, -2, -2, 1/),gr_FePt_interaction_11(cell + (/ -2, -2, -2, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_11(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_11(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_11(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_11(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_11(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -3, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -3, -3, 0, 1/),gr_FePt_interaction_11(cell + (/ -3, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -4, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -4, -2, 0, 1/),gr_FePt_interaction_11(cell + (/ -4, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -4, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, -4, 0, 1/),gr_FePt_interaction_11(cell + (/ -2, -4, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_11(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_11(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_11(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -3, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -3, -2, -1, 1/),gr_FePt_interaction_11(cell + (/ -3, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -3, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -3, -2, 1, 1/),gr_FePt_interaction_11(cell + (/ -3, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_11(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_11(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -3, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, -3, 1, 1/),gr_FePt_interaction_11(cell + (/ -2, -3, 1, 0/)))
    end if
    if(can_do(FePt_interaction_11,cell + (/ -2, -3, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_11,cell + (/ -2, -3, -1, 1/),gr_FePt_interaction_11(cell + (/ -2, -3, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_2(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_2(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_2(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_2(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_2(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 3, 0, 1/),gr_FePt_interaction_2(cell + (/ 1, 3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_2(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_2(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_2(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_2(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_2(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_2(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_2(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_2(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_2(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_2(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_2(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_2(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 2, -1, 1/),gr_FePt_interaction_2(cell + (/ 1, 2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 2, 1, 1/),gr_FePt_interaction_2(cell + (/ 1, 2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_2(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_2(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_2(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 1, 2, 1/),gr_FePt_interaction_2(cell + (/ 1, 1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_2(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_2(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_2(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 2, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 2, 2, 0, 1/),gr_FePt_interaction_2(cell + (/ 2, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 2, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 2, 1, -1, 1/),gr_FePt_interaction_2(cell + (/ 2, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_2(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_2(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 2, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 2, 1, 1, 1/),gr_FePt_interaction_2(cell + (/ 2, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 3, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 3, 1, 0, 1/),gr_FePt_interaction_2(cell + (/ 3, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_2(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_2(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_2,cell + (/ 1, 1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_2,cell + (/ 1, 1, -2, 1/),gr_FePt_interaction_2(cell + (/ 1, 1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_3(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, 1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, 1, -2, 1/),gr_FePt_interaction_3(cell + (/ -1, 1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -2, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -2, 1, -1, 1/),gr_FePt_interaction_3(cell + (/ -2, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_3(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_3(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 1, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 1, -3, 1/),gr_FePt_interaction_3(cell + (/ 0, 1, -3, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_3(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_3(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 2, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 2, -2, 1/),gr_FePt_interaction_3(cell + (/ 0, 2, -2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_3(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_3(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_3(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_3(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_3(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_3(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_3(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_3(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_3(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_3(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_3(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_3(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 1, 2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 1, 2, -1, 1/),gr_FePt_interaction_3(cell + (/ 1, 2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_3(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, 2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, 2, -1, 1/),gr_FePt_interaction_3(cell + (/ -1, 2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_3(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -2, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -2, 0, -2, 1/),gr_FePt_interaction_3(cell + (/ -2, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_3(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_3(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_3(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 2, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 2, 1, -1, 1/),gr_FePt_interaction_3(cell + (/ 2, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_3(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_3(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 3, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 3, -1, 1/),gr_FePt_interaction_3(cell + (/ 0, 3, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -3, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -3, 0, -1, 1/),gr_FePt_interaction_3(cell + (/ -3, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -1, 0, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -1, 0, -3, 1/),gr_FePt_interaction_3(cell + (/ -1, 0, -3, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_3(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_3(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_3,cell + (/ 1, 1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_3,cell + (/ 1, 1, -2, 1/),gr_FePt_interaction_3(cell + (/ 1, 1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_4(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_4(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_4(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, 1, 1, 1/),gr_FePt_interaction_4(cell + (/ -2, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, -2, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, -2, 2, 1/),gr_FePt_interaction_4(cell + (/ -2, -2, 2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_4(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_4(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -4, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -4, -1, 1, 1/),gr_FePt_interaction_4(cell + (/ -4, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, 0, 2, 1/),gr_FePt_interaction_4(cell + (/ -2, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_4(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_4(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_4(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_4(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_4(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_4(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_4(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_4(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_4(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_4(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -3, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -3, -1, 2, 1/),gr_FePt_interaction_4(cell + (/ -3, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_4(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_4(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_4(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_4(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, 2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, 2, 1, 1/),gr_FePt_interaction_4(cell + (/ -1, 2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_4(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, -1, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, -1, 3, 1/),gr_FePt_interaction_4(cell + (/ -2, -1, 3, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_4(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_4(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_4(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_4(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, 1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, 1, 2, 1/),gr_FePt_interaction_4(cell + (/ -1, 1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -3, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -3, -2, 1, 1/),gr_FePt_interaction_4(cell + (/ -3, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -3, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -3, 0, 1, 1/),gr_FePt_interaction_4(cell + (/ -3, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -1, 0, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -1, 0, 3, 1/),gr_FePt_interaction_4(cell + (/ -1, 0, 3, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_4(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_4(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_4,cell + (/ -2, -3, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_4,cell + (/ -2, -3, 1, 1/),gr_FePt_interaction_4(cell + (/ -2, -3, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_5(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -2, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, -2, -2, 1/),gr_FePt_interaction_5(cell + (/ 0, -2, -2, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_5(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_5(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, -3, 0, 1/),gr_FePt_interaction_5(cell + (/ 1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_5(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, -2, 1, 1/),gr_FePt_interaction_5(cell + (/ 1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, -2, -1, 1/),gr_FePt_interaction_5(cell + (/ 1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, -1, -2, 1/),gr_FePt_interaction_5(cell + (/ 1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 2, -1, -1, 1/),gr_FePt_interaction_5(cell + (/ 2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_5(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 2, -1, 1, 1/),gr_FePt_interaction_5(cell + (/ 2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_5(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 3, -1, 0, 1/),gr_FePt_interaction_5(cell + (/ 3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_5(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_5(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -4, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, -4, 0, 1/),gr_FePt_interaction_5(cell + (/ 0, -4, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_5(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_5(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_5(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_5(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_5(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_5(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_5(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_5(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 2, -2, 0, 1/),gr_FePt_interaction_5(cell + (/ 2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_5(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_5(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_5(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -3, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, -3, -1, 1/),gr_FePt_interaction_5(cell + (/ 0, -3, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -3, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, -3, 1, 1/),gr_FePt_interaction_5(cell + (/ 0, -3, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_5(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_5(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_5(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_5(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, -2, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, -2, 2, 1/),gr_FePt_interaction_5(cell + (/ 0, -2, 2, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_5(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 1, -1, 2, 1/),gr_FePt_interaction_5(cell + (/ 1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_5(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_5,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_5,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_5(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_6(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_6(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_6(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -2, -2, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -2, -2, 2, 1/),gr_FePt_interaction_6(cell + (/ -2, -2, 2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_6(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 1, -2, 1, 1/),gr_FePt_interaction_6(cell + (/ 1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_6(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 2, -1, 1, 1/),gr_FePt_interaction_6(cell + (/ 2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_6(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_6(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_6(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -4, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -4, 1, 1/),gr_FePt_interaction_6(cell + (/ -1, -4, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_6(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_6(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_6(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_6(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_6(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_6(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, -1, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, -1, 3, 1/),gr_FePt_interaction_6(cell + (/ 0, -1, 3, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_6(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_6(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_6(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_6(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_6(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, -3, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, -3, 1, 1/),gr_FePt_interaction_6(cell + (/ 0, -3, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -3, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -3, 2, 1/),gr_FePt_interaction_6(cell + (/ -1, -3, 2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_6(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -2, 3, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -2, 3, 1/),gr_FePt_interaction_6(cell + (/ -1, -2, 3, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_6(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_6(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_6(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, -2, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, -2, 2, 1/),gr_FePt_interaction_6(cell + (/ 0, -2, 2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_6(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -3, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -3, -2, 1, 1/),gr_FePt_interaction_6(cell + (/ -3, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 1, -1, 2, 1/),gr_FePt_interaction_6(cell + (/ 1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_6(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_6(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_6,cell + (/ -2, -3, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_6,cell + (/ -2, -3, 1, 1/),gr_FePt_interaction_6(cell + (/ -2, -3, 1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, -2, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, -2, -2, 1/),gr_FePt_interaction_7(cell + (/ 0, -2, -2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_7(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_7(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_7(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, -1, -2, 1/),gr_FePt_interaction_7(cell + (/ 1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, -2, -1, 1/),gr_FePt_interaction_7(cell + (/ 1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 2, -1, -1, 1/),gr_FePt_interaction_7(cell + (/ 2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_7(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_7(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_7(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_7(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_7(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_7(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_7(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 2, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 2, 0, -2, 1/),gr_FePt_interaction_7(cell + (/ 2, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_7(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_7(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_7(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_7(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, -1, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, -1, -3, 1/),gr_FePt_interaction_7(cell + (/ 0, -1, -3, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_7(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_7(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, 2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, 2, -1, 1/),gr_FePt_interaction_7(cell + (/ 1, 2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_7(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_7(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_7(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, 0, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, 0, -3, 1/),gr_FePt_interaction_7(cell + (/ 1, 0, -3, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, -3, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, -3, -1, 1/),gr_FePt_interaction_7(cell + (/ 0, -3, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_7(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_7(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_7(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 2, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 2, 1, -1, 1/),gr_FePt_interaction_7(cell + (/ 2, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_7(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_7(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_7(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_7(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 1, 1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 1, 1, -2, 1/),gr_FePt_interaction_7(cell + (/ 1, 1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_7,cell + (/ 3, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_7,cell + (/ 3, 0, -1, 1/),gr_FePt_interaction_7(cell + (/ 3, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_8(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, 1, -1, 1/),gr_FePt_interaction_8(cell + (/ -2, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 1, -2, 1/),gr_FePt_interaction_8(cell + (/ -1, 1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_8(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_8(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, 1, 1, 1/),gr_FePt_interaction_8(cell + (/ -2, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_8(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_8(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, 0, 2, 1/),gr_FePt_interaction_8(cell + (/ -2, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_8(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_8(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_8(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, -2, -1, 1/),gr_FePt_interaction_8(cell + (/ -1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_8(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_8(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_8(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_8(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_8(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_8(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_8(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_8(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 3, 0, 1/),gr_FePt_interaction_8(cell + (/ -1, 3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_8(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 2, -1, 1/),gr_FePt_interaction_8(cell + (/ -1, 2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_8(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_8(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 2, 1, 1/),gr_FePt_interaction_8(cell + (/ -1, 2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, 0, -2, 1/),gr_FePt_interaction_8(cell + (/ -2, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -3, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -3, 1, 0, 1/),gr_FePt_interaction_8(cell + (/ -3, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_8(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_8(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_8(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_8(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -4, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -4, 0, 0, 1/),gr_FePt_interaction_8(cell + (/ -4, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_8(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -1, 1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -1, 1, 2, 1/),gr_FePt_interaction_8(cell + (/ -1, 1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -3, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -3, 0, -1, 1/),gr_FePt_interaction_8(cell + (/ -3, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -3, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -3, 0, 1, 1/),gr_FePt_interaction_8(cell + (/ -3, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_8(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_8,cell + (/ -2, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_8,cell + (/ -2, 2, 0, 1/),gr_FePt_interaction_8(cell + (/ -2, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, -2, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, -2, -2, 1/),gr_FePt_interaction_9(cell + (/ 0, -2, -2, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, -1, -1, 1/),gr_FePt_interaction_9(cell + (/ 0, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, -1, 1, 1/),gr_FePt_interaction_9(cell + (/ 0, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -1, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -1, 2, 1/),gr_FePt_interaction_9(cell + (/ -1, -1, 2, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -3, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -3, -1, 0, 1/),gr_FePt_interaction_9(cell + (/ -3, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 1, -1, -2, 1/),gr_FePt_interaction_9(cell + (/ 1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 1, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 1, -2, -1, 1/),gr_FePt_interaction_9(cell + (/ 1, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 2, -1, -1, 1/),gr_FePt_interaction_9(cell + (/ 2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, 0, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, 0, -2, 1/),gr_FePt_interaction_9(cell + (/ 0, 0, -2, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 1, 0, 1, 1/),gr_FePt_interaction_9(cell + (/ 1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 1, 1, 0, 1/),gr_FePt_interaction_9(cell + (/ 1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 1, 0, -1, 1/),gr_FePt_interaction_9(cell + (/ 1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -4, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -4, -1, 1/),gr_FePt_interaction_9(cell + (/ -1, -4, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -1, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -1, -2, 1/),gr_FePt_interaction_9(cell + (/ -1, -1, -2, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -2, -1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -2, -1, -1, 1/),gr_FePt_interaction_9(cell + (/ -2, -1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, -2, 0, 1/),gr_FePt_interaction_9(cell + (/ 0, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -2, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -2, 1, 1/),gr_FePt_interaction_9(cell + (/ -1, -2, 1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -2, -1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -2, -1, 1, 1/),gr_FePt_interaction_9(cell + (/ -2, -1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, -1, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, -1, -3, 1/),gr_FePt_interaction_9(cell + (/ 0, -1, -3, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -3, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -3, 0, 1/),gr_FePt_interaction_9(cell + (/ -1, -3, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -2, -2, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -2, -2, -2, 1/),gr_FePt_interaction_9(cell + (/ -2, -2, -2, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, 1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, 1, 0, 1/),gr_FePt_interaction_9(cell + (/ -1, 1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 1, -1, 0, 1/),gr_FePt_interaction_9(cell + (/ 1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, 0, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, 0, 1, 1/),gr_FePt_interaction_9(cell + (/ -1, 0, 1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, 0, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, 0, -1, 1/),gr_FePt_interaction_9(cell + (/ -1, 0, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, 2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, 2, 0, 1/),gr_FePt_interaction_9(cell + (/ 0, 2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, -3, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, -3, -1, 1/),gr_FePt_interaction_9(cell + (/ 0, -3, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 2, 0, 0, 1/),gr_FePt_interaction_9(cell + (/ 2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -2, -3, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -2, -3, 1/),gr_FePt_interaction_9(cell + (/ -1, -2, -3, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -1, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -1, 0, 1/),gr_FePt_interaction_9(cell + (/ -1, -1, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, 1, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, 1, -1, 1/),gr_FePt_interaction_9(cell + (/ 0, 1, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -2, -2, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -2, -2, 0, 1/),gr_FePt_interaction_9(cell + (/ -2, -2, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, 1, 1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, 1, 1, 1/),gr_FePt_interaction_9(cell + (/ 0, 1, 1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -3, -2, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -3, -2, -1, 1/),gr_FePt_interaction_9(cell + (/ -3, -2, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -2, -3, -1, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -2, -3, -1, 1/),gr_FePt_interaction_9(cell + (/ -2, -3, -1, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -2, 0, 0, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -2, 0, 0, 1/),gr_FePt_interaction_9(cell + (/ -2, 0, 0, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ 0, 0, 2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ 0, 0, 2, 1/),gr_FePt_interaction_9(cell + (/ 0, 0, 2, 0/)))
    end if
    if(can_do(FePt_interaction_9,cell + (/ -1, -3, -2, 1/))) then
        call update_rates_matrix(FePt_interaction_9,cell + (/ -1, -3, -2, 1/),gr_FePt_interaction_9(cell + (/ -1, -3, -2, 0/)))
    end if

! Enable processes

    call add_proc(FePt_interaction_11, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_11(cell + (/ -1, -1, 0, 0/)))
    select case(get_species(cell + (/0, -1, 1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_6, cell + (/ 0, -1, 1, 1/), gr_FePt_interaction_6(cell + (/ 0, -1, 1, 0/)))
    case(pt)
        call add_proc(FePt_interaction_10, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_10(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/-1, 0, -1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_10, cell + (/ -1, 0, -1, 1/), gr_FePt_interaction_10(cell + (/ -1, 0, -1, 0/)))
    case(pt)
        call add_proc(FePt_interaction_6, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_6(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/0, -1, -1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_9, cell + (/ 0, -1, -1, 1/), gr_FePt_interaction_9(cell + (/ 0, -1, -1, 0/)))
    case(pt)
        call add_proc(FePt_interaction_4, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_4(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/-1, 0, 1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_4, cell + (/ -1, 0, 1, 1/), gr_FePt_interaction_4(cell + (/ -1, 0, 1, 0/)))
    case(pt)
        call add_proc(FePt_interaction_9, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_9(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/-1, -2, -1, fept_origin/)))
    case(pt)
        call add_proc(FePt_interaction_0, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_0(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/0, 1, 1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_0, cell + (/ 0, 1, 1, 1/), gr_FePt_interaction_0(cell + (/ 0, 1, 1, 0/)))
    end select

    select case(get_species(cell + (/1, 0, 1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_1, cell + (/ 1, 0, 1, 1/), gr_FePt_interaction_1(cell + (/ 1, 0, 1, 0/)))
    end select

    select case(get_species(cell + (/-2, -1, -1, fept_origin/)))
    case(pt)
        call add_proc(FePt_interaction_1, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_1(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/-2, -2, 0, fept_origin/)))
    case(pt)
        call add_proc(FePt_interaction_2, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_2(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/1, 1, 0, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_2, cell + (/ 1, 1, 0, 1/), gr_FePt_interaction_2(cell + (/ 1, 1, 0, 0/)))
    end select

    select case(get_species(cell + (/-1, -2, 1, fept_origin/)))
    case(pt)
        call add_proc(FePt_interaction_3, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_3(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/0, 1, -1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_3, cell + (/ 0, 1, -1, 1/), gr_FePt_interaction_3(cell + (/ 0, 1, -1, 0/)))
    end select

    select case(get_species(cell + (/1, -1, 0, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_5, cell + (/ 1, -1, 0, 1/), gr_FePt_interaction_5(cell + (/ 1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/-2, 0, 0, fept_origin/)))
    case(pt)
        call add_proc(FePt_interaction_5, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_5(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/-2, -1, 1, fept_origin/)))
    case(pt)
        call add_proc(FePt_interaction_7, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_7(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/1, 0, -1, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_7, cell + (/ 1, 0, -1, 1/), gr_FePt_interaction_7(cell + (/ 1, 0, -1, 0/)))
    end select

    select case(get_species(cell + (/0, -2, 0, fept_origin/)))
    case(pt)
        call add_proc(FePt_interaction_8, cell + (/ -1, -1, 0, 1/), gr_FePt_interaction_8(cell + (/ -1, -1, 0, 0/)))
    end select

    select case(get_species(cell + (/-1, 1, 0, fept_origin/)))
    case(fe)
        call add_proc(FePt_interaction_8, cell + (/ -1, 1, 0, 1/), gr_FePt_interaction_8(cell + (/ -1, 1, 0, 0/)))
    end select


end subroutine run_proc_FePt_interaction_2

end module run_proc_0005
