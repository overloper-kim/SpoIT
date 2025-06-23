-- H2 데이터베이스용 테이블 생성 스크립트

-- 사용자 테이블
CREATE TABLE users ( 
    user_key INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    userEmail VARCHAR(100) NOT NULL UNIQUE,
    userPhone VARCHAR(20),
    userJoinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 경기 테이블
CREATE TABLE games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    sport_type VARCHAR(20) NOT NULL,
    team1 VARCHAR(50) NOT NULL,
    team2 VARCHAR(50) NOT NULL,
    match_date TIMESTAMP NOT NULL,
    stadium VARCHAR(100),
    price INT NOT NULL
);

-- 야구 경기 데이터
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KT', 'SSG', '2025-07-08 19:00:00', '문학', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KT', 'SSG', '2025-07-09 19:00:00', '문학', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KT', 'SSG', '2025-07-10 19:00:00', '문학', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'LG', '삼성', '2025-07-04 19:00:00', '대구', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KT', 'SSG', '2025-07-05 19:00:00', '대구', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KT', 'SSG', '2025-07-06 19:00:00', '대구', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KIA', '한화', '2025-07-08 19:00:00', '대전', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KIA', '한화', '2025-07-09 19:00:00', '대전', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KIA', '한화', '2025-07-10 19:00:00', '대전', 10000);

-- 축구 경기 데이터
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '서울', '대구', '2025-08-08 19:00:00', '서울', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '서울', '안양', '2025-08-31 19:00:00', '서울', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '서울', '광주', '2025-09-27 19:00:00', '서울', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '전북', '강원', '2025-07-23 19:00:00', '전주', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '전북', '안양', '2025-08-08 19:00:00', '전주', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '전북', '대구', '2025-09-16 19:00:00', '전주', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '울산', '대전', '2025-07-23 19:00:00', '문수', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '울산', '수원FC', '2025-08-02 19:00:00', '문수', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '울산', '제주', '2025-08-09 19:00:00', '문수', 10000);

-- 농구 경기 데이터
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '고양', '안양', '2025-07-23 19:00:00', '고양', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '고양', '대구', '2025-08-02 19:00:00', '고양', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '고양', '삼성', '2025-08-09 19:00:00', '고양', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '창원', '울산', '2025-07-23 19:00:00', '창원', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '창원', '수원', '2025-08-02 19:00:00', '창원', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '창원', '부산', '2025-08-09 19:00:00', '창원', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', 'SK', '대구', '2025-07-23 19:00:00', '잠실학생', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', 'SK', '원주', '2025-08-02 19:00:00', '잠실학생', 10000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', 'SK', '삼성', '2025-08-09 19:00:00', '잠실학생', 10000);

-- 좌석 테이블
CREATE TABLE seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT NOT NULL,
    seat_row VARCHAR(10),
    seat_number INT,
    is_reserved BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

-- 좌석 예약 테이블
CREATE TABLE seat_reserv (
    s_reserv_id INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(50) NOT NULL,
    seat_id INT NOT NULL,
    reservation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id),
    UNIQUE (seat_id)
);

-- 예약 정보 테이블
CREATE TABLE reserv_info (
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
CREATE TABLE payments (
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