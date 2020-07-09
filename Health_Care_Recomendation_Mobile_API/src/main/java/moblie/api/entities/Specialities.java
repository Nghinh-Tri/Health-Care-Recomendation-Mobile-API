package moblie.api.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Specialities {

    @Id
    private int id;
    private String speciality;
    private String translation;

    public Specialities() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getTranslation() { return translation; }

    public void setTranslation(String translation) { this.translation = translation; }
}
