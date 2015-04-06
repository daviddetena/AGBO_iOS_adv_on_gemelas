This project shows how to manage background connections with GCD.

1. Synchronous download of an image to show the UI gets blocked.
2. Change code for synchronous download to async. We download the image in background in another queue and right after that we execute the code that set the downloaded image to UIImageView in the main queue.