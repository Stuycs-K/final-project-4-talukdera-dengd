# Planes

## Color Planes

Color planes are a way to represent an image as only one of the primary colors. 

This is done by just zeroing out the other colors.

## Bit Planes

Bit planes are a way to represent the binary information of an image by dividing it into separate planes (or layers) based on the value of each individual bit.

In a greyscale image, each pixel is represented by a single binary value, which indicates the brightness of that pixel. 

This binary value is 8 bits, ranging from 0 (black) to 255 (white). Bit planes categorize each bit into a separate layer essentially, with each bit plane being another right shift of the original representation. 

For example, given a pixel with brightness 150 (binary: 10010110), the following bit planes would be:

7: 10010110  
6: 01001011  
5: 00100101  
4: 00010010  
3: 00001001  
2: 00000100  
1: 00000010  
0: 00000001  

This explains why the bit planes get more distorted as we traverse down. There is a loss of information as the more significant bits are zeroed out.

Now, you might be wondering isn't this kind of useless since most images aren't greyscale but a bunch of different colors. Hence, each pixel isn't only 8 bits? 

Well, there exists quite a lot of algorithms out there for converting an image into greyscale. 

We decided to average the RGB values and use the resulting byte to create this greyscale pixel. 

This way, we can apply bit planes to the image.

