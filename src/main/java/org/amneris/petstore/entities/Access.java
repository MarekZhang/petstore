package org.amneris.petstore.entities;

import java.io.Serializable;
import java.util.Date;

import org.apache.tapestry5.beaneditor.NonVisual;
import org.hibernate.annotations.NaturalId;
import org.tynamo.descriptor.annotation.PropertyDescriptor;

import javax.validation.constraints.NotNull;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="accesses")
public class Access implements Serializable 
{
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="profile_id")
	private Profile profile;

	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="tab_id")
	private Tab tab;
	
	private int view;
	
	private int add;
	
	private int edit;
	
	private int delete;
	
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public Tab getTab() {
		return tab;
	}

	public void setTab(Tab tab) {
		this.tab = tab;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getAdd() {
		return add;
	}

	public void setAdd(int add) {
		this.add = add;
	}

	public int getEdit() {
		return edit;
	}

	public void setEdit(int edit) {
		this.edit = edit;
	}

	public int getDelete() {
		return delete;
	}

	public void setDelete(int delete) {
		this.delete = delete;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof Access)) return false;

		Access access = (Access) o;

		if (getProfile() != null ? !getProfile().equals(access.getProfile()) && !getTab().equals(access.getTab()) : access.getProfile() != null) return false;

		return true;
	}

	@Override
	public int hashCode() {
		return getProfile() != null ? getProfile().hashCode() : 0;
	}

	public String toString()
	{
		return getProfile().getName() +" "+ getTab().getName();
	}
}