package dao;

import java.util.List;

import util.DaoHelper;
import vo.Customer;

public class CustomerDao {
	
	/**
	 * 회원가입 폼을 받아서 테이블에 추가한다.
	 * @param customer
	 */
	public void insertCustomer(Customer customer) {
		DaoHelper.update("customerDao.insertCustomer", customer.getId(), customer.getPassword(), customer.getName(), customer.getTel(), customer.getEmail());
	}

	/**
	 * 모든 회원정보를 반환한다.
	 * @return List<Customer>
	 */
	public List<Customer> getCustomers() {
		return DaoHelper.selectList("customerDao.getCustomers", rs -> {
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setPassword(rs.getString("cust_password"));
			customer.setName(rs.getString("cust_name"));
			customer.setTel(rs.getString("cust_tel"));
			customer.setEmail(rs.getString("cust_email"));
			customer.setDisabled(rs.getString("cust_disabled"));
			customer.setPoint(rs.getInt("cust_point"));
			customer.setUpdateDate(rs.getDate("cust_update_date"));
			customer.setCreateDate(rs.getDate("cust_create_date"));
			
			return customer;
		});
	}
	
	/**
	 * 회원의 아이디를 전달받아 탈퇴처리한다. disabled 값을 Yes로 바꾼다.
	 * @param id 회원의 아이디
	 */
	public void disableCustomer(String id) {
		DaoHelper.update("customerDao.disableCustomer", id);
	}
	
	/**
	 * 회원의 아이디를 전달받아 복구처리한다. disabled 값을 No로 바꾼다.
	 * @param id 회원의 아이디
	 */
	public void enableCustomer(String id) {
		DaoHelper.update("customerDao.enableCustomer", id);
	}
	
	/**
	 * 회원의 아이디를 전달받아 상세 정보를 표현한다.
	 * @param id 회원의 아이디
	 * @return 회원정보가 담긴 Customer 객체
	 */
	public Customer getCustomerById(String id) {
		return DaoHelper.selectOne("customerDao.getCustomer", rs -> {
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setPassword(rs.getString("cust_password"));
			customer.setName(rs.getString("cust_name"));
			customer.setTel(rs.getString("cust_tel"));
			customer.setEmail(rs.getString("cust_email"));
			customer.setDisabled(rs.getString("cust_disabled"));
			customer.setPoint(rs.getInt("cust_point"));
			customer.setUpdateDate(rs.getDate("cust_update_date"));
			customer.setCreateDate(rs.getDate("cust_create_date"));
			
			return customer;
		}, id);
	}
	
	/**
	 * 회원의 아이디를 전달받아 회원정보를 삭제한다.
	 * @param id 회원의 아이디
	 */
	public void deleteCustomerById(String id) { 
		DaoHelper.update("customerDao.deleteCustomer", id);
	}
}
