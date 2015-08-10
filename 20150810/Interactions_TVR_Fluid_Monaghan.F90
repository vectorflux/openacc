module Interaction_TVR_Fluid_Monaghan_mod
  use Common_Variables
  use Tait_Equation
  implicit none
  contains

  subroutine Interaction_TVR_Fluid_Monaghan(start_part, end_part)
        integer, intent(in) :: start_part, end_part
        integer :: ipartA
        real(RP) :: sound_ij

!$acc kernels 
        do ipartA=start_part, end_part
                sound_ij = Tait_Sound_SpeedA()
        enddo
!$acc end kernels

end subroutine Interaction_TVR_Fluid_Monaghan


end module Interaction_TVR_Fluid_Monaghan_mod
