package market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MarketDAO {
	
	//전역변수 선언
	Connection con = null;
	ResultSet  rs = null;
	PreparedStatement pstmt = null;
	String sql="";
	
	
	public void resourceClose(){
	  try{	
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(con != null) con.close();
	  }catch(Exception e){
		  System.out.println("자원해제 실패 : " + e);
	  }
	}//resourceClose()
	
	
	
	
	private Connection getConnection() throws Exception{ 		
		Connection con = null;
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = ds.getConnection();
		
		return con;
		
	}//getConnection
	
	
	
	public void insertMarket(MarketBean mBean){ 		
		
		int num = 0;
		
		try {
			
			con = getConnection();
			
			sql = "select max(num) from market";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			sql = "insert into market "
				+ "(num,name,passwd,subject,"
				+ "content,re_ref,re_lev,"
				+ "re_seq,readcount,date,ip)"
				+"values(?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, mBean.getName());
			pstmt.setString(3, mBean.getPasswd());
			pstmt.setString(4, mBean.getSubject());
			pstmt.setString(5, mBean.getContent());
			pstmt.setInt(6, num);								
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setTimestamp(10, mBean.getDate()); 
			pstmt.setString(11, mBean.getIp()); 
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertMarket메소드 내부에서 예외발생 : " + e);
		} finally {
			
			resourceClose();
		}
		
	}//insertMarket
	
	
	
	public int getMarketCount(){
		
		int count = 0;
		
		try {
			
			con = getConnection();
			
			sql = "select count(*) from market";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getMarketCount()메소드 내부에서 예외발생 : " + e);
		} finally {
			
			resourceClose();
		}	
		return count; 
	}
	
	
	public List<MarketBean> getMarketList(int startRow,int pageSize){
		
		
		List<MarketBean> marketList = new ArrayList<MarketBean>();
		
		try{
			
			con = getConnection();
			
			sql = "select * from market order by re_ref desc, re_seq asc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				MarketBean mBean = new MarketBean();
				
				mBean.setContent(rs.getString("content"));
				mBean.setDate(rs.getTimestamp("date"));
				mBean.setIp(rs.getString("ip"));
				mBean.setName(rs.getString("name"));
				mBean.setNum(rs.getInt("num"));
				mBean.setPasswd(rs.getString("passwd"));
				mBean.setRe_lev(rs.getInt("re_lev"));
				mBean.setRe_seq(rs.getInt("re_seq"));
				mBean.setRe_ref(rs.getInt("re_ref"));
				mBean.setReadcount(rs.getInt("readcount"));
				mBean.setSubject(rs.getString("subject"));
			
				marketList.add(mBean);
			
			}//while반복문 끝
		
		}catch(Exception e){
			System.out.println("getMarketList메소드 내부에서 예외 발생 : " + e);
		}finally {
			
			resourceClose();
		}
		
		return marketList; 
						
	}//getMarketList
	
	
	public void updateReadCount(int num){
		try {
			
			con = getConnection();
			
			sql = "update market set readcount = readcount+1  where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateReadCount메소드 내부에서 예외 발생 : " + e.toString());
		} finally {
			
			resourceClose();
		}	
	}
	
	
	public MarketBean getMarket(int num){	
		MarketBean mBean = null;		
		try {
			
			con = getConnection();
			
			sql = "select * from market where num=?"; 
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
				
			
			rs.next();
			mBean = new MarketBean();
			mBean.setContent(rs.getString("content"));
			mBean.setDate(rs.getTimestamp("date"));
			mBean.setIp(rs.getString("ip"));
			mBean.setName(rs.getString("name"));
			mBean.setNum(rs.getInt("num"));
			mBean.setPasswd(rs.getString("passwd"));
			mBean.setRe_lev(rs.getInt("re_lev"));
			mBean.setRe_seq(rs.getInt("re_seq"));
			mBean.setRe_ref(rs.getInt("re_ref"));
			mBean.setReadcount(rs.getInt("readcount"));
			mBean.setSubject(rs.getString("subject"));

		} catch (Exception e) {
			System.out.println("get메소드에서 예외 발생 : " + e);
		} finally{
			resourceClose();
		}
		
		return mBean;
	}

	
	public int deleteMarket(int num, String  passwd){
		int check = 0;
			
		try {
			
			con = getConnection();
			
			sql = "select passwd from market where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(passwd.equals(rs.getString("passwd"))){
					check = 1; 
					
					sql = "delete from market where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate(); 
				}else{
					check = 0; 
				}				
			}	
		} catch (Exception e) {
			System.out.println("deleteMarket메소드 내부에서 예외 발생 : " + e);
		} finally {
			
			resourceClose();
		}
		return check; 
					
	}//deleteMarket
	
	
	

	public int updateMarket(MarketBean mBean){		
		int check = 0;
		try {
			
			con = getConnection();
			
			sql = "select passwd from market where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mBean.getNum());
			
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				
				
				if(mBean.getPasswd().equals(rs.getString("passwd"))){
					
					check =1; 
					
					sql = "update market set name=?, subject=?, content=? where num=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, mBean.getName());
					pstmt.setString(2, mBean.getSubject());
					pstmt.setString(3, mBean.getContent());
					pstmt.setInt(4, mBean.getNum());
					
					
					pstmt.executeUpdate();
					
				}else{
					check = 0; 
				}			
			}
						
		} catch (Exception e) {
			System.out.println("updateMarket메소드 오류:" + e);
		} finally {
			
			resourceClose();
		}	
		return check; 
		
	}//updateMarket	

	public void reInsertMarket(MarketBean mBean){
		
		int num = 0; 
		
		try{
			
			con = getConnection();
		
			sql = "select max(num) from market";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			
			sql = "update market set re_seq=re_seq+1 where re_ref=? and re_seq > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mBean.getRe_ref()); //부모글의 그룹번호 사용
			pstmt.setInt(2, mBean.getRe_seq());//부모글의 글 순서
			pstmt.executeUpdate();
			
			
			sql = "insert into market values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, mBean.getName());
			pstmt.setString(3, mBean.getPasswd());
			pstmt.setString(4, mBean.getSubject());
			pstmt.setString(5, mBean.getContent());
			pstmt.setInt(6, mBean.getRe_ref()); 
			pstmt.setInt(7,mBean.getRe_lev()+1);
			pstmt.setInt(8,mBean.getRe_seq()+1);
			pstmt.setInt(9, 0);
		    pstmt.setTimestamp(10, mBean.getDate());	
			pstmt.setString(11, mBean.getIp()); 
			
			
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("reInsertmarket메소드 내부에서 오류 : " + err);
		}finally {
			
			resourceClose();
		}	
	}//reInsertMarket
	
}//MarketDAO클래스 끝















