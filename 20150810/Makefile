FC = ftn
LD = $(FC)
FLAGS =  
H := $(shell echo $(HOST) | tr [a-z] [A-Z] | tr -d [0-9] )

ifeq ($(PE_ENV),PGI)
        FLAGS += -acc -ta=nvidia:cc35 
endif

ifeq ($(PE_ENV),CRAY)
        FLAGS += -hacc -em -hacc_model=deep_copy
endif

LDFLAGS        = $(FLAGS)
# OBJ            = Parameters.o RealPrecision.o FluidParticles_T.o CommonVariables.o Tait_Equation.o Initialize_Particles.o Interactions_TVR_Fluid_Monaghan.o launch_monaghan_loop.o
OBJ            = Parameters.o RealPrecision.o                    CommonVariables.o Tait_Equation.o                        Interactions_TVR_Fluid_Monaghan.o launch_monaghan_loop.o
LIB            = 
.SUFFIXES: .o .F90


%.o: %.F90
	$(FC) $(FLAGS) -c $< 

$(PE_ENV).$(H): $(OBJ)
	$(LD) $(LDFLAGS) $(OBJ) $(LIB) -o $@
	@echo $(PE_ENV) / $(H) / openacc executable ready

clean:
	rm -f *.o o_* runme.slurm.* *.$(H) *.mod
	rm -fr *.ptx *.opt *.cg *.ap2 *.rpt *.cub *.lst *.xf
