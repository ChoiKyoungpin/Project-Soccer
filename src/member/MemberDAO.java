package member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;
import member.MemberDAO;
import member.MemberBean;

//하는일
//1.DBMS mysql의 jspChoi데이터베이스와 연결(접속)
//2.insert, update, delete, select구문등을 만들어서
//  jspChoi데이터베이스에 전송하여 실행~
public class MemberDAO {//DB작업 하는 클래스 
	
	//전역변수 선언
	Connection con = null;
	ResultSet  rs = null;
	PreparedStatement pstmt = null;
	String sql="";
	
	//자원 해제 하는 메소드 
	public void resourceClose(){
	  try{	
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
		if(con != null) con.close();
	  }catch(Exception e){
		  System.out.println("자원해제 실패 : " + e);
	  }
	}//resourceClose()
	
	//연결할 jspChoi데이터베이스 정보를 담고 있는
	//DataSource(커넥션풀)을 얻고
	//DataSource(커넥션풀)내부에 DB와 미리 연결을 맺은  Connection접속객체를 얻기 위해
	//메소드 만들기
	private Connection getConnection() throws Exception{ 
		
		Connection con = null;
		Context init = new InitialContext();
		//커넥션풀 얻기 
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		//커넥션풀로 부터 커넥션 객체 빌려와서 얻기 
		con = ds.getConnection();
		
		return con; //커넥션을 반환
		
	}//getConnection메소드 끝

