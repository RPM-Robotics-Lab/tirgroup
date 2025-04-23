FROM jekyll/jekyll:pages

# Alpine에 필요한 빌드 도구 설치
RUN apk update && apk add --no-cache \
    build-base \
    libssl1.1 \
    make \
    bash \
    && rm -rf /var/cache/apk/*

# Jekyll 디렉토리로 작업 디렉토리 설정
WORKDIR /srv/jekyll

# Gemfile을 복사하고 bundle install 실행
COPY Gemfile* ./
RUN bundle install

# 사이트 빌드
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]