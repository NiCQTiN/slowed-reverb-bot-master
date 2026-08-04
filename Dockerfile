FROM oven/bun:1

WORKDIR /app

# ffmpeg is needed for audio conversion, sox for the slowed+reverb effect itself
RUN apt-get update \
  && apt-get install -y --no-install-recommends ffmpeg sox \
  && rm -rf /var/lib/apt/lists/*

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

COPY . .
RUN mkdir -p temp output

CMD ["bun", "src/bot.ts"]
