package com.shanshan.service;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.ISelect;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.shanshan.bean.ArticleBean;
import com.shanshan.bean.ArticleBeanExample;
import com.shanshan.bean.ArticleBeanExample.Criteria;
import com.shanshan.common.model.JsonResult;
import com.shanshan.common.model.PageRequest;
import com.shanshan.dao.ArticleBeanMapper;

@Service
public class ArticleService {

	@Autowired
	private ArticleBeanMapper articleBeanMapper;
	
	public Page<ArticleBean> articleList(ArticleBean entity, PageRequest page) {
		Page<ArticleBean> result = PageHelper.offsetPage(page.getStart(), page.getLimit())
				.doSelectPage(new ISelect() {
					@Override
					public void doSelect() {
						ArticleBeanExample example = new ArticleBeanExample();
						Criteria criteria = example.createCriteria();
						if (StringUtils.isNotBlank(entity.getCategoryName())) {
							criteria.andCategoryNameEqualTo(entity.getCategoryName());
						}
						if (entity.getRelatePermissionUserType() != null && entity.getRelatePermissionUserType() != 0) {
							criteria.andRelatePermissionUserTypeLessThanOrEqualTo(entity.getRelatePermissionUserType());
						}
						// 通过标题搜索文章
						if (StringUtils.isNotBlank(entity.getTitle())) {
							criteria.andTitleLike("%" + entity.getTitle() + "%");
						}
						criteria.andStatusEqualTo(10);
						example.setOrderByClause("create_time desc");
						articleBeanMapper.selectByExample(example);
					}
				});
		return result;
	}

	public ArticleBean articleDetail(ArticleBean entity) {
		ArticleBean article = articleBeanMapper.selectByPrimaryKey(entity.getArticleId());
		if (null != article) {
			Integer readCount = article.getReadCount();
			if (readCount == null) {
				readCount = 0;
			}
			article.setReadCount(readCount + 1); 
			articleBeanMapper.updateByPrimaryKeySelective(article);
		}
		return article;
	}

	public JsonResult saveOrUpdate(ArticleBean entity) {
		Date date = new Date(System.currentTimeMillis());
		if (entity == null && entity.getArticleId() != null) {
			ArticleBean article = articleBeanMapper.selectByPrimaryKey(entity.getArticleId());
			// 更新
			if (article != null) {
				if (StringUtils.isNotBlank(entity.getTitle())) {
					article.setTitle(entity.getTitle());
				}
				if (StringUtils.isNotBlank(entity.getAuthor())) {
					article.setAuthor(entity.getAuthor());
				}
				if (StringUtils.isNotBlank(entity.getContent())) {
					article.setContent(entity.getContent());
				}
				if (StringUtils.isNotBlank(entity.getCategoryName())) {
					article.setCategoryName(entity.getCategoryName());
				}
				if (entity.getTagId() != null && entity.getTagId() != 0) {
					article.setTagId(entity.getTagId());
				}
				if (entity.getRelateActivityId() != null && entity.getRelateActivityId() != 0) {
					article.setRelateActivityId(entity.getRelateActivityId());
				}
				if (entity.getRelatePermissionUserType() != null && entity.getRelatePermissionUserType() != 0) {
					article.setRelatePermissionUserType(entity.getRelatePermissionUserType());
				}
				if (entity.getStatus() != null && entity.getStatus() != 0) {
					article.setStatus(entity.getStatus());
				}
				if (StringUtils.isNotBlank(entity.getRemark())) {
					article.setRemark(entity.getRemark());
				}
				if (entity.getStartTime() != null) {
					article.setStartTime(entity.getStartTime());
				}
				if (entity.getEndTime() != null) {
					article.setEndTime(entity.getEndTime());
				}
				article.setUpdateTime(date);
				articleBeanMapper.updateByPrimaryKeySelective(article);
			} 
		}else {
			// 保存
			entity.setCreateTime(date);
			entity.setUpdateTime(date);
			articleBeanMapper.insertSelective(entity);
			
		}

		JsonResult result = new JsonResult(0, "", "");
		return result;
	}
	
}
