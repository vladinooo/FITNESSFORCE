package com.vladinooo.fitnessforce.web.service;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.ArticlesDao;
import com.vladinooo.fitnessforce.web.dao.User;

@Service("articlesService")
public class ArticlesService {

	@Autowired
	private ArticlesDao articlesDao;

	private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
	private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

	public static String toSlug(String input) {
		String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");
		String normalized = Normalizer.normalize(nowhitespace, Form.NFD);
		String slug = NONLATIN.matcher(normalized).replaceAll("");
		return slug.toLowerCase(Locale.ENGLISH);
	}
	
	public boolean createArticle(Article article) {
		article.setSlug(toSlug(article.getTitle()));
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		article.setDate(dateFormat.format(date));
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
