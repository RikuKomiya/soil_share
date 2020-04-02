FROM ruby:2.6.3-alpine3.10

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc g++ yarn libc-dev nodejs tzdata mysql-client mysql-dev" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME="/app" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR ${HOME}

ADD Gemfile ${HOME}/Gemfile
ADD Gemfile.lock ${HOME}/Gemfile.lock

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache ${RUNTIME_PACKAGES} && \
    apk add --update --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apk del build-dependencies

ADD . ${HOME}

# デプロイ時にコメントアウト
# RUN RAILS_ENV=production bundle exec rake assets:precompile
CMD ["rails", "server", "-b", "0.0.0.0"]
