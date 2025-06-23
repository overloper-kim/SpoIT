package com.example.spoit;

import java.sql.Timestamp;

public class ReservInfo {
    private int uReservId;
    private String userID;
    private int gameId;
    private String seatNumber;
    private Timestamp reservDate;
    private String status;

    // Getter/Setter
    public int getuReservId() { return uReservId; }
    public void setuReservId(int uReservId) { this.uReservId = uReservId; }
    public String getUserID() { return userID; }
    public void setUserID(String userID) { this.userID = userID; }
    public int getGameId() { return gameId; }
    public void setGameId(int gameId) { this.gameId = gameId; }
    public String getSeatNumber() { return seatNumber; }
    public void setSeatNumber(String seatNumber) { this.seatNumber = seatNumber; }
    public Timestamp getReservDate() { return reservDate; }
    public void setReservDate(Timestamp reservDate) { this.reservDate = reservDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
} 