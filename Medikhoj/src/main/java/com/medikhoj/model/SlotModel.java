package com.medikhoj.model;

import java.time.LocalTime;

public class SlotModel {
	private int slot_id;
	private LocalTime slot_time;
	private String formatted_time;
	
	

	public SlotModel() {}
	
	public SlotModel(int slot_id, LocalTime slot_time,String formatted_time) {
		super();
		this.slot_id = slot_id;
		this.slot_time = slot_time;
		this.formatted_time=formatted_time;
	}
	public int getSlot_id() {
		return slot_id;
	}
	public void setSlot_id(int slot_id) {
		this.slot_id = slot_id;
	}
	public LocalTime getSlot_time() {
		return slot_time;
	}
	public void setSlot_time(LocalTime slot_time) {
		this.slot_time = slot_time;
	}
	
	public String getFormatted_time() {
		return formatted_time;
	}

	public void setFormatted_time(String formatted_time) {
		this.formatted_time = formatted_time;
	}
	
}
