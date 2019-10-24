FROM gitpod/workspace-full:latest

USER root



RUN  /bin/bash -c "bash <(curl -sL https://particle.io/install-cli)"                                           \
    && /bin/bash -c "bash <(curl -sL get.po-util.com)"                                                           \
    && po                                                                                                        \
    && chown -R gitpod:gitpod /home/gitpod/.po-util                                                              \
    && chmod -R 777 /home/gitpod/.po-util                                                                        
 
 


USER gitpod
  
RUN mkdir -p /home/gitpod/logs                                                                            \ 
    && touch /home/gitpod/logs/myDockerlog.txt                                                            \
    && echo "Installation start, made some folders in /home/gitpod" >> /home/gitpod/logs/myDockerlog.txt  \
    && echo "Installation end"                                      >> /home/gitpod/logs/myDockerlog.txt  
   

# Give back control
USER root


# Cleaning
RUN apt-get clean  && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
