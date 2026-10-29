FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    g++ libcpp-httplib-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY ExpenseAPI.cpp .

RUN g++ -std=c++17 ExpenseAPI.cpp -o expense-api -pthread

CMD ["./expense-api"]