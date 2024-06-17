package spring.repository;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import spring.dto.UserDTO;

public class UserRepository {
	public int insertUser(UserDTO dto) {
		int i = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into users(name,email,password) values(?,?,?);");
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPassword());
			i = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("user insert :" + e.getMessage());
		}
		return i;

	}

	public List<UserDTO> showAllUsers() {
		List<UserDTO> userList = new ArrayList<UserDTO>();
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from users;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setId(rs.getInt("user_id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPassword(rs.getString("password"));

				userList.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("user select :" + e.getMessage());
		}
		return userList;
	}

	public UserDTO findByUserEmail(String email) {
		UserDTO dto = null;
		try {
			Connection con = ConnectionClass.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from users where email = ? ");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				dto = new UserDTO();
				dto.setId(rs.getInt("user_id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPassword(rs.getString("password"));
			}

		} catch (SQLException e) {
			System.out.println("user select :" + e.getMessage());
		}
		return dto;
	}

}
