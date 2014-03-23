package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("articlesDao")
public class ArticlesDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<Article> getArticles() {

		return jdbc.query("SELECT * FROM articles", new RowMapper<Article>() {

			public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article article = new Article();

				article.setArticleId(rs.getInt("article_id"));
				article.setSlug(rs.getString("slug"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setDateCreated(rs.getString("date_created"));
				article.setOrderId(rs.getInt("order_id"));
				article.setEnabled(rs.getBoolean("enabled"));
				return article;
			}

		});
	}
	
	
	public boolean createArticle(Article article) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("slug", article.getSlug());
		params.addValue("title", article.getTitle());
		params.addValue("content", article.getContent());
		params.addValue("dateCreated", article.getDateCreated());
		params.addValue("enabled", article.isEnabled());

		return jdbc.update(
				"insert into articles (slug, title, content, date_created, enabled) values (:slug, :title, :content, :dateCreated, :enabled)",
				params) == 1;
	}

}
