# Docker-notes
Some Dockerfiles and notes

# Create image

    docker build -t <image-name> <path_to_Dockerfile_directory>

Example 

    git clone https://github.com/ahartikainen/Docker-notes/
    cd Docker-notes/Scientific_python
    docker build -t docker-py36 .
    
# Add local folder for virtual box (for Windows 7 only)

Open Virtualbox and add Shared folder for 'default' OS.
Shared folder is found under root

e.g

    E:\Notebooks --> /Notebooks
    /home/user/Documents/Notebooks --> /Notebooks

# Run from terminal

    docker run -v /Notebooks:/Notebooks -it docker-py36
    
# Run Jupyter server on localhost 

    docker run -v /Notebooks:/Notebooks -w /Notebooks -it -p 8888:8888 docker-py36 jupyter notebook --ip 0.0.0.0 --no-browser

and after that open your browser in 

    localhost:8888
    
    # windows 7 use ip address for Virtualbox
    192.168.0.100:8888
    
the token for notebook is shown in docker terminal.
    
