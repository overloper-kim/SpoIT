-- H2 데이터베이스용 테이블 스키마

-- 사용자 테이블
CREATE TABLE IF NOT EXISTS users ( 
    user_key INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    userEmail VARCHAR(100) NOT NULL UNIQUE,
    userPhone VARCHAR(20),
    userJoinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 경기 테이블
CREATE TABLE IF NOT EXISTS games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    sport_type VARCHAR(20) NOT NULL,
    team1 VARCHAR(50) NOT NULL,
    team2 VARCHAR(50) NOT NULL,
    match_date TIMESTAMP NOT NULL,
    stadium VARCHAR(100),
    price INT NOT NULL
);

-- 좌석 테이블
CREATE TABLE IF NOT EXISTS seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT NOT NULL,
    seat_row VARCHAR(10),
    seat_number INT,
    is_reserved BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

-- 좌석 예약 테이블
CREATE TABLE IF NOT EXISTS seat_reserv (
    s_reserv_id INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(50) NOT NULL,
    seat_id INT NOT NULL,
    reservation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id),
    UNIQUE (seat_id)
);

-- 예약 정보 테이블
CREATE TABLE IF NOT EXISTS reserv_info (
    u_reserv_id INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(50), 
    game_id INT,
    seat_number VARCHAR(20),
    reserv_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT '완료',
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

-- 결제 테이블
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    reserv_id INT,
    userID VARCHAR(50),
    amount INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (reserv_id) REFERENCES reserv_info(u_reserv_id),
    FOREIGN KEY (userID) REFERENCES users(userID)
); 