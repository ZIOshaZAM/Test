package spring.model;

import lombok.Data;

@Data
public class UserBean {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String confirmPassword;
	

}
