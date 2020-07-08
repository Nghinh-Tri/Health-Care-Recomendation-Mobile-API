package moblie.api.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Facilitiesdetails {
    @Id
    private int facilitiesdetails_id;
    private int facility_id;
    private int specilitydetail_id;

    public Facilitiesdetails() {
    }

    public int getFacilitiesdetails_id() {
        return facilitiesdetails_id;
    }

    public void setFacilitiesdetails_id(int facilitiesdetails_id) {
        this.facilitiesdetails_id = facilitiesdetails_id;
    }

    public int getFacility_id() {
        return facility_id;
    }

    public void setFacility_id(int facility_id) {
        this.facility_id = facility_id;
    }

    public int getSpecilitydetail_id() {
        return specilitydetail_id;
    }

    public void setSpecilitydetail_id(int specilitydetail_id) {
        this.specilitydetail_id = specilitydetail_id;
    }
}
