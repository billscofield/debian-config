# How to Install YCM without c support

1. Download the YouCompleteMe.back.tar.bz2

1. uncompress this file to ~/.vim/bundle/YouCompleteMe

1. Go to the ~/.vim/bundle/YouCompleteMe

1. Make sure which python u are suporting, you can see by this code:
    
    ```
    vim --version | grep python
    ```
    
    '+' means support , and '-' means don't support

    to me this time is 
    
    ```
    +comments          +libcall           -python            +vreplace
    +conceal           +linebreak         +python3           +wildignore
    ```

1. python3 ./install.py

1. if there is nothing wrong, begin to enjoy YCM with urself!!!
