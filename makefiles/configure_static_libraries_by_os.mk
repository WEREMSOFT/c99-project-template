# Set static libraries depending on de dettected OS
ifeq ($(DETTECTED_OS),Linux)
	LINK_LIBS := 
	#LINK_LIBS := -l:libraylib-linux.a -l:libglfw3.a -lm -ldl -lpthread -lX11 -lxcb -lGL -lGLX -lXext -lGLdispatch -lXau -lXdmcp
else ifeq ($(DETTECTED_OS),Darwin)
	LINK_LIBS := 
	#LINK_LIBS := -O0 -framework IOKit -v -lraylib -framework OpenGL -framework cocoa 
endif
