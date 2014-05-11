package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component("articlesDao")
public class ArticlesDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public org.hibernate.classic.Session session() {
		return sessionFactory.getCurrentSession();
	}

	
//	public List<Article> getArticles() {
//
//		return jdbc.query("SELECT * FROM articles", new RowMapper<Article>() {
//
//			public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
//				Article article = new Article();
//
//				article.setArticleId(rs.getInt("article_id"));
//				article.setSlug(rs.getString("slug"));
//				article.setTitle(rs.getString("title"));
//				article.setContent(rs.getString("content"));
//				article.setDatetime(rs.getString("datetime"));
//				article.setEnabled(rs.getBoolean("enabled"));
//				return article;
//			}
//
//		});
//	}
	
	
	// Hibernate
	@SuppressWarnings("unchecked")
	public List<Article> getArticles() {
		return session().createQuery("from Article").list();
	}
	
	
	public boolean createArticle(Article article) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("slug", article.getSlug());
		params.addValue("title", article.getTitle());
		params.addValue("content", article.getContent());
		params.addValue("datetime", article.getDatetime());
		params.addValue("enabled", article.isEnabled());

		return jdbc.update(
				"insert into articles ("
				+ "slug,"
				+ "title,"
				+ "content,"
				+ "datetime,"
				+ "enabled) values ("
				+ ":slug,"
				+ ":title,"
				+ ":content,"
				+ ":datetime,"
				+ ":enabled)",
				params) == 1;
	}
	
	
	public Article getArticle(int articleId) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("articleId", articleId);

		try {

			return jdbc.queryForObject(
					"select * from articles where article_id = :articleId", params,
					new RowMapper<Article>() {

						public Article mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							Article article = new Article();

							article.setArticleId(rs.getInt("article_id"));
							article.setSlug(rs.getString("slug"));
							article.setTitle(rs.getString("title"));
							article.setContent(rs.getString("content"));
							article.setDatetime(rs.getString("datetime"));
							article.setEnabled(rs.getBoolean("enabled"));
							return article;
						}

					});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}
	
	
	public boolean editArticle(Article article) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("articleId", article.getArticleId());
		params.addValue("slug", article.getSlug());
		params.addValue("title", article.getTitle());
		params.addValue("content", article.getContent());
		params.addValue("datetime", article.getDatetime());
		params.addValue("enabled", article.isEnabled());

		return jdbc.update(
				"update articles set "
				+ "slug = :slug,"
				+ "title = :title,"
				+ "content = :content,"
				+ "datetime = :datetime,"
				+ "enabled = :enabled"
				+ " where article_id = :articleId",
				params) == 1;
	}
	

	public boolean deleteArticle(Article article) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("articleId", article.getArticleId());
		return jdbc.update("delete from articles where article_id = :articleId", params) == 1;
	}

}
