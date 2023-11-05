module proclist
use kind_values
use base, only: &
    update_accum_rate, &
    update_integ_rate, &
    reaccumulate_rates_matrix, &
    determine_procsite, &
    update_clocks, &
    avail_sites, &
    null_species, &
    increment_procstat

use lattice, only: &
    fept, &
    fept_origin, &
    allocate_system, &
    nr2lattice, &
    lattice2nr, &
    add_proc, &
    can_do, &
    set_rate_const, &
    replace_species, &
    del_proc, &
    reset_site, &
    system_size, &
    update_rates_matrix, &
    spuck, &
    get_species
use proclist_constants
use proclist_pars
use run_proc_0001
use run_proc_0002
use run_proc_0003
use run_proc_0004
use run_proc_0005
use run_proc_0006
use run_proc_0007
use run_proc_0008
use run_proc_0009
use run_proc_0010
use run_proc_0011
use run_proc_0012

implicit none
integer(kind=iint), parameter, public :: representation_length = 11
integer(kind=iint), public :: seed_size = 33
integer(kind=iint), public :: seed ! random seed
integer(kind=iint), public, dimension(:), allocatable :: seed_arr ! random seed


integer(kind=iint), parameter, public :: nr_of_proc = 12

character(len=3), parameter, public :: backend = "otf"

contains

subroutine do_kmc_steps(n)

!****f* proclist/do_kmc_steps
! FUNCTION
!    Performs ``n`` kMC step.
!    If one has to run many steps without evaluation
!    do_kmc_steps might perform a little better.
!    * first update clock
!    * then configuration sampling step
!    * last execute process
!
! ARGUMENTS
!
!    ``n`` : Number of steps to run
!******
    integer(kind=ilong), intent(in) :: n

    integer(kind=ilong) :: i
    real(kind=rsingle) :: ran_proc, ran_time, ran_site
    integer(kind=iint) :: nr_site, proc_nr

    do i = 1, n
    call random_number(ran_time)
    call random_number(ran_proc)
    call random_number(ran_site)
    call update_accum_rate
    call update_clocks(ran_time)

    call update_integ_rate
    call determine_procsite(ran_proc, ran_site, proc_nr, nr_site)
!    print *, "PROCLIST/DO_KMC_STEP"
!    print *,"    PROCLIST/DO_KMC_STEP/RAN_TIME",ran_time
!    print *,"    PROCLIST/DO_KMC_STEP/RAN_PROC",ran_proc
!    print *,"    PROCLIST/DO_KMC_STEP/RAN_SITE",ran_site
!    print *,"PROCLIST/DO_KMC_STEP/NR_SITE", nr_site
!    print *,"PROCLIST/DO_KMC_STEP/PROC_NR", proc_nr       
    call run_proc_nr(proc_nr, nr_site)
    enddo

end subroutine do_kmc_steps

subroutine do_kmc_steps_time(t, n, num_iter)
!****f* proclist/do_kmc_steps_time
! FUNCTION
!    Performs a variable number of KMC steps to try to match the requested
!    simulation time as closely as possible without going over. This routine
!    always performs at least one KMC step before terminating.
!    * Determine the time step for the next process
!    * If the time limit is not exceeded, update clocks, rates, execute process,
!      etc.; otherwise, abort.
!    Ideally we would use state(seed_size) but that was not working, so hardcoded size.
!
! ARGUMENTS
!
!    ``t`` : Requested simulation time increment (input)
!    ``n`` : Maximum number of steps to run (input)
!    ``num_iter`` : the number of executed iterations (output)
!******
    use base, only: get_accum_rate
    real(kind=rdouble), intent(in) :: t
    integer(kind=ilong), intent(in) :: n
    integer(kind=ilong), intent(out) :: num_iter

    integer(kind=ilong) :: i
    real(kind=rsingle) :: ran_proc, ran_time, ran_site
    integer(kind=iint) :: nr_site, proc_nr
    integer(kind=iint) :: state(33)
    real(kind=rdouble) :: time_step, loop_kmc_time, accum_rate

    loop_kmc_time = 0
    num_iter = 0
    do i = 1, n
      call random_seed(get=state)
      call random_number(ran_time)
      call random_number(ran_proc)
      call random_number(ran_site)
      call update_accum_rate
      call get_accum_rate(0, accum_rate)
      time_step = -log(ran_time)/accum_rate
      if ((loop_kmc_time + time_step > t) .and. (num_iter > 0)) then
        call random_seed(put=state)
        exit
      else
        call update_clocks(ran_time)
        call update_integ_rate
        call determine_procsite(ran_proc, ran_site, proc_nr, nr_site)
        call run_proc_nr(proc_nr, nr_site)
        loop_kmc_time = loop_kmc_time + time_step
        num_iter = num_iter + 1
      end if
    end do
