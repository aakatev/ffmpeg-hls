run: build
	docker run -w /files --rm -it -v `pwd`:/files leandromoreira/ffmpeg-devel ./build/app /files/sample_video.mp4 /files/build/sample_video_transcoded.m3u8

build: clean
	docker run -w /files --rm -it  -v `pwd`:/files leandromoreira/ffmpeg-devel \
	  gcc -g -Wall -L/opt/ffmpeg/lib -I/opt/ffmpeg/include/ /files/src/main.c /files/src/util.c \
	  -lavcodec -lavformat -lavfilter -lavdevice -lswresample -lswscale -lavutil \
	  -o /files/build/app

clean:
	rm -rf ./build/*

serve:
	npx serve