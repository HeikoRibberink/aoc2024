dir = 
in = 
ex = main1
srcs != find -iname "*.kk"
flags =


%: %.kk $(srcs)
	koka -O3 -o $@ $<

.PHONY: watch
watch:
	find -iname "*.kk" | entr make run

.PHONY: run
run: $(dir)/$(ex)
	chmod +x ./$<
	./$< $(dir)/$(in)