end subroutine do_kmc_steps_time

subroutine do_kmc_step()

!****f* proclist/do_kmc_step
! FUNCTION
!    Performs exactly one kMC step.
!    *  first update clock
!    *  then configuration sampling step
!    *  last execute process
!
! ARGUMENTS
!
!    ``none``
!******
    real(kind=rsingle) :: ran_proc, ran_time, ran_site
    integer(kind=iint) :: nr_site, proc_nr

    call random_number(ran_time)
    call random_number(ran_proc)
    call random_number(ran_site)
    call update_accum_rate
    call update_clocks(ran_time)

    call update_integ_rate
    call determine_procsite(ran_proc, ran_site, proc_nr, nr_site)
    call run_proc_nr(proc_nr, nr_site)
end subroutine do_kmc_step

subroutine get_next_kmc_step(proc_nr, nr_site)

!****f* proclist/get_next_kmc_step
! FUNCTION
!    Determines next step without executing it.
!    However, it changes the position in the random_number 
!    sequence. The python function for
!    model.get_next_kmc_step() should be used
!    as it makes additional function calls
!    to reset the random numbers.
!    Calling model.proclist.get_next_kmc_step()
!    is discouraged as that will call this subroutine
!    directly and will not reset the random numbers.
!
! ARGUMENTS
!
!    ``none``
!******
    real(kind=rsingle) :: ran_proc, ran_time, ran_site
    integer(kind=iint), intent(out) :: nr_site, proc_nr

    call random_number(ran_time)
    call random_number(ran_proc)
    call random_number(ran_site)
!    print *,"PROCLIST/GET_NEXT_KMC_STEP/RAN_TIME",ran_time
!    print *,"PROCLIST/GET_NEXT_KMC_STEP/RAN_PROC",ran_proc
!    print *,"PROCLIST/GET_NEXT_KMC_STEP/RAN_SITE",ran_site
    call update_accum_rate
    call determine_procsite(ran_proc, ran_site, proc_nr, nr_site)

!    print *,"PROCLIST/GET_NEXT_KMC_STEP/PROC_NR",proc_nr
end subroutine get_next_kmc_step

subroutine get_occupation(occupation)

!****f* proclist/get_occupation
! FUNCTION
!    Evaluate current lattice configuration and returns
!    the normalized occupation as matrix. Different species
!    run along the first axis and different sites run
!    along the second.
!
! ARGUMENTS
!
!    ``none``
!******
    ! nr_of_species = 3, spuck = 1
    real(kind=rdouble), dimension(0:2, 1:1), intent(out) :: occupation

    integer(kind=iint) :: i, j, k, nr, species

    occupation = 0

    do k = 0, system_size(3)-1
        do j = 0, system_size(2)-1
            do i = 0, system_size(1)-1
                do nr = 1, spuck
                    ! shift position by 1, so it can be accessed
                    ! more straightforwardly from f2py interface
                    species = get_species((/i,j,k,nr/))
                    if(species.ne.null_species) then
                    occupation(species, nr) = &
                        occupation(species, nr) + 1
                    endif
                end do
            end do
        end do
    end do

    occupation = occupation/real(system_size(1)*system_size(2)*system_size(3))
end subroutine get_occupation

subroutine init(input_system_size, system_name, layer, seed_in, no_banner)

