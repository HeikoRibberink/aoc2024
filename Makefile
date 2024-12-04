F = 

%: %.kk
	koka -o $@ $<
	./$@

watch:
	echo '$(F).kk' | entr make $(F)
