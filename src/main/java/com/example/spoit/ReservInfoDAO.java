package com.example.spoit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ReservInfoDAO {
    @Autowired
    private DataSource dataSource;

    // 예매 정보 저장
    public void insertReservation(String userID, int gameId, String seatNumber) throws SQLException {
        String sql = "INSERT INTO reserv_info (userID, game_id, seat_number, status) VALUES (?, ?, ?, '완료')";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userID);
            ps.setInt(2, gameId);
            ps.setString(3, seatNumber);
            ps.executeUpdate();
        }
    }

    // 특정 사용자의 예매 내역 조회
    public List<ReservInfo> getReservationsByUser(String userID) throws SQLException {
        List<ReservInfo> list = new ArrayList<>();
        String sql = "SELECT * FROM reserv_info WHERE userID = ? ORDER BY reserv_date DESC";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ReservInfo info = new ReservInfo();
                    info.setuReservId(rs.getInt("u_reserv_id"));
                    info.setUserID(rs.getString("userID"));
                    info.setGameId(rs.getInt("game_id"));
                    info.setSeatNumber(rs.getString("seat_number"));
                    info.setReservDate(rs.getTimestamp("reserv_date"));
                    info.setStatus(rs.getString("status"));
                    list.add(info);
                }
            }
        }
        return list;
    }
} 