USE spoit;

CREATE TABLE users (
    userID VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE games (
    gameID INT AUTO_INCREMENT PRIMARY KEY,
    gameName VARCHAR(200) NOT NULL,
    gameDate DATE NOT NULL,
    gameTime TIME NOT NULL,
    venue VARCHAR(200) NOT NULL,
    homeTeam VARCHAR(100) NOT NULL,
    awayTeam VARCHAR(100) NOT NULL,
    totalSeats INT NOT NULL,
    availableSeats INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users (userID, password, name, email, phone) VALUES
('admin', 'admin123', '관리자', 'admin@spoit.com', '010-1234-5678'),
('user1', 'user123', '홍길동', 'hong@example.com', '010-1111-2222'),
('user2', 'user123', '김철수', 'kim@example.com', '010-3333-4444');

INSERT INTO games (gameName, gameDate, gameTime, venue, homeTeam, awayTeam, totalSeats, availableSeats, price, description) VALUES
('K리그1 2024 시즌 - FC서울 vs 수원삼성', '2024-03-15', '19:30:00', '서울월드컵경기장', 'FC서울', '수원삼성', 50000, 45000, 30000.00, 'K리그1 2024 시즌 개막전'),
('K리그1 2024 시즌 - 울산현대 vs 전북현대', '2024-03-16', '15:00:00', '울산문수축구경기장', '울산현대', '전북현대', 45000, 40000, 25000.00, 'K리그1 2024 시즌 2라운드'),
('K리그1 2024 시즌 - 포항스틸러스 vs 부산아이파크', '2024-03-17', '16:00:00', '포항스틸야드', '포항스틸러스', '부산아이파크', 35000, 30000, 20000.00, 'K리그1 2024 시즌 3라운드'); 