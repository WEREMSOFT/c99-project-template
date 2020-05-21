include ./makefiles/dettect_os.mk
include ./makefiles/define_useful_vars.mk
include ./makefiles/configure_static_libraries_by_os.mk

.PHONY: run_% debug_optimized debug_unoptimized print_information create_folder_structure run_html_u run_html_o run_performance_test init_project

all: print_information $(BLD_D)main.$(BIN_EXTENSION)

$(OBJ_D)%.o: $(SRC_D)%.c
	$(CC_COMMAND) -o $(OBJ_D)$@ $^ $(LINK_LIBS)

$(BLD_D)%.$(BIN_EXTENSION): $(SRC_D)%.c
	@echo "### Building $(@) START ###"
	$(CC_COMMAND) -o $@ $^ $(LINK_LIBS)
	@echo "### End ###"
	@echo ""

$(BLD_D)%.exe: $(SRC_D)%.c
	@echo "### Building $(@) START ###"
	$(CC_COMMAND) -o $@ $^ $(LINK_LIBS)
	@echo "### End ###"
	@echo ""

$(HTML_D)%.html: $(SRC_D)%.c
	$(EMSC_CC_COMMAND) -o $@ $^ $(EMSC_STATIC_LIBS_D)

print_information:
	@echo "Dettected OS: $(DETTECTED_OS)"

create_folders:
	$(MK_DIR) $(BLD_D)
	$(MK_DIR) $(SRC_D)
	$(MK_DIR) libs/include
	$(MK_DIR) libs/static
	$(MK_DIR) $(HTML_D)
	
init_project: create_folders
	touch ./src/main.c

clean:
	rm -rf ./$(BLD_D)/*
	rm -rf ./$(HTML_D)/*
	rm -rf ./$(OBJ_D)/*

run_perf_%.$(BIN_EXTENSION): $(BLD_D)%.$(BIN_EXTENSION)
	perf stat -e task-clock,cycles,instructions,cache-references,cache-misses $^
	
debug_%: $(BLD_D)%.$(BIN_EXTENSION)
	$(DEBUGGER) $^

run_%: $(BLD_D)%.$(BIN_EXTENSION)
	$^