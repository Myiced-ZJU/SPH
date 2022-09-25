module eos
    ! Equation of State - Monaghan, 1994
    use param
    implicit none 
    real(f) :: gamma = 7
    real(f) :: coefsound = 10
    real(f) :: rho0 = 1000
    real(f) :: B
    real(f) :: CL = 1.0

contains
    real(f) function getB()
        getB = (10.0 * sqrt(CL*g))**2*rho0/gamma
        return
    end function getB


!  可以将所有初始参数写在param 里面并且创建inivars函数初始
    subroutine computepress(particle)
        type(particles), intent(inout) :: particle
        B = getB()
        particle%p = B * ((particle%rho / rho0)**gamma -1 )
                
    end subroutine computepress

end module