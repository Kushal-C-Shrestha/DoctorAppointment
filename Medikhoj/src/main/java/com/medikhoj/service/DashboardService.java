package com.medikhoj.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.HighestAppointments;
import com.medikhoj.model.HighestRated;
import com.medikhoj.model.StatsCard;
import com.medikhoj.model.UpcomingAppointments;

public class DashboardService {
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public DashboardService() {
		try {
			//Getting the connection from config file.
			this.dbConn=DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			// TODO: handle exception
			System.err.println("Database connection error: " + ex.getMessage());
			isConnectionError=true;
		}
	}
	
	public List <StatsCard> getAllStats() {
		List <StatsCard> statList=new ArrayList<StatsCard>();	
		statList.add(getTodaysAppointments());
		statList.add(getWeeklyUserRegistrations());
		statList.add(getPendingAppointments());
		statList.add(getUpcomingAppointmentCount());

		return statList;
	}
	
	public StatsCard getTodaysAppointments() {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return null;
	    }

	    LocalDate today = LocalDate.now();
	    Date todaysDate = Date.valueOf(today);

	    LocalDate yesterday = today.minusDays(1);
	    Date yesterdaysDate = Date.valueOf(yesterday);

	    int todayCount = 0;
	    int yesterdayCount = 0;

	    String query = "SELECT COUNT(*) FROM appointments WHERE appointment_date = ?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        // Fetch today's count
	        stmt.setDate(1, todaysDate);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                todayCount = rs.getInt(1);
	            }
	        }

	        // Fetch yesterday's count (reuse the same PreparedStatement)
	        stmt.setDate(1, yesterdaysDate);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                yesterdayCount = rs.getInt(1);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // Calculate trend
	    double trendPercentage = 0.0;
	    String trendDirection = "up";

	    if (yesterdayCount != 0) {
	        trendPercentage = ((double)(todayCount - yesterdayCount) / yesterdayCount) * 100;
	        if (trendPercentage > 0) {
	            trendDirection = "up";
	        } else if (trendPercentage < 0) {
	            trendDirection = "down";
	            trendPercentage = Math.abs(trendPercentage);
	        }
	    } else {
	        if (todayCount > 0) {
	            trendDirection = "up";
	            trendPercentage = 100.0;
	        }
	    }

	    trendPercentage = Math.round(trendPercentage * 10.0) / 10.0;

	    StatsCard appointmentCard = new StatsCard(
	        "Today's Appointments",
	        String.valueOf(todayCount),
	        String.valueOf(trendPercentage),
	        trendDirection,
	        "since yesterday"
	    );

	    return appointmentCard;
	}

	
	public StatsCard getWeeklyUserRegistrations() {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return null;
	    }

	    LocalDate today = LocalDate.now();

	    // Define current week range (Monday to Sunday)
	    LocalDate startOfWeek = today.with(java.time.DayOfWeek.MONDAY);
	    LocalDate endOfWeek = startOfWeek.plusDays(6);

	    // Define last week's range
	    LocalDate startOfLastWeek = startOfWeek.minusWeeks(1);
	    LocalDate endOfLastWeek = endOfWeek.minusWeeks(1);

	    int currentWeekCount = 0;
	    int lastWeekCount = 0;

	    String query = "SELECT COUNT(*) FROM users WHERE registration_datetime BETWEEN ? AND ?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        // Current week count
	        stmt.setDate(1, Date.valueOf(startOfWeek));
	        stmt.setDate(2, Date.valueOf(endOfWeek));
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                currentWeekCount = rs.getInt(1);
	            }
	        }

	        // Last week count
	        stmt.setDate(1, Date.valueOf(startOfLastWeek));
	        stmt.setDate(2, Date.valueOf(endOfLastWeek));
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                lastWeekCount = rs.getInt(1);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // Calculate trend
	    double trendPercentage = 0.0;
	    String trendDirection = "up";

	    if (lastWeekCount != 0) {
	        trendPercentage = ((double)(currentWeekCount - lastWeekCount) / lastWeekCount) * 100;
	        if (trendPercentage > 0) {
	            trendDirection = "up";
	        } else if (trendPercentage < 0) {
	            trendDirection = "down";
	            trendPercentage = Math.abs(trendPercentage);
	        }
	    } else if (currentWeekCount > 0) {
	        trendDirection = "up";
	        trendPercentage = 100.0;
	    }

	    trendPercentage = Math.round(trendPercentage * 10.0) / 10.0;

	    StatsCard userCard = new StatsCard(
	        "Weekly Registrations",
	        String.valueOf(currentWeekCount),
	        String.valueOf(trendPercentage),
	        trendDirection,
	        "since last week"
	    );

	    return userCard;
	}



	
	public StatsCard getPendingAppointments() {
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		LocalDate today = LocalDate.now();
		Date todaysDate = Date.valueOf(today);

		int pendingCount = 0;

		String query = "SELECT COUNT(*) FROM appointments WHERE appointment_date = ? AND appointment_status=?";

		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
		    // Fetch today's count
		    stmt.setDate(1, todaysDate);
		    stmt.setString(2,"pending");
		    
		    ResultSet rs = stmt.executeQuery();
		    if (rs.next()) {
		        pendingCount = rs.getInt(1);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}

		StatsCard appointmentCard=new StatsCard("Pending Appointment", String.valueOf(pendingCount));
		return appointmentCard;
	}
	
	
	public StatsCard getUpcomingAppointmentCount() {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return null;
	    }

	    LocalDate today = LocalDate.now();
	    LocalDate tomorrow = today.plusDays(1);
	    LocalDate endOfWeek = today.with(java.time.DayOfWeek.SUNDAY);

	    Date startDate = Date.valueOf(tomorrow);
	    Date endDate = Date.valueOf(endOfWeek);

	    int upcomingCount = 0;

	    String query = "SELECT COUNT(*) FROM appointments WHERE appointment_date BETWEEN ? AND ?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setDate(1, startDate);
	        stmt.setDate(2, endDate);

	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            upcomingCount = rs.getInt(1);
	        }
	        rs.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    StatsCard appointmentCard = new StatsCard("Upcoming Appointments", String.valueOf(upcomingCount));
	    return appointmentCard;
	}
	
	public Map<String,Integer> getBarChartData(){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		// Today's date
		LocalDate today = LocalDate.now();

		// This week's Monday
		LocalDate thisWeeksMonday = today.with(java.time.DayOfWeek.MONDAY);

		// Last week's Monday and Sunday
		LocalDate lastWeekStart = thisWeeksMonday.minusWeeks(1); // e.g., 2025-05-05
		LocalDate lastWeekEnd = thisWeeksMonday.minusDays(1);    // e.g., 2025-05-11

		// Convert to java.sql.Date
		Date sqlLastWeekStart = Date.valueOf(lastWeekStart);
		Date sqlLastWeekEnd = Date.valueOf(lastWeekEnd);

		
		Map<String,Integer> barGraphData=new LinkedHashMap<String, Integer>();
		
		String query="SELECT s.slot_time AS time, COUNT(a.appointment_id) AS total_appointments "
				+ "FROM slots s "
				+ "LEFT JOIN appointments a ON s.slot_id = a.appointment_time "
				+ "AND a.appointment_date BETWEEN ? AND ? "
				+ "GROUP BY s.slot_time "
				+ "ORDER BY s.slot_time ";
		
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setDate(1, sqlLastWeekStart);
	        stmt.setDate(2, sqlLastWeekEnd);

	        ResultSet rs = stmt.executeQuery();
	        while(rs.next()) {
	        	barGraphData.put(rs.getTime("time").toString(), rs.getInt("total_appointments"));
	        }
	        return barGraphData;
	    } catch (Exception e) {
	        e.printStackTrace();
	    	return null;
	    }
	}
	
	
	public Map<String,Integer> getLineChartData() {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return null;
	    }
	    
	    LocalDate today = LocalDate.now();
	    LocalDate thisWeeksMonday = today.with(java.time.DayOfWeek.MONDAY);
	    LocalDate lastWeekStart = thisWeeksMonday.minusWeeks(1); // e.g. 2025-05-05 (Monday)
	    LocalDate lastWeekEnd = thisWeeksMonday.minusDays(1);    // e.g. 2025-05-11 (Sunday)

	    Date sqlLastWeekStart = Date.valueOf(lastWeekStart);
	    Date sqlLastWeekEnd = Date.valueOf(lastWeekEnd);

	    Map<String,Integer> lineGraphData = new LinkedHashMap<>();

	    // Initialize map with all dates of last week with 0 to avoid missing days in chart
	    for (LocalDate date = lastWeekStart; !date.isAfter(lastWeekEnd); date = date.plusDays(1)) {
	        lineGraphData.put(date.toString(), 0);
	    }

	    String query = "SELECT a.appointment_date AS date, COUNT(a.appointment_id) AS total_appointments "
	            + "FROM appointments a "
	            + "WHERE a.appointment_date BETWEEN ? AND ? "
	            + "GROUP BY a.appointment_date "
	            + "ORDER BY a.appointment_date";

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setDate(1, sqlLastWeekStart);
	        stmt.setDate(2, sqlLastWeekEnd);

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            String date = rs.getDate("date").toString();   // e.g., "2025-05-05"
	            int count = rs.getInt("total_appointments");
	            lineGraphData.put(date, count);  // overwrite the zero with actual count
	        }
	        return lineGraphData;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public List<HighestAppointments> getHighestAppointedDoctors(){
		  if (isConnectionError) {
		        System.out.println("Database connection error");
		        return null;
		  }
		  List<HighestAppointments> highestAppointed=new ArrayList<HighestAppointments>();
		  
		  LocalDate endDate = LocalDate.now(); // Today
	      LocalDate startDate = endDate.minusMonths(1); // 1 month ago
		  
		  String query="SELECT u.user_name, u.user_profile, COUNT(uda.appointment_id) AS total_appointment "
		  		+ "FROM users u JOIN user_doctor_appointment uda ON u.user_id=uda.doctor_id "
		  		+ "JOIN appointments a ON uda.appointment_id=a.appointment_id "
		  		+ "WHERE a.appointment_date BETWEEN ? AND ? "
		  		+ "GROUP BY uda.doctor_id "
		  		+ "ORDER BY total_appointment DESC "
		  		+ "LIMIT 4";
		  
		  
		  try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
		       stmt.setDate(1,Date.valueOf(startDate));
		       stmt.setDate(2, Date.valueOf(endDate));

		        ResultSet rs = stmt.executeQuery();
		        while (rs.next()) {
		        	String name=rs.getString("user_name");
		        	String profile=rs.getString("user_profile");
		            int count = rs.getInt("total_appointment");
		            highestAppointed.add(new HighestAppointments(name, count, profile));
		        }
		        return highestAppointed;

		    } catch (Exception e) {
		        e.printStackTrace();
		        return null;
		    }		  
	}
	
	public List<HighestRated> getHighestRatedDoctors(){
		  if (isConnectionError) {
		        System.out.println("Database connection error");
		        return null;
		  }
		  List<HighestRated> highestRated=new ArrayList<HighestRated>();
		  
		 
		  
		  String query="SELECT u.user_name, u.user_profile, d.doctor_rating "
		  		+ "FROM users u JOIN doctors d ON u.user_id=d.doctor_id "
		  		+ "ORDER BY d.doctor_rating DESC limit 4";
		  
		  
		  try (PreparedStatement stmt = dbConn.prepareStatement(query)) {

		        ResultSet rs = stmt.executeQuery();
		        while (rs.next()) {
		        	String name=rs.getString("user_name");
		        	String profile=rs.getString("user_profile");
		            float rating = rs.getFloat("doctor_rating");
		            highestRated.add(new HighestRated(name,profile,rating));
		        }
		        return highestRated;

		    } catch (Exception e) {
		        e.printStackTrace();
		        return null;
		    }		  
	}
	
	public List<UpcomingAppointments> getUpcomingAppointments() {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return null;
	    }

	    List<UpcomingAppointments> upcomingList = new ArrayList<>();

	    LocalDate today = LocalDate.now();
	    LocalDate tomorrow = today.plusDays(1);

	    // Always get end of *next* Sunday if tomorrow is already past this week's Sunday
	    LocalDate thisSunday = today.with(java.time.DayOfWeek.SUNDAY);
	    LocalDate endOfWeek = tomorrow.isAfter(thisSunday)
	        ? tomorrow.with(java.time.DayOfWeek.SUNDAY).plusWeeks(1)
	        : thisSunday;

	    Date startDate = Date.valueOf(tomorrow);
	    Date endDate = Date.valueOf(endOfWeek);

	    System.out.println("Querying appointments from " + startDate + " to " + endDate);

	    String query = "SELECT p.user_name AS patient_name, p.user_profile, doc.user_name AS doctor_name, "
	             + "d.doctor_specialization, a.appointment_date, s.slot_time "
	             + "FROM users p "
	             + "JOIN user_doctor_appointment uda ON p.user_id = uda.user_id "
	             + "JOIN users doc ON uda.doctor_id = doc.user_id "
	             + "JOIN appointments a ON uda.appointment_id = a.appointment_id "
	             + "JOIN slots s ON s.slot_id = a.appointment_time "
	             + "JOIN doctors d ON uda.doctor_id = d.doctor_id "
	             + "WHERE a.appointment_date BETWEEN ? AND ? "
	             + "ORDER BY a.appointment_date "
	             + "LIMIT 4";


	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setDate(1, startDate);
	        stmt.setDate(2, endDate);

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            String username = rs.getString("patient_name");
	            String userProfile = rs.getString("user_profile");
	            String doctorName = rs.getString("doctor_name");
	            String doctorSpec = rs.getString("doctor_specialization");
	            LocalDate appointmentDate = rs.getDate("appointment_date").toLocalDate();
	            LocalTime appointmentTime = rs.getTime("slot_time").toLocalTime();
	            System.out.println(appointmentTime);

	            System.out.println("Found appointment: " + username + " with " + doctorName + " on " + appointmentDate);

	            upcomingList.add(new UpcomingAppointments(
	                username, userProfile, doctorName, doctorSpec, appointmentDate, appointmentTime
	            ));
	        }

	        return upcomingList;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}



	
	
}
