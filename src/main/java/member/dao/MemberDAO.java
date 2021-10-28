package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.dto.MemberDTO;

public class MemberDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	//생성자. 디비 세팅 
	public MemberDAO() throws SQLException {
		String url="jdbc:mysql://localhost:3306/first_blog";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,"root","sk941128");
			System.out.println("mysql 연결 성공!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}		
	}
	
	//모든 유저목록 가져오기
	public ArrayList<MemberDTO> member_view(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql="select * from first_blog";		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));			 
				list.add(dto);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return list;
	}
	
	//유저 생성 CREATE
	public int insert_mem(MemberDTO dto) {
		String sql="insert into first_blog(userId, pwd, name, addr) values(?,?,?,?)";
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getAddr());
			result = ps.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(dto.getUserId());
		return result; //  성공하면 1, 실패하면 0또는 -1 반납 
		}
	
	//로그인 체크(아이디,비밀번호)
	public MemberDTO loginChk(MemberDTO d) {
		String sql="select userId, pwd from first_blog where userId=?" ;
		MemberDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, d.getUserId());
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setPwd(rs.getString("pwd"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(dto.getUserId());
		System.out.println(dto.getPwd());
		return dto;
	}
	
	//유저 한명 정보 가져오기(마이페이지)
	public MemberDTO member_info(String userId) {
		String sql = "select * from first_blog where userId=?";
		MemberDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId );
			rs = ps.executeQuery(); // 하나에 대한 정보만 가져올 땐 굳이 while을 쓰지 않는다.if씀
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;		
	}
	
	//수정하기 
	public void modify_mem(MemberDTO dto) {
		String sql = "update first_blog set pwd=?, name=?, addr=? where userId=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPwd());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getUserId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	//삭제하기
	public int delete_mem(String userId) {
		String sql = "delete from first_blog where userId=?";
	//	String sql = "delete from first_blog where id =' "+userId+" ' ";
		int result=0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.executeUpdate();
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
}







