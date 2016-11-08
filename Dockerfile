FROM        apiaryio/jekyll
MAINTAINER  Apiary SRE Team <sre@apiary.io>

ENV REFRESHED_AT 2016-10-14

ADD ./Gemfile /srv/jekyll/Gemfile
ADD ./Gemfile.lock /srv/jekyll/Gemfile.lock

WORKDIR /srv/jekyll
RUN chown -R jekyll /srv/jekyll
RUN bundle
USER jekyll
ENV LC_ALL C.UTF-8
