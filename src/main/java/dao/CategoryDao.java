package dao;

import java.util.List;

import util.DaoHelper;
import vo.Category;

public class CategoryDao {

	public List<Category> getCategories() {
		return DaoHelper.selectList("categoryDao.getCategories", rs -> {
			Category category = new Category(rs.getInt("cat_no"), rs.getString("cat_name"));
			
			return category;
		});
	}
	
}