	//join.jsp에서 입력한 회원정보들을 -> 
	//MemberBean객체의 각변수에 저장후 -> 
	//MemberDAO의 insertMember메소드의매개변수로 전달 받음
	/*입력받은 회원정보들을 DB에 insert시키는 메소드 */
	public void insertMember(MemberBean  memberBean){
			
		try{	
			//1.DB접속(연결) : 커넥션풀 DataSource로 부터  커넥션 Connection객체 빌려오기 
			con = getConnection();
			
			//2.SQL문 만들기 (INSERT)
			sql = "insert into member(id,passwd,name,reg_date,email,address,tel,age)"
				+ "values(?,?,?,now(),?,?,?,?)";
			
			//3. 위 Insert전체 문자열 중에서 ?기호에 대응되는 설정값을 제외한  전체 구문을
			//  PreparedStatement객체에 로딩후 
			//  PreparedStatement객체 자체를 반환
			pstmt = con.prepareStatement(sql);
			//4. ?기호에 대응되는 값들을  설정
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPasswd());
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getEmail());
			pstmt.setString(5, memberBean.getAddress());
			pstmt.setString(6, memberBean.getTel());
			pstmt.setInt(7, memberBean.getAge());
			
		
			//5. insert 문장을 DB에 전송 하여 실행
			pstmt.executeUpdate();
		  }catch(Exception e){
			  System.out.println("insertMember메소드 내부에서 SQL실행예외 : " + e);
		  }	finally { //무조건 한번 실행 해야 할 구문이 있을때.... 작성하는 영역
			//6.자원해제
			resourceClose();  
		  }
	}//insertMember메소드 끝
	
	//아이디 중복 체크 하는 메소드
	//->  회원가입시 사용자가 입력한 아이디가 DB에 존재하는지 SELECT하여 
	//    존재하면   check변수의 값을 1로 저장 하여  아이디 중복을 나타내고,
	//    존재 하지 않으면  check변수의 값을 0으로 저장 하여 아이디 중복아님을 나타내고,
	//->  결과 적으로 아이디 중복이냐 중복이 아니냐는 check변수에 판단 값이 저장 되므로
	//    check변수의 값을 리턴(반환) 함.
	public int idCheck(String id){//입력한 아이디를 매개변수로 전달 받는다.
		
		int check = 0; //아이디 중복이냐 , 아니냐를? 판단 하는값을 저장
		
		try {
			//1.커넥션풀로 부터 커넥션 객체 얻기(DB연결)
			con = getConnection();
			//2.SQL문 만들기 : 사용자가 입력한 아이디에 해당하는 레코드 검색
			sql = "select * from member where id=?";
			//3.SQL문을 실행할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			//4. ?기호에 대응 되는 입력한 아이디 값 설정
			pstmt.setString(1, id);
			//5. select 실행 후 검색한 결과데이터 얻기
			rs = pstmt.executeQuery();
			//6. ResultSet객체 메모리에 입력한 아이디에 해당하는 회원정보가 검색 되어 저장되어 있으면
			if(rs.next()){
				check = 1; //아이디중복
			}else{
				check = 0; //아이디중복아님
			}
		} catch (Exception e) {
			System.out.println("idCheck메소드 내부에서 예외 발생 : " + e);
		} finally {
			//7.자원해제
			resourceClose();
		}
		//8.리턴 
		return check; // 1 또는 0을  join_IDcheck.jsp로 리턴한다.
	
	}//idCheck()메소드 끝
	
	
	//로그인 처리시 사용하는 메소드(loginPro.jsp페이지에서 호출하는 메소드)
	//입력받은 id,passwd값과 DB에 저장되어 있는 id,passwd값을 비교하여
	//로그인처리 하는 메소드 
	public int userCheck(String id, String passwd){//사용자가 입력한 아이디, 비밀번호 전달 받음
		
		int check = -1;  //  1  ->  아이디 맞음, 비밀번호 맞음
						 //  0  ->  아이디 맞음 , 비밀번호 틀림
						 //  -1 ->  아이디 틀림	
		try {
			//1.커넥션풀로부터 커넥션 얻기
			con = getConnection();
			//2.SQL문 만들기  : 사용자가 입력한 아이디에 해당하는 레코드 검색
			sql = "select * from member where id=?";
			//3.SQL문을 실행할 PreparedStatement객체 얻기
			pstmt  = con.prepareStatement(sql);
			//4. ?기호에 대응 되는 입력한 아이디값을 설정
			pstmt.setString(1, id);
			//5. 입력한 아이디에 해당하는 레코드 검색 실행~
			rs = pstmt.executeQuery();
			//6. 입력한 아이디에 해당하는 레코드가 ResultSet에 저장되어 있다면
			if(rs.next()){//입력한 아이디가 DB에 저장되어 있다면
				//로그인시 사용자가 입력한 비밀번호와 DB에 저장되어 있던 비밀번호를 비교하여
				//동일하면?
				if(passwd.equals(rs.getString("passwd"))){
					check = 1; //아이디 맞음 , 비밀번호 맞음
				}else{	
					check = 0; //아이디 맞음 , 비밀번호 틀림
				}
			}else{//입력한 아이디에 해당하는 레코드가 검색되지 않는다면
				 //(입력한 아이디가 DB에 저장되어 있지 않다면)
				check = -1;
			}
		} catch (Exception e) {
			System.out.println("userCheck메소드 내부에서 예외 발생 : " + e);
		} finally {
			//자원해제
			resourceClose();
		}
		return check;//loginPro.jsp로 반환 
	}
	/*수정할 글정보(MemberBean)객체를 메소드의 매개변수로 전달받아.. DB에 저장된 비밀번호와 일치하면 글 수정*/
	public int updateMember(MemberBean mBean){		
		int check = 0;
		try {
			//1.DB연결
			con = getConnection();
			//2. 매개변수로 전달받는 MemberBean객체의 id변수에 저장된 수정할 글번호에 해당하는
			//   비밀번호 검색
			sql = "select passwd from member where id=?";
			//3. select문을 실행할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			//4. ? 설정
			pstmt.setString(1, mBean.getId());
			
			//비밀번호 검색후 검색한 데이터를 ResultSet에 저장후 반환 받기 
			rs = pstmt.executeQuery();
			
			//5. 수정할 글번호에 대한 비밀번호가 검색이 되면?
			if(rs.next()){
				
				//글수정시 사용자가 입력 비밀번호와 DB에 저장되어 있는 수정할 글의 비밀번호가 일치하면?
				if(mBean.getPasswd().equals(rs.getString("passwd"))){
					
					check =1; //비밀번호 맞음 -> 글을 수정 해야함
					
					sql = "update member set name=?,pwd=?, email=?, tel=? where id=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, mBean.getName());
					pstmt.setString(2, mBean.getPasswd());
					pstmt.setString(3, mBean.getEmail());
					pstmt.setString(4, mBean.getTel());
					
					//UPDATE문장 실행
					pstmt.executeUpdate();
					
				}else{
					check = 0; //비밀번호 틀림-> 글을 수정하지 않음
				}			
			}
						
		} catch (Exception e) {
			System.out.println("updatemember메소드 오류:" + e);
		} finally {
			//자원해제
			resourceClose();
		}	
		return check; //updatemember.jsp로 수정에 성공하면 1을 반환 실패하면 0을 반환
	}//updateMember
	
	public int deleteMember(String id, String passwd){
		int check = 0;
		
		try {
			//커넥션풀로 부터 커넥션객체 얻기(DB연결)
			con = getConnection();
			
			//SQL문 매개변수로 전달 받는 글 num에 해당하는 글의 비밀번호 검색
			sql = "select passwd from member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {//삭제할 글에 대한 비밀번호가 검색이 된다면?
				//사용자가 입력한 비밀번호(passwd)와 검색해온 글의 비밀번호(rs.getString("passwd")) 비교하여 동일하면?
				if (passwd.equals(rs.getString("passwd"))) {
					check = 1; //삭제시키자
					//SQL문 만들기 : 매개변수로 전달받은 글번호에 해당하는 글의 삭제
					sql = "delete from member where id=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					pstmt.executeUpdate(); //delete 실행
				}else{// 사용자가 입력한 비밀번호와 DB에 저장된 비밀번호가 다르면?
					check=0;
					 }
				}
			
		} catch (Exception e) {
			System.out.println("deleteMember메소드 내부에서 예외 발생 : "+e);
		}finally {
			//자원해제
			resourceClose();
		}
		
		
		return check;  // 사용자가 입력한 아이디와비밀번호가DB에 저장된아이디와비밀번호가 일치하면 check변수의 값 1을 반환, 그반대이면 check변수의 값 0을 리턴
		
	}//deleteMember 끝
	
}//MemberDAO클래스 끝







