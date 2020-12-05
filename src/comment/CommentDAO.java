package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class CommentDAO {
	
		public Connection getConnection() throws Exception {
			
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/jspbeginner";
			String user = "jspid";
			String password = "jsppass";  //window= 1234;
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			
			return con;
		}



		public void insertComment(CommentBean c) {
			Connection con =null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			try {

				con = getConnection();			
				String sql="insert into comment(num,id,content,timedate) values(?,?,?,?)";
				ps=con.prepareStatement(sql);
				ps.setInt(1, c.getNum());
				ps.setString(2, c.getId());
				ps.setString(3,c.getContent());
				ps.setTimestamp(4, c.getDate());
				ps.executeUpdate();
				

			} catch (Exception e) {
		
				System.out.println("insertComment 오류"+e);
			}finally {
			if (ps!=null) {
				try {ps.close();} catch (SQLException e) {}		
			}
			if (con!=null) {
				try {con.close();} catch (SQLException e) {}		
			}	
					
			}
		}

		public ArrayList selectcomment(int num) {
			Connection con =null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			ArrayList arr=null;
			try {
				con = getConnection();
				String sql = "select *from comment  where num=? order by timedate desc ";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				rs=ps.executeQuery();
				arr=new ArrayList();
				while (rs.next()) {
					CommentBean bd=new CommentBean();
				
					bd.setId(rs.getString(2));
					bd.setContent(rs.getString(3));
					bd.setDate(rs.getTimestamp(4));
					
					arr.add(bd);
					System.out.println("성공 ");
				}
			} catch (Exception e) {
				System.out.println("selectboard sql구문 오류" +e);
			}finally {
				if (rs!=null) {
					try {rs.close();} catch (SQLException e) {}		
				}
				if (ps!=null) {
					try {ps.close();} catch (SQLException e) {}		
				}
				if (con!=null) {
					try {con.close();} catch (SQLException e) {}		
				}	
			}
			
			return arr;
			
		}

}
