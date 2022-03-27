PROGRAM=blurhash_encoder
DECODER=blurhash_decoder

$(PROGRAM): src/encode_stb.cpp src/encode.cpp src/encode.h src/stb_image.h src/common.hpp src/blurhash_string.hpp
	$(CXX) -o $@ src/encode_stb.cpp src/encode.cpp -lm -Ofast -march=native -fno-math-errno -std=c++20

$(DECODER): src/decode_stb.cpp src/decode.cpp src/decode.h src/stb_writer.h src/common.hpp
	$(CXX) -o $(DECODER) src/decode_stb.cpp src/decode.cpp -lm -Ofast

all: clean $(PROGRAM) $(DECODER)

.PHONY: clean
clean:
	rm -f $(PROGRAM)
	rm -f $(DECODER)