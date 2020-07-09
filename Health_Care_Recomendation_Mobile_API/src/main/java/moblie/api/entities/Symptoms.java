package moblie.api.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Symptoms {
    @Id
    private int id;
    private String symptom;
    private String translation;

    public Symptoms() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSymptom() { return symptom; }

    public void setSymptom(String symptom) { this.symptom = symptom; }

    public String getTranslation() { return translation; }

    public void setTranslation(String translation) { this.translation = translation; }
}
