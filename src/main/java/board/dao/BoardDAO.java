package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.dto.BoardDTO;
import paging.PageDTO;


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
	
	public ArrayList<BoardDTO> list(int start, int end){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	//	String sql="select * from first_board";
		String sql ="select B.* from(select @rownum:=@rownum+1 rn, A.* from first_board A, (select @rownum:=0) R)B\n"
				+ "where rn between ? and ?";
		try{
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO d = new BoardDTO();
				d.setId(rs.getInt("id"));
				d.setName(rs.getString("name"));
				d.setTitle(rs.getString("title"));
				d.setHit(rs.getInt("hit"));
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
				+ "values(0,?,?,?,0, 0,0)";
		try {
			ps = con.prepareStatement(sql);		
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);	
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int d = getId();
		hitIdgroup(d);		
	}
	private int getId() {
		String sql = "select * from first_board";
		BoardDTO d= null;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				d = new BoardDTO();
				d.setId(rs.getInt("id"));	}
		} catch (Exception e) {	e.printStackTrace();	}
		return d.getId();		
	}
	private void hitIdgroup(int id) {
		String sql = "update first_board set idgroup = id where id=? ";		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id );
			ps.executeUpdate();
		} catch (Exception e) {	e.printStackTrace();}
	}
	
	

	public void upHit(String id) {
		String sql="update first_board set hit = hit+1 where id =?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
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
		String sql ="delete from first_board where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void reply(BoardDTO dto) {
		String sql = "insert into first_board(id, name, title, content, idgroup, step, indent)"
				+ "values(0, ?,?,?,0,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName() );
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getStep()+1);  //댓글들에 대한 위치 조정 .
			ps.setInt(5, dto.getIndent()+1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int d = getId();
		hitIdgroup(d);		
	}
	public PageDTO pagingNum(int start) {
		PageDTO pd = new PageDTO();
		if(start == 0) {
			start = 1;
		}		
		int pageNum = 5;
		int totalPage = getTotalPage();//총 게시물 수를 알아야 얻어올 수 있다. 따로 로직 작성 
		
		int totEndPage = totalPage / pageNum;
		if(totalPage % pageNum != 0) {
			totEndPage ++;
		}
		int endPage = start * pageNum;
		int startPage = endPage + 1 -pageNum;
		
		pd.setStartPage(startPage);
		pd.setEndPage(endPage);
		pd.setTotEndPage(totEndPage);
	
		return pd;		

	}
	public int getTotalPage() {
		String sql = "select count(*) from first_board";
		int totalPage=0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				totalPage = rs.getInt(1);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPage;
	}
	
	
	
}