!****f* proclist/init
! FUNCTION
!     Allocates the system and initializes all sites in the given
!     layer.
!
! ARGUMENTS
!
!    * ``input_system_size`` number of unit cell per axis.
!    * ``system_name`` identifier for reload file.
!    * ``layer`` initial layer.
!    * ``no_banner`` [optional] if True no copyright is issued.
!******
    integer(kind=iint), intent(in) :: layer, seed_in
    integer(kind=iint), dimension(3), intent(in) :: input_system_size

    character(len=400), intent(in) :: system_name

    logical, optional, intent(in) :: no_banner

    if (.not. no_banner) then
        print *, "+------------------------------------------------------------+"
        print *, "|                                                            |"
        print *, "| This kMC Model '002_FePt_local_interactio' was written by  |"
        print *, "|                                                            |"
        print *, "|       Tomoyuki TSUYAMA (tomoyuki.tsuyaman@gmail.com)       |"
        print *, "|                                                            |"
        print *, "| and implemented with the help of kmcos,                    |"
        print *, "| which is distributed under GNU/GPL Version 3               |"
        print *, "| (C) Max J. Hoffmann mjhoffmann@gmail.com                   |"
        print *, "|                                                            |"
        print *, "| kmcos is distributed in the hope that it will be useful    |"
        print *, "| but WITHOUT ANY WARRANTY; without even the implied         |"
        print *, "| warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR    |"
        print *, "| PURPOSE. See the GNU General Public License for more       |"
        print *, "| details.                                                   |"
        print *, "|                                                            |"
        print *, "| If using kmcos for a publication, attribution is           |"
        print *, "| greatly appreciated.                                       |"
        print *, "| Hoffmann, M. J., Matera, S., & Reuter, K. (2014).          |"
        print *, "| kmos: A lattice kinetic Monte Carlo framework.             |"
        print *, "| Computer Physics Communications, 185(7), 2138-2150.        |"
        print *, "|                                                            |"
        print *, "| Development https://github.com/kmcos/kmcos                 |"
        print *, "| Documentation https://kmcos.readthedocs.io                 |"
        print *, "| Reference https://dx.doi.org/10.1016/j.cpc.2014.04.003     |"
        print *, "|                                                            |"
        print *, "+------------------------------------------------------------+"
        print *, ""
        print *, ""
    endif
    call allocate_system(nr_of_proc, input_system_size, system_name)
    call initialize_state(layer, seed_in)
end subroutine init

function get_seed() result(state)
!****f* proclist/get_seed
! FUNCTION
!   Function to retrieve the state of the random number generator to
!    permit reproducible restart trajectories.
!
! ARGUMENTS
!
!    * None
!******
    integer :: state(33)
    call random_seed(get=state)
end function get_seed

subroutine put_seed(state)
!****f* proclist/put_seed
! FUNCTION
!    Subroutine to set the state of the random number generator to
!    permit reproducible restart trajectories.
!
! ARGUMENTS
!
!    * ``state`` an array of integers with the state of the random number
!    generator (input)
!******  
    integer, intent(in) :: state(33)
    call random_seed(put=state)
end subroutine put_seed 

function seed_gen(sd) result(sarr)
!****f* proclist/seed_gen
! FUNCTION
!    Function to transform a single number into a full set of integers
!    required for initializing the random number generator.
!
! ARGUMENTS
!
!    * ``sd`` an integer used to seed a simple random number generator
!    used to generate additional integers for seeding the production random
!    number generator (input)
!******


    integer, intent(in) :: sd
    integer(kind=ilong) :: s
    integer(kind=ilong) :: sarr(33)
    integer :: i

!Generate the state array with a simple linear congruential generator. The
!parameters for this generator are taken from the gfortran documentation on
!random_seed().

!Initialize the generator
    if (sd == 0) then
      s = 104729
    else
      s = mod(sd, 4294967296_ilong)
    end if

!Get values for the seed array
    do i =1, size(sarr)
      s = mod(s * 279470273_ilong, 4294967291_ilong)
      sarr(i) = int(mod(s, int(huge(0), ilong)), kind(0))
      s = mod(s, 4294967296_ilong)
    end do

end function seed_gen
subroutine initialize_state(layer, seed_in)

!****f* proclist/initialize_state
! FUNCTION
!    Initialize all sites and book-keeping array
!    for the given layer.
!
! ARGUMENTS
!
!    * ``layer`` integer representing layer
!******
    integer(kind=iint), intent(in) :: layer, seed_in

    integer(kind=iint) :: i, j, k, nr
    ! initialize random number generator
    allocate(seed_arr(seed_size))
    seed = seed_in
    seed_arr = seed_gen(seed)
    call random_seed(size=seed_size)
    call random_seed(put=seed_arr)
    deallocate(seed_arr)
    do k = 0, system_size(3)-1
        do j = 0, system_size(2)-1
            do i = 0, system_size(1)-1
                do nr = 1, spuck
                    call reset_site((/i, j, k, nr/), null_species)
                end do
                select case(layer)
                case (fept)
                    call replace_species((/i, j, k, fept_origin/), null_species, Fe)
                end select
            end do
        end do
    end do

    do k = 0, system_size(3)-1
        do j = 0, system_size(2)-1
            do i = 0, system_size(1)-1
                call touchup_cell((/i, j, k, 0/))
            end do
        end do
    end do


end subroutine initialize_state

