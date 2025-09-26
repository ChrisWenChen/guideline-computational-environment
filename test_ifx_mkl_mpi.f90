! test_ifx_mkl_mpi.f90
program test_ifx_mkl_mpi
  use iso_c_binding
  implicit none

  ! ---- MPI part ----
  include 'mpif.h'
  integer :: ierr, rank, nprocs, name_len
  character(len=MPI_MAX_PROCESSOR_NAME) :: proc_name

  ! ---- MKL / BLAS part ----
  integer, parameter :: n = 2
  real(8) :: A(n,n), B(n,n), C(n,n)

  call MPI_Init(ierr)
  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_Comm_size(MPI_COMM_WORLD, nprocs, ierr)
  call MPI_Get_processor_name(proc_name, name_len, ierr)

  if (rank == 0) then
     print *, 'MPI initialized: ranks =', nprocs
  end if
  print *, 'Hello from rank', rank, 'on', trim(proc_name)

  ! Initialize matrices
  A = reshape([1d0, 2d0, 3d0, 4d0], [n, n])
  B = reshape([5d0, 6d0, 7d0, 8d0], [n, n])
  C = 0d0

  ! Call BLAS dgemm: C = A * B
  call dgemm('N','N', n,n,n, 1d0, A,n, B,n, 0d0, C,n)

  ! Each process prints its computed C
  print '(A,I0,A,2F10.3)', 'Rank ', rank, ' C(1,*)=', C(1,1), C(1,2)
  print '(A,I0,A,2F10.3)', 'Rank ', rank, ' C(2,*)=', C(2,1), C(2,2)

  call MPI_Finalize(ierr)
end program test_ifx_mkl_mpi