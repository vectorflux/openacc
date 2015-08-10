program launch_monaghan_loop
  use Common_Variables
  use Interaction_TVR_Fluid_Monaghan_mod
  implicit none
  integer :: nrows=1

!$acc enter data copyin(nrows)
        call Interaction_TVR_Fluid_Monaghan(1, nrows)
!$acc exit data 

end program launch_monaghan_loop
