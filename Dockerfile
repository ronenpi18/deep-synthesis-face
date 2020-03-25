FROM python:3.5
COPY /training .
WORKDIR .
RUN ls
RUN pip install -r "requirements.txt"
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p $HOME/miniconda
RUN export PATH="$HOME/miniconda/bin:$PATH"
CMD conda init
CMD conda env create -f environment.yml
CMD conda install -c conda-forge opencv
CMD conda install -c anaconda cmake 
CMD conda install -c menpo dlib
RUN pip install opencv-python
RUN pip install --upgrade pip
RUN pip install cmake
RUN pip install dlib
EXPOSE 5000
CMD python generate_train_data.py --file galgadot.mp4 --num 400 --landmark-model shape_predictor_68_face_landmarks.dat
