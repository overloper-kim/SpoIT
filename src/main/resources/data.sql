-- H2 데이터베이스용 샘플 데이터

-- 사용자 데이터
INSERT INTO users(userID, password, userName, userEmail, userPhone) VALUES('admin', 'admin123', '관리자', 'admin@spoit.com', '010-1234-5678');
INSERT INTO users(userID, password, userName, userEmail, userPhone) VALUES('user1', 'user123', '홍길동', 'hong@example.com', '010-1111-2222');
INSERT INTO users(userID, password, userName, userEmail, userPhone) VALUES('user2', 'user123', '김철수', 'kim@example.com', '010-3333-4444');

-- 야구 경기 데이터
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', '삼성', 'SSG', '2025-07-08 19:00:00', '대구삼성라이온즈파크', 15000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', '한화', '삼성', '2025-07-09 19:00:00', '대전한화생명이글스파크', 12000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'SSG', '한화', '2025-07-10 19:00:00', '인천SSG랜더스필드', 13000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'LG', '삼성', '2025-07-04 19:00:00', '잠실야구장', 18000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KT', 'SSG', '2025-07-05 19:00:00', '수원KT위즈파크', 14000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', 'KIA', '한화', '2025-07-06 19:00:00', '광주기아챔피언스필드', 16000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', '두산', '롯데', '2025-07-08 19:00:00', '잠실야구장', 17000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', '키움', 'NC', '2025-07-09 19:00:00', '고척스카이돔', 15000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('야구', '롯데', '두산', '2025-07-10 19:00:00', '사직야구장', 16000);

-- 축구 경기 데이터
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', 'FC서울', '대구FC', '2025-08-08 19:00:00', '서울월드컵경기장', 25000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', 'FC서울', '수원삼성', '2025-08-31 19:00:00', '서울월드컵경기장', 30000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', 'FC서울', '광주FC', '2025-09-27 19:00:00', '서울월드컵경기장', 22000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '전북현대', '강원FC', '2025-07-23 19:00:00', '전주월드컵경기장', 28000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '전북현대', '수원FC', '2025-08-08 19:00:00', '전주월드컵경기장', 26000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '전북현대', '대구FC', '2025-09-16 19:00:00', '전주월드컵경기장', 27000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '울산현대', '대전하나시티즌', '2025-07-23 19:00:00', '울산문수축구경기장', 24000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '울산현대', '수원FC', '2025-08-02 19:00:00', '울산문수축구경기장', 23000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('축구', '울산현대', '제주유나이티드', '2025-08-09 19:00:00', '울산문수축구경기장', 25000);

-- 농구 경기 데이터
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '고양소노', '안양KGC', '2025-07-23 19:00:00', '고양체육관', 20000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '고양소노', '대구한국가스공사', '2025-08-02 19:00:00', '고양체육관', 18000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '고양소노', '서울삼성', '2025-08-09 19:00:00', '고양체육관', 19000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '창원LG', '울산현대모비스', '2025-07-23 19:00:00', '창원실내체육관', 22000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '창원LG', '수원KT', '2025-08-02 19:00:00', '창원실내체육관', 20000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '창원LG', '부산KCC', '2025-08-09 19:00:00', '창원실내체육관', 21000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '서울SK', '대구한국가스공사', '2025-07-23 19:00:00', '잠실학생체육관', 25000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '서울SK', '원주DB', '2025-08-02 19:00:00', '잠실학생체육관', 23000);
INSERT INTO games(sport_type, team1, team2, match_date, stadium, price) VALUES('농구', '서울SK', '서울삼성', '2025-08-09 19:00:00', '잠실학생체육관', 24000); 