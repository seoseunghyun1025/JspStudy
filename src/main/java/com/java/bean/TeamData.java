package com.java.bean;

public class TeamData {
    private int rank;
    private String teamName;
    private int games;
    private int wins;
    private int draws;
    private int losses;
    public TeamData(int rank, String teamName, int games, int wins, int draws, int losses) {
        this.rank = rank;
        this.teamName = teamName;
        this.games = games;
        this.wins = wins;
        this.draws = draws;
        this.losses = losses;
    }
}
