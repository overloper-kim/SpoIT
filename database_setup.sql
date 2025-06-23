-- MySQL 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS spoit CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 데이터베이스 사용
USE spoit;

-- 사용자 테이블
CREATE TABLE IF NOT EXISTS users (
    userID VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 게임 테이블
CREATE TABLE IF NOT EXISTS games (
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

-- 좌석 테이블
CREATE TABLE IF NOT EXISTS seats (
    seatID INT AUTO_INCREMENT PRIMARY KEY,
    gameID INT NOT NULL,
    seatNumber VARCHAR(20) NOT NULL,
    seatRow VARCHAR(10) NOT NULL,
    seatSection VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status ENUM('available', 'reserved', 'sold') DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (gameID) REFERENCES games(gameID) ON DELETE CASCADE,
    UNIQUE KEY unique_seat (gameID, seatNumber, seatRow, seatSection)
);

-- 예약 테이블
CREATE TABLE IF NOT EXISTS reservations (
    reservationID INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(50) NOT NULL,
    gameID INT NOT NULL,
    seatID INT NOT NULL,
    reservationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    totalAmount DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE,
    FOREIGN KEY (gameID) REFERENCES games(gameID) ON DELETE CASCADE,
    FOREIGN KEY (seatID) REFERENCES seats(seatID) ON DELETE CASCADE
);

-- 결제 테이블
CREATE TABLE IF NOT EXISTS payments (
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    reservationID INT NOT NULL,
    paymentMethod ENUM('credit_card', 'bank_transfer', 'mobile_payment') NOT NULL,
    paymentAmount DECIMAL(10,2) NOT NULL,
    paymentStatus ENUM('pending', 'completed', 'failed', 'refunded') DEFAULT 'pending',
    paymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (reservationID) REFERENCES reservations(reservationID) ON DELETE CASCADE
);

-- 샘플 데이터 삽입
INSERT INTO users (userID, password, name, email, phone) VALUES
('admin', 'admin123', '관리자', 'admin@spoit.com', '010-1234-5678'),
('user1', 'user123', '홍길동', 'hong@example.com', '010-1111-2222'),
('user2', 'user123', '김철수', 'kim@example.com', '010-3333-4444');

INSERT INTO games (gameName, gameDate, gameTime, venue, homeTeam, awayTeam, totalSeats, availableSeats, price, description) VALUES
('K리그1 2024 시즌 - FC서울 vs 수원삼성', '2024-03-15', '19:30:00', '서울월드컵경기장', 'FC서울', '수원삼성', 50000, 45000, 30000.00, 'K리그1 2024 시즌 개막전'),
('K리그1 2024 시즌 - 울산현대 vs 전북현대', '2024-03-16', '15:00:00', '울산문수축구경기장', '울산현대', '전북현대', 45000, 40000, 25000.00, 'K리그1 2024 시즌 2라운드'),
('K리그1 2024 시즌 - 포항스틸러스 vs 부산아이파크', '2024-03-17', '16:00:00', '포항스틸야드', '포항스틸러스', '부산아이파크', 35000, 30000, 20000.00, 'K리그1 2024 시즌 3라운드'),
('K리그1 2024 시즌 - 인천유나이티드 vs 대구FC', '2024-03-22', '19:30:00', '인천축구전용구장', '인천유나이티드', '대구FC', 40000, 35000, 22000.00, 'K리그1 2024 시즌 4라운드'),
('K리그1 2024 시즌 - 강원FC vs 제주유나이티드', '2024-03-23', '15:00:00', '춘천송암레포츠타운', '강원FC', '제주유나이티드', 30000, 25000, 18000.00, 'K리그1 2024 시즌 5라운드');

-- 샘플 좌석 데이터 (첫 번째 게임에 대한 좌석)
INSERT INTO seats (gameID, seatNumber, seatRow, seatSection, price, status) VALUES
(1, '1', 'A', 'VIP', 50000.00, 'available'),
(1, '2', 'A', 'VIP', 50000.00, 'available'),
(1, '3', 'A', 'VIP', 50000.00, 'available'),
(1, '1', 'B', 'VIP', 50000.00, 'available'),
(1, '2', 'B', 'VIP', 50000.00, 'available'),
(1, '1', 'A', '일반', 30000.00, 'available'),
(1, '2', 'A', '일반', 30000.00, 'available'),
(1, '3', 'A', '일반', 30000.00, 'available'),
(1, '1', 'B', '일반', 30000.00, 'available'),
(1, '2', 'B', '일반', 30000.00, 'available'); 