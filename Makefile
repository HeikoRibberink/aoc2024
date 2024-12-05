dir = 
in = 
ex = main1
srcs != find -iname "*.kk"

.PHONY: watch

%: %.kk $(srcs)
	koka -o $@ $<
	chmod +x ./$@
	./$@ $(dir)/$(in)

watch:
	echo '$(dir)/$(ex).kk' | entr make $(dir)/$(ex)

