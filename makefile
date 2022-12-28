#Set to location of Cowgol directory
COWGOL_LOC =
default: cowbf_case cowbf_subrcall cowbf_passto

cowfe-80386.nncgen.exe:
	cp $(COWGOL_LOC)bin/cowfe-80386.nncgen.exe .
cowbe-80386.nncgen.exe:
	cp $(COWGOL_LOC)bin/cowbe-80386.nncgen.exe .
cowlink-lx386.nncgen.exe:
	cp $(COWGOL_LOC)bin/cowlink-lx386.nncgen.exe .

cowbf_case: cowbf_case.cow cowfe-80386.nncgen.exe cowbe-80386.nncgen.exe \
cowlink-lx386.nncgen.exe
	./cowfe-80386.nncgen.exe -I$(COWGOL_LOC)rt/  \
		-I$(COWGOL_LOC)rt/lx386/ \
		cowbf_case.cow cowbf_case.cob
	./cowbe-80386.nncgen.exe cowbf_case.cob cowbf_case.coo
	./cowlink-lx386.nncgen.exe \
		$(COWGOL_LOC).obj/rt/lx386/cowgol.coo \
		cowbf_case.coo -o cowbf_case.s
	i686-linux-gnu-as -o cowbf_case.o -a cowbf_case.s > cowbf_case.lst
	i686-linux-gnu-ld cowbf_case.o -o cowbf_case

cowbf_subrcall: cowbf_subrcall.cow cowfe-80386.nncgen.exe \
cowbe-80386.nncgen.exe cowlink-lx386.nncgen.exe
	./cowfe-80386.nncgen.exe -I$(COWGOL_LOC)rt/  \
		-I$(COWGOL_LOC)rt/lx386/ \
		cowbf_subrcall.cow cowbf_subrcall.cob
	./cowbe-80386.nncgen.exe cowbf_subrcall.cob cowbf_subrcall.coo
	./cowlink-lx386.nncgen.exe \
		$(COWGOL_LOC).obj/rt/lx386/cowgol.coo \
		cowbf_subrcall.coo -o cowbf_subrcall.s
	i686-linux-gnu-as -o cowbf_subrcall.o -a cowbf_subrcall.s > \
		cowbf_subrcall.lst
	i686-linux-gnu-ld cowbf_subrcall.o -o cowbf_subrcall

cowbf_passto: cowbf_passto.cow cowfe-80386.nncgen.exe cowbe-80386.nncgen.exe \
cowlink-lx386.nncgen.exe
	./cowfe-80386.nncgen.exe -I$(COWGOL_LOC)rt/  \
		-I$(COWGOL_LOC)rt/lx386/ \
		cowbf_passto.cow cowbf_passto.cob
	./cowbe-80386.nncgen.exe cowbf_passto.cob cowbf_passto.coo
	./cowlink-lx386.nncgen.exe \
		$(COWGOL_LOC).obj/rt/lx386/cowgol.coo \
		cowbf_passto.coo -o cowbf_passto.s
	i686-linux-gnu-as -o cowbf_passto.o -a cowbf_passto.s > cowbf_passto.lst
	i686-linux-gnu-ld cowbf_passto.o -o cowbf_passto
