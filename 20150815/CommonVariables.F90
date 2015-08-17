module Common_Variables
#define GAMMA_VALUE 7.0d0

  use RealPrecision
  use FluidParticles_T_mod

  implicit none
  type(FluidParticles_T) :: particles
  integer :: nparticle

end module Common_Variables