subroutine recalculate_rates_matrix()

    integer(kind=iint) :: i,j,k

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_0,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_0,(/ i, j, k, 1/),gr_FePt_interaction_0((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_1,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_1,(/ i, j, k, 1/),gr_FePt_interaction_1((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_10,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_10,(/ i, j, k, 1/),gr_FePt_interaction_10((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_11,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_11,(/ i, j, k, 1/),gr_FePt_interaction_11((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_2,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_2,(/ i, j, k, 1/),gr_FePt_interaction_2((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_3,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_3,(/ i, j, k, 1/),gr_FePt_interaction_3((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_4,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_4,(/ i, j, k, 1/),gr_FePt_interaction_4((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_5,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_5,(/ i, j, k, 1/),gr_FePt_interaction_5((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_6,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_6,(/ i, j, k, 1/),gr_FePt_interaction_6((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_7,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_7,(/ i, j, k, 1/),gr_FePt_interaction_7((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_8,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_8,(/ i, j, k, 1/),gr_FePt_interaction_8((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do

    do i=1, system_size(1)
        do j=1, system_size(2)
            do k=1, system_size(3)
                if(can_do(FePt_interaction_9,(/ i, j, k, 1/))) then
                    call update_rates_matrix(FePt_interaction_9,(/ i, j, k, 1/),gr_FePt_interaction_9((/ i, j, k, 0/)))
                end if
            end do
        end do
    end do


    call reaccumulate_rates_matrix()
end subroutine recalculate_rates_matrix
subroutine touchup_cell(cell)
    integer(kind=iint), intent(in), dimension(4) :: cell

    integer(kind=iint), dimension(4) :: site

    integer(kind=iint) :: proc_nr

    site = cell + (/0, 0, 0, 1/)
    do proc_nr = 1, nr_of_proc
        if(avail_sites(proc_nr, lattice2nr(site(1), site(2), site(3), site(4)) , 2).ne.0)then
            call del_proc(proc_nr, site)
        endif
    end do

    select case(get_species(cell + (/0, 0, 0, fept_origin/)))
    case(fe)
        select case(get_species(cell + (/0, -1, -1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_0, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_0(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/-1, 0, -1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_1, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_1(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/1, 0, 1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_10, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_10(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/1, 1, 0, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_11, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_11(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/-1, -1, 0, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_2, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_2(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/0, -1, 1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_3, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_3(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/1, 0, -1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_4, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_4(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/-1, 1, 0, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_5, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_5(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/0, 1, -1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_6, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_6(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/-1, 0, 1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_7, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_7(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/1, -1, 0, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_8, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_8(cell + (/ 0, 0, 0, 0/)))
        end select

        select case(get_species(cell + (/0, 1, 1, fept_origin/)))
        case(pt)
            call add_proc(FePt_interaction_9, cell + (/ 0, 0, 0, 1/), gr_FePt_interaction_9(cell + (/ 0, 0, 0, 0/)))
        end select

    end select


end subroutine touchup_cell
subroutine run_proc_nr(proc, nr_cell)

!****f* proclist/run_proc_nr
! FUNCTION
!    Runs process ``proc`` on site ``nr_site``.
!
! ARGUMENTS
!
!    * ``proc`` integer representing the process number
!    * ``nr_site``  integer representing the site
!******
    integer(kind=iint), intent(in) :: proc
    integer(kind=iint), intent(in) :: nr_cell

    integer(kind=iint), dimension(4) :: cell

    call increment_procstat(proc)

    ! lsite = lattice_site, (vs. scalar site)
    cell = nr2lattice(nr_cell, :) + (/0, 0, 0, -1/)

    select case(proc)
    case(FePt_interaction_0)
        call run_proc_FePt_interaction_0(cell)

    case(FePt_interaction_1)
        call run_proc_FePt_interaction_1(cell)

    case(FePt_interaction_10)
        call run_proc_FePt_interaction_10(cell)

    case(FePt_interaction_11)
        call run_proc_FePt_interaction_11(cell)

    case(FePt_interaction_2)
        call run_proc_FePt_interaction_2(cell)

    case(FePt_interaction_3)
        call run_proc_FePt_interaction_3(cell)

    case(FePt_interaction_4)
        call run_proc_FePt_interaction_4(cell)

    case(FePt_interaction_5)
        call run_proc_FePt_interaction_5(cell)

    case(FePt_interaction_6)
        call run_proc_FePt_interaction_6(cell)

    case(FePt_interaction_7)
        call run_proc_FePt_interaction_7(cell)

    case(FePt_interaction_8)
        call run_proc_FePt_interaction_8(cell)

    case(FePt_interaction_9)
        call run_proc_FePt_interaction_9(cell)

    end select

end subroutine run_proc_nr

end module proclist
