#! usr/bin/env Rscript

# Output an Image in PPM Image Format

# Initialize image size
image_width = 256
image_height = 256

# Render image
# pixels are written out in rows with pixels left to right.
# rows are written out from top to bottom.
cat(paste0("P3\n", image_width, " ", image_height, "\n255\n"))

for (j in (image_height-1):0) {
  write(paste("\rScanlines remaining:", j), stderr())
  for (i in 0:(image_width-1)) {

    r = as.double(i) / as.double(image_width-1)
    g = as.double(j) / as.double(image_height-1)
    b = 0.25

    ir = as.integer(255.999 * r)
    ig = as.integer(255.999 * g)
    ib = as.integer(255.999 * b)
    
    cat(paste(ir, ig, ib, "\n"))
  }}

write("\nDone.\n", stderr())

# then run this from terminal:
# Rscript ch2.R > image.ppm
# then open `image.ppm` in ToyViewer  


