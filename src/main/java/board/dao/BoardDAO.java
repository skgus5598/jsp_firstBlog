package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.dto.BoardDTO;


public class BoardDAO {
		
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public BoardDAO() throws SQLException {
		String url="jdbc:mysql://localhost:3306/first_blog";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,"root","sk941128");
			System.out.println("mysql 연결 성공!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}		
	}
	
	public ArrayList<BoardDTO> list(){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql="select * from first_board";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO d = new BoardDTO();
				d.setId(rs.getInt("id"));
				d.setName(rs.getString("name"));
				d.setTitle(rs.getString("title"));
				d.setContent(rs.getString("content"));
				d.setSavedate(rs.getTimestamp("savedate"));
				d.setIdgroup(rs.getInt("idgroup"));
				d.setStep(rs.getInt("step"));
				d.setIndent(rs.getInt("indent"));
				list.add(d);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void writeSave(String name, String title, String content) {
		String sql="insert into first_board(id, name, title, content, idgroup, step, indent) "
				+ "values(0,?,?,?, 0, 0,0)";
//		idgroup();		
		try {
			ps = con.prepareStatement(sql);		
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
/*	public void idgroup() {
		//이걸 처음에 셋팅해줬어야 1부터 같이 시작했을텐데..
		String sql="update first_board set idgroup = idgroup+1";//where안써도 되나?
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
*/	
	public void upHit(String id) {
		String sql="update first_board set hit = hit+1 where id =?";
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			System.out.println("여기안와?");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("설마여기갔냐/");
		}
	}
	
	public BoardDTO  contentView(String id) {
		upHit(id);
		String sql = "select * from first_board where id=?";
		BoardDTO d =null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				d = new BoardDTO();
				d.setId(rs.getInt("id"));
				d.setName(rs.getString("name"));
				d.setTitle(rs.getString("title"));
				d.setContent(rs.getString("content"));
				d.setSavedate(rs.getTimestamp("savedate"));
				d.setHit(rs.getInt("hit"));
				d.setIdgroup(rs.getInt("idgroup"));
				d.setStep(rs.getInt("step"));
				d.setIndent(rs.getInt("indent"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public void modify(String id, String title, String content) {
		String sql = "update first_board set title=?, content=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String id) {
		String sql ="delete from first_board where id="+id;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
