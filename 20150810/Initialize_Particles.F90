module Initialize_Particle_mod

  use Common_Variables

  implicit none
  private
  public :: fixed_init_particles

  contains

  subroutine fixed_init_particles
    integer :: i

    do i = 1, nparticle
      particles%rho(i) = 1000 - modulo(i, nparticle/2)
    enddo

  end subroutine fixed_init_particles

end module Initialize_Particle_mod
