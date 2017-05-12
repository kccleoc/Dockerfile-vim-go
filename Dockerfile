FROM golang:alpine

RUN apk update \
 && apk add --no-cache \
        git \
        curl \
        vim \
 #See https://github.com/fatih/vim-go-tutorial#hello-world
 && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
 && git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go \
 && echo -e "call plug#begin()\nPlug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }\ncall plug#end()" > ~/.vimrc \
 && apk del --purge curl

ENTRYPOINT ["/usr/bin/vim"]
CMD ["/home/TextAtHostPWD"]
#Useful when docker run -it --rm --volumes-from cv-go-codebase -v $(pwd):/home kccleoc/imagename fileeditedbyvim
