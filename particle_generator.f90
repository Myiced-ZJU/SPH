module particle_generator
    use param
    implicit none
    
    
contains
    subroutine particle_generate(startpoint, endpoint, dpindex, particlesinfo)
        type(points):: startpoint,endpoint;
        type(param_to_particle)::dpindex;
        type(particles),allocatable,intent(inout)::particlesinfo(:);
        integer :: nx,ny,nz;
        ! n particles
        nx= ceiling((endpoint%x-startpoint%x)/dpindex%dp);
        ny= ceiling((endpoint%y-startpoint%y)/dpindex%dp);
        nz= 1;
        ncal = nx*ny*nz;
        write(*,*)"nx=",nx,"ny=",ny,"nz=",nz,"ncal=",ncal
        allocate(particlesinfo(ncal))

        do i = 1,ny
            do j = 1,nx
                k = (i-1)*nx+j
                particlesinfo(k)%x = startpoint%x + j*dp
                particlesinfo(k)%y = startpoint%y + (i-1)*dp;
                particlesinfo(k)%z = 0.0;
                particlesinfo(k)%idp = k;
                particlesinfo(k)%index = dpindex%index
                particlesinfo(k)%u = 0.0;
                particlesinfo(k)%v = 0.0;
                particlesinfo(k)%w = 0.0;
                particlesinfo(k)%p = 0.0;
            enddo
        enddo
    end subroutine 

    subroutine substract(startp2,endp2,particles_array,parry2)
        ! type(points),intent(in) :: startp;
        ! type(points),intent(in) :: endp;
        type(points),intent(in) :: startp2;
        type(points),intent(in) :: endp2;     
        type(particles),intent(in) :: particles_array(:);
        type(particles),allocatable,intent(out) :: parry2(:);
        integer :: ntotalin;

        ! particles_array(10)%index = 1;
        ntotalin = 0;
        do i = 1,size(particles_array)

            if ( .NOT.(particles_array(i)%x >=startp2%x .and. particles_array(i)%x <=endp2%x &
            &.and. particles_array(i)%y >=startp2%y .and. particles_array(i)%y <=endp2%y)) then
                ntotalin=ntotalin+1
            endif
        enddo

        allocate(parry2(ntotalin)); 
        j = 0;   
        do i = 1,size(particles_array)
            if ( .NOT.(particles_array(i)%x >=startp2%x .and. particles_array(i)%x <=endp2%x &
            &.and. particles_array(i)%y >=startp2%y .and. particles_array(i)%y <=endp2%y)) then
                j = j + 1
                parry2(j) = particles_array(i)
                parry2(j)%idp = j
            endif
        enddo
        ncal = j;

    end subroutine substract
    
    

end module particle_generator