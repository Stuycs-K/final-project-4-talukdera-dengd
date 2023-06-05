# Work Log

## Abid Talukder

### May 17, 2023

Updated README with project description

### May 22, 2023

Added red, green, blue, and gray planes

### May 24, 2023

Added functions to view the images in all the different RGB bit planes from 0-7 for each

### May 25, 2023

Added alpha bit plane and reduced all the different bit plane functions to only 3 functions

### May 30, 2023

Merging code

### Jun 1, 2023

- Edited the bit plane functions so that displaying the bit plane doesn't destroy the image data. Earlier, when we displayed the a bit plane of an image, all the other planes were erased
- Added function to set an entire bit plane to only white, allowing me to start drawing on the image
- Added function to edit individual pixels in a bit plane in order to draw on it
- Added functionality to right arrow to switch between the bit planes
- Added hideImages class in order to hide images within other images and convert images to only black and white switch is from different from grayscale

### Jun 2, 2023

- Clicking compress in the beginning directs a user to open a folder of images and go to the compress page
- The program allows users to only select images
- Bug fix for null pointer exceptions throughout the program
- Added functionality to draw button to activate draw functions and keep track of mouse movement for drawing
- Save button saves the image and all changes made to it
- Left arrow functionality to switch between the bit planes

### Jun 3, 2023

- Compression algorithm goes iterates through the folder of images to make sure that there are valid images to compress
- Compression algorithm resizes all images to 1200 x 600 to fit the screen and hides all the images within the first image by applying previous functions from the hideImages class

### Jun 4, 2023

- Bug fixes to save button

### Jun 5, 2023

- Worklog
- Finished draw view button so that when you see the pixels you drew on, they appear as large dots just like you drew them


## David Deng

### May 25, 2023

- Indented code for readability and debugging purposes

### June 1, 2023

- Add basic GUI model for all three pages with basic interactivity.
- Implement basic connection to program on user clicks.

### June 4, 2023

- Cleaned codebase.
- Remove requirement to choose image to prevent need to restart program if they click on one option.
- Connect home page to draw page.
- Fix GUI bugs where multiple pages were being displayed at a time.
- Added information on both draw and compress page where the current bit plane would be shown for more information.
- Fixed bug where compress page buttons were conflicting.
- Added draw view button to allow user to see their drawing after they finished.

### June 5, 2023
- Added plane information to presentation
