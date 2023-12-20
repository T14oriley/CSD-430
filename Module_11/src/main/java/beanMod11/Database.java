//CSD 430 Module 11 Final Project
//Tyler O'Riley
//Getter Setter java file to retrieve and return data from the SQL DB

package beanMod11;

public class Database {
	private String class_Name;
	private String class_ID;
	private String e_Type;
	private String role;
	private String stance;
	private String gear;
	private String weapon;
	private String base_HP;
	private String base_MP;
	
	public String getClass_Name() {
		return class_Name;
	}
	public void setClass_Name(String class_Name) {
		this.class_Name = class_Name;
	}
	
	public String getClass_ID() {
		return class_ID;
	}
	public void setClass_ID(String class_ID) {
		this.class_ID = class_ID;
	}
	
	public String getE_Type() {
		return e_Type;
	}
	public void setE_Type(String e_Type) {
		this.e_Type = e_Type;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getStance() {
		return stance;
	}
	public void setStance(String stance) {
		this.stance = stance;
	}
	
	public String getGear() {
		return gear;
	}
	public void setCapacity(String gear) {
		this.gear = gear;
	}
	
	public String getWeapon() {
		return weapon;
	}
	public void setWeapon(String weapon) {
		this.weapon = weapon;
	}
	
	public String getBase_HP() {
		return base_HP;
	}
	public void setBase_HP(String base_HP) {
		this.base_HP = base_HP;
	}
	
	public String getBase_MP() {
		return base_MP;
	}
	public void setBase_MP(String base_MP) {
		this.base_MP = base_MP;
	}
}