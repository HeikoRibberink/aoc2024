F = 
in = 

%: %.kk
	koka -o $@ $<
	chmod +x ./$@
	./$@ $(in)

watch:
	echo '$(F).kk' | entr make $(F)

