package pe.edu.sistemas.cloudcam.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "captura")
@NamedQueries({
    @NamedQuery(name = "Captura.findAll", query = "SELECT c FROM Captura c")})
public class Captura {
	 private static final long serialVersionUID = 1L;
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Basic(optional = false)
	    @Column(name = "id")
	    private Integer idCaptura;
	    @Basic(optional = false)
	    @Column(name = "detail")
	    private String detail;
	    @Basic(optional = false)
	    @Lob
	    @Column(name = "value")
	    private String value;

	    public Captura() {
	    }

	    public Captura(Integer idCaptura) {
	        this.idCaptura = idCaptura;
	    }



	    public Integer getIdCaptura() {
	        return idCaptura;
	    }

	    
	    
	

	    public String getDetail() {
			return detail;
		}

		public void setDetail(String detail) {
			this.detail = detail;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		public void setIdCaptura(Integer idCaptura) {
			this.idCaptura = idCaptura;
		}

		@Override
	    public int hashCode() {
	        int hash = 0;
	        hash += (idCaptura != null ? idCaptura.hashCode() : 0);
	        return hash;
	    }

	    @Override
	    public boolean equals(Object object) {
	        // TODO: Warning - this method won't work in the case the id fields are not set
	        if (!(object instanceof Captura)) {
	            return false;
	        }
	        Captura other = (Captura) object;
	        if ((this.idCaptura == null && other.idCaptura != null) || (this.idCaptura != null && !this.idCaptura.equals(other.idCaptura))) {
	            return false;
	        }
	        return true;
	    }

	    @Override
	    public String toString() {
	        return "entidades.Captura[ id=" + idCaptura + " ]";
	    }

}
