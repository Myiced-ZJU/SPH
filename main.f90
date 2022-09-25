program main
    use param
    use particle_generator
    use kernel
    use fluiddynamics
    implicit none
    logical :: if2d = .TRUE.;
    ! integer :: N = 100;

    type(particles),allocatable :: particles_fluid(:);
    type(particles),allocatable :: particles_bound(:),particles_afterbound(:);

    type(points) :: fstartp,fendp,bstartp,bendp,startp2,endp2;
    type(param_to_particle) :: fluid1,bound1;

    real(f) :: cccc,ccc,cc

    dp = 0.03;  


    ! -----------------------------------------------------------
    ! -----------------------------------------------------------
    fstartp%x = 0.0;
    fstartp%y = 0.0
    fstartp%z = 0.0
    fendp%x = 1.0;
    fendp%y = 1.0;
    fendp%z = 0.0;
    fluid1%dp = dp;
    fluid1%index = findex;

    bstartp%x = 0.0;
    bstartp%y = 0.0
    bstartp%z = 0.0
    bendp%x = 2.0;
    bendp%y = 1.5;    
    bendp%z = 0.0;
    bound1%dp = dp;
    bound1%index = bindex;
    call particle_generate(bstartp,bendp,bound1,particles_bound);

    startp2%x = 0.1;
    startp2%y = 0.1;
    endp2%x = 1.9;
    endp2%y = 1.8;

    call substract(startp2,endp2,particles_bound,particles_afterbound)
    npb = ncal
    write(*,*)"npb = ",npb

    call particle_generate(fstartp,fendp,fluid1,particles_fluid);
    npf = ncal



    do i = 1,size(particles_fluid)
        particles_fluid(i)%idp = particles_fluid(i)%idp + npb;
    enddo

    np = npb + npf
    ! ----------------------------------------- ------------------
    ! -----------------------------------------------------------
    call interactionfluid(particles_fluid)


    ! write(*,*)size(particles_fluid)
    ! open( 12 , File = "particles_fluid.txt", ACTION="write", STATUS="replace")
    !     do i = 1,size(particles_fluid)
    !         write(12,'(A7,F6.3,A7,F6.3,A7,I6)')"posx= ",particles_fluid(i)%x," posy= ",particles_fluid(i)%y,&
    !         &" Idp= ",particles_fluid(i)%idp
    !     enddo
    ! close(12)
    

    ! write(*,*)size(particles_afterbound)
    ! open( 13 , File = "particles_bound.txt", ACTION="write", STATUS="replace")
    !     do i = 1,size(particles_afterbound)
    !         write(13,'(A7,F6.3,A7,F6.3,A7,I6)')"posx= ",particles_bound(i)%x," posy= ",particles_bound(i)%y,&
    !         &" Idp= ",particles_bound(i)%idp
    !     enddo
    ! close(13)

    ! write(*,*)size(particles_fluid)
    ! open( 14 , File = "particles_fluidmat.txt", ACTION="write", STATUS="replace")
    !     do i = 1,size(particles_fluid)
    !         write(14,'(F6.3,A2,F6.3,A2,I6)')particles_fluid(i)%x," ",particles_fluid(i)%y,&
    !         &" ",particles_fluid(i)%idp
    !     enddo
    ! close(14)
    

    ! write(*,*)size(particles_afterbound)
    ! open( 15 , File = "particles_boundmat.txt", ACTION="write", STATUS="replace")
    !     do i = 1,size(particles_afterbound)
    !         write(15,'(F6.3,A2,F6.3,A2,I6)')particles_afterbound(i)%x," ",particles_afterbound(i)%y,&
    !         &" ",particles_afterbound(i)%idp
    !     enddo
    ! close(15)



    ! cccc = 2.0
    ! ccc  = 2.5
    ! write(*,*)cccc**2
    ! write(*,*)ccc**3
end program main
