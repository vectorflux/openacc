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

ifneq ($(X),fail)
	FLAGS += -D_OK
endif

LDFLAGS        = $(FLAGS)
OBJ            = Parameters.o RealPrecision.o FluidParticles_T.o CommonVariables.o Initialize_Particles.o Interactions_TVR_Fluid_Monaghan.o launch_monaghan_loop.o
LIB		= 
#CCE: LIB            = -Wc,CommonVariables_1.ptx -L/apps/daint/5.2.UP02/.cce/cce/8.4.0.215/craylibs/x86-64
.SUFFIXES: .o .F90


%.o: %.F90
	$(FC) $(FLAGS) -c $< 

$(PE_ENV).$(H).$X: $(OBJ)
	$(LD) $(LDFLAGS) $(OBJ) $(LIB) -o $@
	@echo $(PE_ENV) / $(H) / openacc executable ready

clean:
	rm -f *.o o_* runme.slurm.* *.$(H) *.mod
	rm -fr *.ptx *.opt *.cg *.ap2 *.rpt *.cub *.lst *.xf
