# Docker-notes
Some Dockerfiles and notes

# Create image

    docker build -t <image-name> <path_to_Dockerfile_directory>

Example 

    git clone https://github.com/ahartikainen/Docker-notes/
    cd Docker-notes/Scientific_python
    docker build -t docker-py36 .
    
# Add local folder for virtual box (for Windows 7 only)

Open Virtualbox and add Shared folder for default OS.
Shared folder is found in root

e.g

    E:\Notebooks --> /Notebooks

# Run commandline

    docker run -v /Notebooks:/Notebooks -it docker-py36
    
# Run Jupyter server on localhost (Windows 7: Virtualbox IP)

    docker run -v /Notebooks:/Notebooks -w /Notebooks -it -p 8888:8888 docker-py36 jupyter notebook --ip 0.0.0.0 --no-browser

    
