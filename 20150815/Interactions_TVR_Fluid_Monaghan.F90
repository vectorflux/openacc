module Interaction_TVR_Fluid_Monaghan_mod
  use Common_Variables
  implicit none

  contains

  subroutine Interaction_TVR_Fluid_Monaghan(start_part, end_part, particles)
#ifndef _OK
!$acc routine gang
#endif
        integer, intent(in) :: start_part, end_part
        type(FluidParticles_T), intent(inout) :: particles
        integer :: ipartA
        real(RP) :: pressure_ij, sound_ij

#ifdef _OK

!$acc kernels &
!$acc present(particles, particles%rho)
        do ipartA=start_part, end_part
                particles%rho(ipartA) = 1.0
        enddo
        ! particles%rho(2) = 0
!$acc end kernels

#else

        do ipartA=start_part, end_part
                particles%rho(ipartA) = 1.0
        enddo
        ! particles%rho(2) = 0
#endif

end subroutine Interaction_TVR_Fluid_Monaghan

end module Interaction_TVR_Fluid_Monaghan_mod
