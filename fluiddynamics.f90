module fluiddynamics
    use kernel
    use eos
    use param
    implicit none
    real(f) :: drx,dry,drz,drr
    real(f) :: arho = 0.0,avel=0.0
    real(f) :: frx,fry,frz
    real(f) :: dvx,dvy,dvz
    real(f) :: massp1,massp2
    integer :: pfin,pini
    
contains
    subroutine interactionfluid(partarray)
        type(particles), intent(inout) :: partarray(:)
        pini = npb + 1
        pfin = np

        ! density derivation
        do i = pini,pfin
            do j = pini,pfin

                drx = partarray(i)%x - partarray(j)%x
                dry = partarray(i)%y - partarray(j)%y
                drz = partarray(i)%z - partarray(j)%z
                drr = sqrt(drx**2 + dry**2 + drz**2)
                ! if (drr <= 2*geth()) then
                fac = dwab(drr)
                frx = fac*drx
                fry = fac*dry
                frz = fac*drz
                
                dvx = partarray(i)%u - partarray(j)%u
                dvy = partarray(i)%v - partarray(j)%v
                dvz = partarray(i)%w - partarray(j)%w
                
                massp2 = merge(massfluid,massbound,partarray(j)%index==findex)
                
                arho = arho + massp2*(dvx*frx+dvy*fry+dvz*frz)*(partarray(i)%rho / partarray(j)%rho);
                ! endif
            enddo
        enddo
        
    end subroutine interactionfluid



    ! subroutine interactionbound(arg1,  arg2)
    !     type1, intent(in) :: arg1
    !     type2, intent(out) ::  arg2
    
        
    ! end subroutine interactionbound

    
end module fluiddynamics    