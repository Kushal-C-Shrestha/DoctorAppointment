package com.medikhoj.service;

import com.medikhoj.model.ReviewModel;
import com.medikhoj.model.UserReviewModel;
import com.medikhoj.model.ReviewDoctorModel;

import java.util.List;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import com.medikhoj.config.DbConfig;



public class ReviewService {
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public ReviewService() {
		try {
			//Getting the connection from config file.
			
			this.dbConn=DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			// TODO: handle exception
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
			isConnectionError=true;
		}
	}
	
	
	public List<ReviewModel> getReviews(int id){
		
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List <ReviewModel> reviews=new  ArrayList<>();
		String query="SELECT * FROM reviews WHERE doctor_id= ?"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			stmt.setInt(1, id);
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			while (rs.next()) { //Iterating over each data row received from database.
				
				ReviewModel review=new ReviewModel(); //Creating object of the model class.
				
				//Setting the attributes as received from the database row.
				
				
				
				//Adding the object to the array list.
				reviews.add(review);
			}
			
			return reviews;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public List <UserReviewModel> getReviewsByDoctor(int doctor_id){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List<UserReviewModel> reviewsByDoctor=new ArrayList<>();
		String query="SELECT * FROM reviews r JOIN user_doctor_review udr ON r.review_id=udr.review_id JOIN users u ON u.user_id=udr.user_id "
				+ "WHERE udr.doctor_id=?";
		
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			
			stmt.setInt(1, doctor_id);			
			ResultSet rs=stmt.executeQuery();
					
			
			while (rs.next()) {
				UserReviewModel ur=new UserReviewModel();
				
				ur.setUser_name(rs.getString("user_name"));
				ur.setUser_profile(rs.getString("user_profile"));
				ur.setReview_id(rs.getInt("review_id"));
				ur.setReview_date(rs.getDate("review_date").toLocalDate());
				ur.setReview_desc(rs.getString("review_desc"));
				ur.setReview_rating(rs.getFloat("review_rating"));
				
				reviewsByDoctor.add(ur);
			}
			return reviewsByDoctor;
		}catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}
	
	
	public List <ReviewDoctorModel> getReviewsByUser(int user_id){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List<ReviewDoctorModel> reviewsByUser=new ArrayList<>();
		String query="SELECT * FROM reviews r JOIN user_doctor_review udr ON r.review_id=udr.review_id JOIN users u ON u.user_id=udr.user_id "
				+ "WHERE udr.doctor_id=?";
		
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			
			stmt.setInt(1, user_id);			
			ResultSet rs=stmt.executeQuery();
					
			
			while (rs.next()) {
				ReviewDoctorModel rd=new ReviewDoctorModel();
				
				rd.setUser_name(rs.getString("user_name"));
				rd.setReview_id(rs.getInt("review_id"));
				rd.setReview_date(rs.getDate("review_date").toLocalDate());
				rd.setReview_desc(rs.getString("review_desc"));
				rd.setReview_rating(rs.getFloat("review_rating"));
				
				reviewsByUser.add(rd);
			}
			return reviewsByUser;
		}catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}
	
	public int submitReview(int rating, String reviewText) {
		int generatedReviewId = -1;
        if (isConnectionError) {
            System.out.println("Database connection issue.");
            return -1;
        }

        String sql = "INSERT INTO reviews (review_desc, review_rating, review_date) VALUES (?, ?, ?)";
        try (PreparedStatement ps = dbConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, reviewText);
            ps.setInt(2, rating);
            ps.setDate(3, java.sql.Date.valueOf(LocalDate.now())); // today's date
            int rows = ps.executeUpdate();

            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    generatedReviewId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return generatedReviewId;
	}
	
	
	public boolean insertUserDoctorReview(int userId, int doctorId, int reviewId) {
		if (isConnectionError) {
            System.out.println("Database connection issue.");
            return false;
        }
		String sql1 = "INSERT INTO user_doctor_review (user_id, doctor_id, review_id) VALUES (?, ?, ?)";
		String sql2 = "UPDATE doctors d JOIN (SELECT udr.doctor_id, AVG(r.review_rating) AS avg_rating, COUNT(*) AS review_count FROM user_doctor_review udr JOIN reviews r ON udr.review_id = r.review_id GROUP BY udr.doctor_id) stats ON d.doctor_id = stats.doctor_id SET d.doctor_rating = stats.avg_rating, d.review_count = stats.review_count WHERE d.doctor_id = ?"; 
	    try (PreparedStatement ps1=dbConn.prepareStatement(sql1);
	    	PreparedStatement ps2=dbConn.prepareStatement(sql2)) {
	        ps1.setInt(1, userId);
	        ps1.setInt(2, doctorId);
	        ps1.setInt(3, reviewId);
	        int insertedRows= ps1.executeUpdate();
//	        return ps.executeUpdate() > 0;
	        if (insertedRows>0) {
        		ps2.setInt(1, doctorId);
                int updatedRows = ps2.executeUpdate();
                if (updatedRows > 0) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	
	//new code
	
	public List<ReviewDoctorModel> getAllUserDoctorReviews() {
	    if (isConnectionError) {
	        return null;
	    }

	    List<ReviewDoctorModel> reviews = new ArrayList<>();
	    String query = "SELECT r.*, u.user_name, d.doctor_name FROM reviews r " +
	                   "JOIN user_doctor_review udr ON r.review_id = udr.review_id " +
	                   "JOIN users u ON u.user_id = udr.user_id " +
	                   "JOIN doctors d ON d.doctor_id = udr.doctor_id";

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            ReviewDoctorModel rd = new ReviewDoctorModel();
	            rd.setReview_id(rs.getInt("review_id"));
	            rd.setReview_desc(rs.getString("review_desc"));
	            rd.setReview_rating(rs.getFloat("review_rating"));
	            rd.setReview_date(rs.getDate("review_date").toLocalDate());
	            rd.setUser_name(rs.getString("user_name"));
	            rd.setDoctor_name(rs.getString("doctor_name"));
	            reviews.add(rd);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return reviews;
	}

	//new code
	public List<ReviewDoctorModel> getAllDoctorReviewsForAdmin() {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return null;
	    }

	    List<ReviewDoctorModel> allReviews = new ArrayList<>();

	    String query = "SELECT r.review_id, r.review_desc, r.review_rating, r.review_date, reviewer.user_name AS user_name, doctor.user_name AS doctor_name " +
                "FROM reviews r " +
                "JOIN user_doctor_review udr ON r.review_id = udr.review_id " +
                "JOIN users reviewer ON udr.user_id = reviewer.user_id " +
                "JOIN doctors d ON udr.doctor_id = d.doctor_id "+
                "JOIN users doctor ON d.doctor_id = doctor.user_id";
	    

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	    	
	    	
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	        	ReviewDoctorModel review = new ReviewDoctorModel();
	            review.setReview_id(rs.getInt("review_id"));
	            review.setReview_desc(rs.getString("review_desc"));
	            review.setReview_rating(rs.getFloat("review_rating"));
	            review.setReview_date(rs.getDate("review_date").toLocalDate());
	            review.setUser_name(rs.getString("user_name"));
	            review.setDoctor_name(rs.getString("doctor_name"));
	            allReviews.add(review);
	        }
	        return allReviews;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return allReviews;
	    }
	}
	

	public boolean deleteReview(int reviewId) {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return false;
	    }

	    String deleteUserDoctorReview = "DELETE FROM user_doctor_review WHERE review_id = ?";
	    String deleteReview = "DELETE FROM reviews WHERE review_id = ?";
	    
	    try (PreparedStatement stmt1 = dbConn.prepareStatement(deleteUserDoctorReview);
	         PreparedStatement stmt2 = dbConn.prepareStatement(deleteReview)) {
	        
	        // Delete from user_doctor_review first (foreign key dependency)
	        stmt1.setInt(1, reviewId);
	        stmt1.executeUpdate();

	        // Then delete from reviews
	        stmt2.setInt(1, reviewId);
	        int rowsdeleted = stmt2.executeUpdate();

	        return rowsdeleted > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	public List<ReviewDoctorModel> getAllDoctorReviewsForDoctor(int doctor_id) {
		if (isConnectionError) {
			System.out.println("Database Connection Error");
			return null;
		}
		
		List<ReviewDoctorModel> docReviews = new ArrayList<>();
		String query =  "SELECT r.review_id, r.review_desc, r.review_rating, r.review_date, " +
                "       u.user_name " +  // optional: include doctor_name
                "FROM   user_doctor_review urd " +
                "JOIN   reviews  r ON urd.review_id = r.review_id " +
                "JOIN   users    u ON urd.user_id   = u.user_id " +
                "JOIN   doctors  d ON urd.doctor_id = d.doctor_id " +
                "WHERE  d.doctor_id = ? " +
                "ORDER BY r.review_date DESC";
		
		try(PreparedStatement stmt = dbConn.prepareStatement(query)){
			
			stmt.setInt(1, doctor_id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				 ReviewDoctorModel rd = new ReviewDoctorModel();
		            rd.setReview_id(rs.getInt("review_id"));
		            rd.setReview_desc(rs.getString("review_desc"));
		            rd.setReview_rating(rs.getFloat("review_rating"));
		            rd.setReview_date(rs.getDate("review_date").toLocalDate());
		            rd.setUser_name(rs.getString("user_name"));
		            docReviews.add(rd);
		        }
			}catch(SQLException e) {
				e.printStackTrace();
		}
		return docReviews;
	}
	
	public Boolean isReviewExist(int userId,int doctorId) {
		if (isConnectionError) {
			System.out.println("Database Connection Error");
			return false;
		}
		
		 String query = "SELECT 1 FROM user_doctor_review WHERE user_id = ? AND doctor_id = ? LIMIT 1";

		    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
		        stmt.setInt(1, userId);
		        stmt.setInt(2, doctorId);

		        ResultSet rs = stmt.executeQuery();
		        return rs.next(); // true if a row is found
		    } catch (Exception e) {
		        e.printStackTrace(); // Optional: log error properly
		        return false; // fail safely or rethrow depending on design
		    }
	}
	
	public boolean hasBookedAppointment(int userId, int doctorId) {
	    String query = "SELECT * FROM user_doctor_appointment WHERE user_id = ? AND doctor_id = ? LIMIT 1";
		System.out.println("entered");
		System.out.println(userId);
		System.out.println(doctorId);
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setInt(1, userId);
	        stmt.setInt(2, doctorId);

	        ResultSet rs = stmt.executeQuery();
	        return rs.next(); // true if a row exists
	    } catch (Exception e) {
	        e.printStackTrace(); // log properly in production
	        return false;
	    }
	}


	
}