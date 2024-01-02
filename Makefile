APP_NAME	 := Switcher
APP_BUNDLE := $(APP_NAME).app
APP			   := $(APP_BUNDLE)/Contents/MacOS/$(APP_NAME)
APP_ICNS	 := $(APP_BUNDLE)/Contents/Resources/app.icns

SWIFT_SRCS = main.swift controller/WindowController.swift util/CustomLog.swift \
	view/CocoaView.swift view/MetalLayerView.swift view/MetalView.swift model/Renderer.swift
SRCS = 
OBJS = $(addsuffix .o,$(basename $(SRCS)))
DEPS = $(addsuffix .d,$(basename $(SRCS)))

CC=clang
CFLAGS=-fobjc-arc -Wall
CXX=clang++
CXXFLAGS=-fobjc-arc -std=c++17 -Wall
SWIFTFLAGS=-lc++
LDFLAGS=-framework Cocoa


build: $(APP) $(APP_ICNS)
	@codesign --remove-signature $(APP_BUNDLE)
	@codesign --force --sign 34C6CC573389B86AB2388388E5091CBD104B8FF2 $(APP_BUNDLE)
	@echo 'Done!'

$(APP): $(SWIFT_SRCS) $(OBJS)
	mkdir -p $(shell dirname $@)
	swiftc $(SWIFTFLAGS) $^ -o $@

%.o: %.c
	$(CC) -MMD -MP -c $(CFLAGS) $< -o $@

%.o: %.m
	$(CC) -MMD -MP -c $(CFLAGS) $< -o $@

%.o: %.cpp
	$(CXX) -MMD -MP -c $(CXXFLAGS) $< -o $@

%.o: %.mm
	$(CXX) -MMD -MP -c $(CXXFLAGS) $< -o $@

-include $(DEPS)

$(APP_ICNS): app.iconset/*
	mkdir -p $(shell dirname $@)
	iconutil -c icns -o $@ app.iconset
	touch $(APP_BUNDLE)

clean:
	rm -f $(APP) $(APP_ICNS) $(OBJS) $(DEPS)

.PHONY: build clean
