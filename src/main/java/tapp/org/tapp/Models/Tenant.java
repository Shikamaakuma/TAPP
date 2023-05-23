package tapp.org.tapp.Models;


import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tenants")
public class Tenant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long tenantId;

	@Column(name="tenantname")
	private String tenantName;

	@Lob
	@Column(name="picture")
	private byte[] picture;

	@Column(name="imagetype")
	private String imageType;


	public Tenant() {
	}

	public Tenant(Long tenantId, String tenantName) {
		this.tenantId = tenantId;
		this.tenantName = tenantName;
	}

	public Long getTenantId() {
		return tenantId;
	}

	public void setTenantId(Long tenantId) {
		this.tenantId = tenantId;
	}

	public String getTenantName() {
		return tenantName;
	}

	public void setTenantName(String tenantName) {
		this.tenantName = tenantName;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Tenant tenant = (Tenant) o;
		return tenantId.equals(tenant.tenantId) && tenantName.equals(tenant.tenantName);
	}

	@Override
	public int hashCode() {
		return Objects.hash(tenantId, tenantName);
	}

	@Override
	public String toString() {
		return "Tenant{" +
				"tenantId=" + tenantId +
				", tenantName='" + tenantName + '\'' +
				'}';
	}
}

