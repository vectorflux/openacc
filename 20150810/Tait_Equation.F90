module Tait_Equation
  use Common_Variables
  contains

function Tait_Sound_SpeedA()
!$acc routine seq
  real(RP) :: Tait_Sound_SpeedA
  Tait_Sound_SpeedA=SoundSpeed0
end function Tait_Sound_SpeedA

end module Tait_Equation
