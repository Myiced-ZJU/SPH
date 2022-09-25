module param
    implicit none
    public
    integer, parameter:: df = kind(2.d0), sf = kind(1.)
    integer, parameter:: f = df, tf = df
    real(f), parameter:: pi = 3.14159265358979323846_f, g = 9.81_f
    real(f) dp, dt, tmax;
    integer :: i,j,k; !do loop index
    integer,parameter :: findex = 1,bindex = 2;
    integer :: np,npf,npb,ncal;
    real(f) :: massfluid,massbound
    ! real :: h ! smoothing length
    

    ! struct array for particles 
    ! 考虑写成Module typedef
    type particles
        real(f) :: x
        real(f) :: y
        real(f) :: z
        integer :: idp
        real(f) :: u
        real(f) :: v
        real(f) :: w
        real(f) :: rho    
        real(f) :: p
        integer :: index;
    end type particles

    type velrhop
        real(f) :: u
        real(f) :: v
        real(f) :: w
        real(f) :: rho
    end type velrhop

    type points
        real(f) :: x
        real(f) :: y
        real(f) :: z
    end type points

    type param_to_particle
        real(f) :: dp;
        integer :: index;
    end type
    
end module param