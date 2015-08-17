program launch_monaghan_loop

  use FluidParticles_T_mod
  use Common_Variables
  use Initialize_Particle_mod
  use Interaction_TVR_Fluid_Monaghan_mod
  implicit none
  integer :: nrows=2, ncols, nnz

        nparticle = 11
        call allocateFluidParticles(particles, nparticle)
        call fixed_init_particles()
        print *,particles%rho

#ifdef _OK
        print *,"OK"
!$acc data copyin(particles)
!$acc enter data copyin(particles%rho)
        call Interaction_TVR_Fluid_Monaghan(1, nrows, particles)
!$acc exit data copyout(particles%rho)
!$acc end data

#else

        print *,"NOT ok"
!$acc data copyin(particles)
!$acc enter data copyin(particles%rho)
!$acc kernels &
!$acc present( particles,  particles%rho )
        call Interaction_TVR_Fluid_Monaghan(1, nrows, particles)
!$acc end kernels
!$acc exit data copyout(particles%rho)
!$acc end data
#endif

        print *,particles%rho
        call deallocateFluidParticles(particles)

end program launch_monaghan_loop
