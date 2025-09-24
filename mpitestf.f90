! mpitestf.f90
program mpitestf
  use mpi
  implicit none
  integer :: ierr, size, rank, namelen
  character(len=MPI_MAX_PROCESSOR_NAME) :: name

  call MPI_Init(ierr)
  call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)
  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_Get_processor_name(name, namelen, ierr)
  print *, "Hello from rank", rank, "of", size, "on", trim(name)
  call MPI_Finalize(ierr)
end program mpitestf