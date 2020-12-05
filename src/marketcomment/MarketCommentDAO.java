package marketcomment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class MarketCommentDAO {
	
		public Connection getConnection() throws Exception {
			
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/jspbeginner";
			String user = "jspid";
			String password = "jsppass";  
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			
			return con;
		}



		public void insertMarketComment(MarketCommentBean mcBean) {
			Connection con =null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			try {

				con = getConnection();			
				String sql="insert into marketcomment(num,id,content,timedate) values(?,?,?,?)";
				ps=con.prepareStatement(sql);
				ps.setInt(1, mcBean.getNum());
				ps.setString(2, mcBean.getId());
				ps.setString(3, mcBean.getContent());
				ps.setTimestamp(4, mcBean.getDate());
				ps.executeUpdate();
				

			} catch (Exception e) {
		
				System.out.println("insertMarketComment 오류"+e);
			}finally {
			if (ps!=null) {
				try {ps.close();} catch (SQLException e) {}		
			}
			if (con!=null) {
				try {con.close();} catch (SQLException e) {}		
			}	
					
			}
			
		}//insertMarketComment

		public ArrayList selectMarketComment(int num) {
			Connection con =null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			ArrayList arr=null;
			try {
				con = getConnection();
				String sql = "select *from marketcomment  where num=? order by timedate desc ";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				rs=ps.executeQuery();
				arr=new ArrayList();
				while (rs.next()) {
					MarketCommentBean mcb = new MarketCommentBean();
				
					mcb.setId(rs.getString(2));
					mcb.setContent(rs.getString(3));
					mcb.setDate(rs.getTimestamp(4));
					
					arr.add(mcb);
					System.out.println("성공 ");
				}
			} catch (Exception e) {
				System.out.println("selectMarketComment sql구문 오류" +e);
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
