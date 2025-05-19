package com.medikhoj.model;

public class StatsCard {
	String statTitle;
	String statValue;
	String trendValue;
	String trendDirection;
	String trendLabel;
	
	public StatsCard(String statTitle,String statValue) {
		this.statTitle = statTitle;
		this.statValue = statValue;
	}
	
	public StatsCard(String statTitle, String statValue, String trendValue, String trendDirection, String trendLabel) {
		this.statTitle = statTitle;
		this.statValue = statValue;
		this.trendValue = trendValue;
		this.trendDirection = trendDirection;
		this.trendLabel = trendLabel;
	}
	
	public String getStatTitle() {
		return statTitle;
	}
	public void setStatTitle(String statTitle) {
		this.statTitle = statTitle;
	}
	public String getStatValue() {
		return statValue;
	}
	public void setStatValue(String statValue) {
		this.statValue = statValue;
	}
	public String getTrendValue() {
		return trendValue;
	}
	public void setTrendValue(String trendValue) {
		this.trendValue = trendValue;
	}
	public String getTrendDirection() {
		return trendDirection;
	}
	public void setTrendDirection(String trendDirection) {
		this.trendDirection = trendDirection;
	}
	public String getTrendLabel() {
		return trendLabel;
	}
	public void setTrendLabel(String trendLabel) {
		this.trendLabel = trendLabel;
	}
	
	
}
