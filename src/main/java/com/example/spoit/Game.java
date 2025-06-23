package com.example.spoit;

import java.sql.Timestamp;

public class Game {
    private int gameId;
    private String sportType;
    private String team1;
    private String team2;
    private Timestamp matchDate;
    private String stadium;
    private int price;
    private int availableSeats;
    
    // Getter & Setter
    public int getGameId() {
        return gameId;
    }
    
    public void setGameId(int gameId) {
        this.gameId = gameId;
    }
    
    public String getSportType() {
        return sportType;
    }
    
    public void setSportType(String sportType) {
        this.sportType = sportType;
    }
    
    public String getTeam1() {
        return team1;
    }
    
    public void setTeam1(String team1) {
        this.team1 = team1;
    }
    
    public String getTeam2() {
        return team2;
    }
    
    public void setTeam2(String team2) {
        this.team2 = team2;
    }
    
    public Timestamp getMatchDate() {
        return matchDate;
    }
    
    public void setMatchDate(Timestamp matchDate) {
        this.matchDate = matchDate;
    }
    
    public String getStadium() {
        return stadium;
    }
    
    public void setStadium(String stadium) {
        this.stadium = stadium;
    }
    
    public int getPrice() {
        return price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    
    public int getAvailableSeats() {
        return availableSeats;
    }
    
    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }
} 