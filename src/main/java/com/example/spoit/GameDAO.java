package com.example.spoit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class GameDAO {
    
    @Autowired
    private DataSource dataSource;

    // DB 연결을 가져오는 메서드
    public Connection open() {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    // 모든 경기 목록 조회
    public List<Game> getAllGames() throws SQLException {
        Connection conn = open();
        List<Game> games = new ArrayList<>();
        String sql = "SELECT * FROM games ORDER BY match_date";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Game game = new Game();
                game.setGameId(rs.getInt("game_id"));
                game.setSportType(rs.getString("sport_type"));
                game.setTeam1(rs.getString("team1"));
                game.setTeam2(rs.getString("team2"));
                game.setMatchDate(rs.getTimestamp("match_date"));
                game.setStadium(rs.getString("stadium"));
                game.setPrice(rs.getInt("price"));
                games.add(game);
            }
            rs.close();
        }
        return games;
    }

    // 스포츠 종목별 경기 목록 조회
    public List<Game> getGamesBySportType(String sportType) throws SQLException {
        Connection conn = open();
        List<Game> games = new ArrayList<>();
        String sql = "SELECT * FROM games WHERE sport_type = ? ORDER BY match_date";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, sportType);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Game game = new Game();
                game.setGameId(rs.getInt("game_id"));
                game.setSportType(rs.getString("sport_type"));
                game.setTeam1(rs.getString("team1"));
                game.setTeam2(rs.getString("team2"));
                game.setMatchDate(rs.getTimestamp("match_date"));
                game.setStadium(rs.getString("stadium"));
                game.setPrice(rs.getInt("price"));
                games.add(game);
            }
            rs.close();
        }
        return games;
    }

    // 특정 경기 상세 정보 조회
    public Game getGameById(int gameId) throws SQLException {
        Connection conn = open();
        Game game = null;
        String sql = "SELECT * FROM games WHERE game_id = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, gameId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                game = new Game();
                game.setGameId(rs.getInt("game_id"));
                game.setSportType(rs.getString("sport_type"));
                game.setTeam1(rs.getString("team1"));
                game.setTeam2(rs.getString("team2"));
                game.setMatchDate(rs.getTimestamp("match_date"));
                game.setStadium(rs.getString("stadium"));
                game.setPrice(rs.getInt("price"));
            }
            rs.close();
        }
        return game;
    }
} 