package moblie.api.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Ratings {

	@Id
	private int id;
	private String user_id;
	private int facility_id;
	private int rate;

	public Ratings() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setFacility_id(int facility_id) {
		this.facility_id = facility_id;
	}

	public int getFacility_id() {
		return facility_id;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}
}
