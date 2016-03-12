
Test:	Test.chpl
	chpl -o Test Test.chpl --ccflags `pkg-config --cflags --libs gtk+-3.0`
