
PROJECT=Example
CC65_DIR=./Tools/cc65
UC = $(shell echo '$1' | tr '[:lower:]' '[:upper:]')

all: build package.dsk clean

build :
	$(CC65_DIR)/bin/cc65 -t apple2 $(PROJECT)/$(PROJECT).c -o $(PROJECT)/$(PROJECT).s
	$(CC65_DIR)/bin/ca65 -t apple2 $(PROJECT)/$(PROJECT).s -o $(PROJECT)/$(PROJECT).o
	$(CC65_DIR)/bin/ld65 -t apple2 $(PROJECT)/$(PROJECT).o -o $(PROJECT)/$(PROJECT).bin --lib apple2.lib

package.po :
	java -jar ./Tools/ac.jar -pro140 $(PROJECT)/$(PROJECT).po $(call UC,$PROJECT)
	java -jar ./Tools/ac.jar -p $(PROJECT)/$(PROJECT).po $(call UC,$PROJECT) BIN < $(PROJECT)/$(PROJECT).bin

package.dsk :
	cp ./Tools/ProDOS_Example.dsk $(PROJECT)/$(PROJECT).dsk
	java -jar ./Tools/ac.jar -p $(PROJECT)/$(PROJECT).dsk $(call UC,$PROJECT).SYSTEM sys < $(CC65_DIR)/target/apple2/util/loader.system
	java -jar ./Tools/ac.jar -as $(PROJECT)/$(PROJECT).dsk $(call UC,$PROJECT) bin < $(PROJECT)/$(PROJECT).bin

clean :
	rm -f $(PROJECT)/$(PROJECT).s $(PROJECT)/$(PROJECT).o $(PROJECT)/$(PROJECT).bin

reset : clean
	rm -rf $(PROJECT)/$(PROJECT).po $(PROJECT)/$(PROJECT).dsk