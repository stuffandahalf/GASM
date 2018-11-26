# Call make with TARGET=desired target

PREPROCESSOR_DIR = preprocessor
ASSEMBLER_DIR = assembler

export $(TARGET)

all: as-pp as-$(TARGET)

as-pp: $(PREPROCESSOR_DIR)
	cd $< && make
	
as-$(TARGET): $(ASSEMBLER_DIR)
	cd $< && make

.PHONY: clean
clean:
	cd $(PREPROCESSOR_DIR) && make clean
	cd $(ASSEMBLER_DIR) && make clean
	
	
