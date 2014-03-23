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
		Date dateCreated = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		article.setDateCreated(dateFormat.format(dateCreated));
		article.setEnabled(true);
		return articlesDao.createArticle(article);
	}

	public List<Article> getArticles() {
		return articlesDao.getArticles();
	}

}
