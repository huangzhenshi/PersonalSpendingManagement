package account_huang.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;



import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import org.springframework.util.StringUtils;

import account_huang.entity.Blog;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;


@Service
public class BlogService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
	private CommonService commonService;
	
	
	public List<Blog> getAllBlogByPageAndSumTotal(PageCoral page,Blog blog) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",blog.getHoldername());
		 if(!StringUtils.isEmpty(blog.getCategory())){
			 params.put("category",blog.getCategory());
		 }
		 if(!StringUtils.isEmpty(blog.getTitle())){ 
			 params.put("title",blog.getTitle()); 
		 }
		 if(!StringUtils.isEmpty(blog.getNextlevelCategory())){ 
			 params.put("nextlevelCategory",blog.getNextlevelCategory()); 
		 }
		 params.put("tableName",Constants.TABLENAME_BLOG);
		 int  total= template.selectOne("account_huang.dao.CommonDao.queryCount",params);
		 page.setTotal(total);
		 List<Blog> list = template.selectList("account_huang.dao.BlogMapper.findAllPage",params);
		 return list;
	}
	
	public Blog findById(String id) {
		 return template.selectOne("account_huang.dao.BlogMapper.findById",id);
	}
	
	
	@Transactional
	public void saveBlog(Blog blog){
	     template.insert("account_huang.dao.BlogMapper.save", blog);
	    }
	
	@Transactional
	public void updateBlog(Blog blog){
		 template.update("account_huang.dao.BlogMapper.update", blog);
	}
	
	@Transactional
   public void deleteBlog(String ids){
		commonService.deleteById(Constants.TABLENAME_BLOG,ids);
	  }
	
}

