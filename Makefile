include ./makefiles/define_useful_vars.mk
include ./makefiles/dettect_os.mk
include ./makefiles/configure_static_libraries_by_os.mk

.PHONY: debug_optimized debug_unoptimized print_information create_folder_structure run_html_u run_html_o run_performance_test init_project

all: print_information $(BLD_D)main_optimized.bin $(BLD_D)main_unoptimized.bin $(HTML_D)main_optimized.html $(HTML_D)main_unoptimized.html

$(OBJ_D)%.o: $(SRC_D)%.c
	$(CC_COMMAND) -o $(OBJ_D)$@ $^ $(LINK_LIBS)

$(BLD_D)%.bin: $(SRC_D)%.c
	@echo "### Building $(@) START ###"
	$(CC_COMMAND) -o $@ $^ $(LINK_LIBS)
	@echo "### End ###"
	@echo ""

$(HTML_D)%.html: $(SRC_D)%.c
	$(EMSC_CC_COMMAND) -o $@ $^ $(EMSC_STATIC_LIBS_D)

print_information:
	@echo "Dettected OS: $(DETTECTED_OS)"

create_folders:
	mkdir -p bin
	mkdir -p src
	mkdir -p libs/include
	mkdir -p libs/static
	mkdir -p html
	
init_project: create_folders
	touch ./src/main.c

clean:
	rm -rf ./bin/*
	rm -rf ./html/*
	rm -rf ./obj/*

run_perf_%.bin: $(BLD_D)%.bin
	perf stat -e task-clock,cycles,instructions,cache-references,cache-misses $^

run_both_versions: $(BLD_D)main_unoptimized.bin $(BLD_D)main_optimized.bin
	$(BLD_D)main_optimized.bin &
	$(BLD_D)main_unoptimized.bin &
	
run_%: $(BLD_D)%.bin
	$^

debug_%: $(BLD_D)%.bin
	$(DEBUGGER) $^

run_%: $(BLD_D)%.bin
	$^