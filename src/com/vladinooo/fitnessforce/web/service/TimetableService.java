package com.vladinooo.fitnessforce.web.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.TimetableDao;

@Service("timetableService")
public class TimetableService {

	@Autowired
	private TimetableDao timetableDao;
	
	
	public boolean createSession(Session session) {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		session.setStartDatetime(dateFormat.format(date));
		article.setEnabled(true);
		return articlesDao.createArticle(article);
	}

	public List<Article> getArticles() {
		return articlesDao.getArticles();
	}

	public Article getArticle(int articleId) {
		return articlesDao.getArticle(articleId);
	}

	public boolean editArticle(Article article) {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		article.setDate(dateFormat.format(date));
		article.setEnabled(true);
		return articlesDao.editArticle(article);
	}
	
	public boolean deleteArticle(Article article) {
		return articlesDao.deleteArticle(article);
	}
	
}
