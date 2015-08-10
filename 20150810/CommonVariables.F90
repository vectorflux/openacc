module Common_Variables
  use RealPrecision
  implicit none
  real(RP):: SoundSpeed0 = 7.d0

!$acc declare copyin(SoundSpeed0)

end module Common_Variables
