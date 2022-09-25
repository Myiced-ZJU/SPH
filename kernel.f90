module kernel
    use param
    implicit none
    ! real,external :: att
    ! real(f),parameter :: pi = 3.141593
    real(f) :: coefh = 1.7 ! smoothing length
    real(f) :: h_1
    real(f) :: r,q,qq,h,fac
    ! real 
    
    ! h = 1.2*dp
contains
    ! real function geth()
    !     h = 1.3*dp
    ! end
    real(f) function geth()    
        geth = coefh * sqrt(2.0) * dp;
        return 
    end

    real(f) function wab(rr)
        ! real :: att
        real(f) :: rr
        h = geth()
        h_1 = 1./h
        r = sqrt(rr)
        q = r*h_1
        qq = 1.0 - 0.5 * q
        fac = 7.0/4.0*pi*h_1*h_1

        if (r<=2*h)then
            wab = fac*qq*qq*qq*qq*(2*q+1)
        elseif(r>2*h)then
            wab = 0.0
        else
            write(*,*)"wab distance error"
        endif

        return
    end function wab

    real(f) function dwab(rr)
        real(f) :: rr
        h = geth()
        h_1 = 1./h
        r = sqrt(rr)
        q = r*h_1
        qq = 1.0 - 0.5 * q
        fac = -5.0*7.0/4.0*pi*h_1*h_1*h_1*h_1

        if (r<=2*h)then
            dwab = fac*qq*qq*qq*q
        elseif(r>2*h)then
            dwab = 0.0
        else
            write(*,*)"dwab distance error"
        endif 

        return
    end function dwab
    

end module kernel