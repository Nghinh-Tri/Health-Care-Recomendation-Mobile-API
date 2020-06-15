package moblie.api.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Recommendations {

	@Id
	private int id;
	private String suggesterPhone;
	private String suggestedPhone;
	private int facility_id;
	private boolean status;

	public Recommendations() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public String getSuggesterPhone() {
		return suggesterPhone;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setFacility_id(int facility_id) {
		this.facility_id = facility_id;
	}

	public void setSuggesterPhone(String suggesterPhone) {
		this.suggesterPhone = suggesterPhone;
	}

	public String getSuggestedPhone() {
		return suggestedPhone;
	}

	public void setSuggestedPhone(String suggestedPhone) {
		this.suggestedPhone = suggestedPhone;
	}

	public int getFacility_id() {
		return facility_id;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
