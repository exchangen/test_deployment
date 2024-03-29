FROM rust:1.66.1 as build-env
WORKDIR /app
COPY . /app
RUN cargo build --release

FROM gcr.io/distroless/cc
COPY --from=build-env /app/target/release/test_deployment /
CMD ["./test_deployment"]
