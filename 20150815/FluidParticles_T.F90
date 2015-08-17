module FluidParticles_T_mod
  use RealPrecision, only: RP, D
  implicit none
  private

  public :: FluidParticles_T
  public :: allocateFluidParticles   
  public :: deallocateFluidParticles 

  type FluidParticles_T
    integer :: n
    real(RP), allocatable :: rho(:)
  end type FluidParticles_T

  contains

  subroutine allocateFluidParticles(particles, n)
    type(FluidParticles_T), intent(inout) :: particles
    integer, intent(in) :: n
    allocate(particles%rho(n))
  end subroutine allocateFluidParticles

  subroutine deallocateFluidParticles(particles)
    type(FluidParticles_T), intent(inout) :: particles
    deallocate(particles%rho)
  end subroutine deallocateFluidParticles

end module FluidParticles_T_mod
