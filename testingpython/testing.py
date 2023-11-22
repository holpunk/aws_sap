import time

# List of strings to display in the slideshow
strings = [
    "Hello,",
    "This is a",
    "String Slideshow",
    "In Python",
    "Enjoy!",
]

# Delay between each string (in seconds)
delay = 2

# Loop through the list of strings and display each one
for string in strings:
    print(string)
    time.sleep(delay)
