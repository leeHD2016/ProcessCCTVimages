# Process CCTV images

Bash script to process snapshots taken by the camera into a timelaps video.

The Foscam CCTV camera takes a snaphot every 1 second and uploads them to the local FTP server. This script is called by crontab once a day (02.00) and:-

  1 - Creates a variable of yesterday's date ($varDate).
  2 - Creates a local (to the camera user) directory to store the orignial snapshots. 
  3 - Looks in the uploads directory for .jpg files with yesterday's date and moves them into the directory created above.
  4 - Uses ImageMagic to watermark each image with the date and time it was taken. (source for watermark is the file name given by the camera).
  5 - Uses Mencoder to turn the watermarked images intp a timelaps for later reviewing.
  6 - Finds directories older than 7 days and removes them and their contents.
