FROM ubuntu:22.10 as builder
WORKDIR /home
COPY src/ src/
RUN apt update -y 
RUN apt install build-essential -y
RUN apt install wget -y 
RUN apt install rsync -y 
RUN apt install libncurses5 -y 
RUN wget https://github.com/emojicode/emojicode/releases/download/v1.0-beta.2/Emojicode-1.0-beta.2-Linux-x86_64.tar.gz -O emojicode.tar.gz 
RUN tar -xzf emojicode.tar.gz
RUN cd Emojicode-1.0-beta.2-Linux-x86_64 && yes | ./install.sh
RUN emojicodec ./main.emojic