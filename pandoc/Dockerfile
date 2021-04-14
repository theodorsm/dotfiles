
FROM pandoc/latex:2.9.2

RUN tlmgr list
RUN tlmgr update --self && \
    tlmgr install \
    merriweather \
    fontaxes \
    mweights \
    mdframed \
    needspace \
    sourcesanspro \
    sourcecodepro \
    titling \
    ly1 \
    pagecolor \
    adjustbox \
    collectbox \
    titlesec \
    fvextra \
    pdftexcmds \
    footnotebackref \
    zref \
    fontawesome5 \
    footmisc \
    etoolbox \
    sectsty

COPY ./eisvogel.tex /root/.pandoc/templates/eisvogel.latex
# Need systemfonts to use xelatex
COPY ./computer-modern /usr/share/fonts
COPY ./dejavu-sans-mono /usr/share/fonts

RUN fc-cache -f -v
