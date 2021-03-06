package org.bsm.model;
// Generated 2020-2-13 22:52:44 by Hibernate Tools 4.0.1.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Ttag generated by hbm2java
 */
@Entity
@Table(name = "ttag", catalog = "bookmanager", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Ttag implements java.io.Serializable {

	private String id;
	private String name;
	private Set<Tbook> tbooks = new HashSet<Tbook>(0);

	public Ttag() {
	}

	public Ttag(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public Ttag(String id, String name, Set<Tbook> tbooks) {
		this.id = id;
		this.name = name;
		this.tbooks = tbooks;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false, length = 20)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "name", unique = true, nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ttag")
	public Set<Tbook> getTbooks() {
		return this.tbooks;
	}

	public void setTbooks(Set<Tbook> tbooks) {
		this.tbooks = tbooks;
	}

}
