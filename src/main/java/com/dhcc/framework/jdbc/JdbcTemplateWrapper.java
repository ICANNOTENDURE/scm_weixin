package com.dhcc.framework.jdbc;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;



@Repository
public class JdbcTemplateWrapper {

	private static Log logger = LogFactory.getLog(JdbcTemplateWrapper.class);
	
	private JdbcTemplate jdbcTemplate;
	private String dbType ="mysql";
	
	protected NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	
	@Resource(name="jdbcTemplate")
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
		this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
	}
	
	
	/**
	 * 查询所有匹配的列表
	 * @param sql 查询sql
	 * @param className 对象类型
	 * @param args 查询参数
	 * @return
	 * @author liuyg
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAllMatchList(String sql, Class className, Object[] args){
		RowMapper rowMapper = new ObjectRowMapper(className);
		List dataList = jdbcTemplate.query(sql, args, rowMapper);
		return dataList;
	}
	
	/**
	 * 查询所有匹配的列表
	 * @param sql 查询sql
	 * @param className 对象类型
	 * @param paramMap 查询参数
	 * @return
	 * @author liuyg
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAllMatchListWithParaMap(String sql, Class className, Map paramMap){
		if(logger.isInfoEnabled()){
			logger.info(getSqlFromQueryData(sql,paramMap));
		}
		RowMapper rowMapper = new ObjectRowMapper(className);
		return namedParameterJdbcTemplate.query(sql, paramMap, rowMapper);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void fillPagerModelData(PagerModel pagerModel,Class className,String columnNameForCount){
		
		if(pagerModel.getTotals()==0){
			int totalRows = this.getResultCountWithValuesMap(pagerModel.getQueryHql(), columnNameForCount, pagerModel.getHqlParamMap());
			pagerModel.setTotals(totalRows);
		}
		int startRow = getStartOfPage(pagerModel.getPageNo(),pagerModel.getPageSize());
		RowMapper rowMapper = new ObjectRowMapper(className);
		String sql = this.buildPageSql(pagerModel.getQueryHql(), startRow, pagerModel.getPageSize());
		//if(logger.isInfoEnabled()){
			logger.info(getSqlFromQueryData(sql, pagerModel.getHqlParamMap()));
		//}
		List dataList = namedParameterJdbcTemplate.query(sql, pagerModel.getHqlParamMap(), rowMapper);
		pagerModel.setPageData(dataList);
	}
	
	/**
	 * 多表sql 分页查询,多表连查时，才用这个方法，其他请用commonDao的 SQL分页查询
	 * @param sql
	 * @param className
	 * @param paramMap
	 * @param pageNo
	 * @param PageSize
	 * @param columnNameForCount
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAllMatchListWithParaMap(String sql, Class clasz, Map paramMap,int pageNo,int pageSize,String columnNameForCount){
		if(logger.isInfoEnabled()){
			logger.info(getSqlFromQueryData(sql,paramMap));
		}
		//int totalRows = this.getResultCountWithValuesMap(sql, columnNameForCount, paramMap);
		//pageNo = this.getValidPage(pageNo, totalRows, pageSize);
		int startRow = getStartOfPage(pageNo,pageSize);
		RowMapper rowMapper = new ObjectRowMapper(clasz);
		
		return namedParameterJdbcTemplate.query(this.buildPageSql(sql, startRow, pageSize), paramMap, rowMapper);
	}
	
	private String buildPageSql(String sql,int startRow,int pageSize){
		if("oracle".equals(this.dbType)){
			return this.buildOraclePageSql(sql, startRow, pageSize);
		}else if("mysql".equals(this.dbType)){
			return this.buildMysqlPageSql(sql, startRow, pageSize);
		}
		throw new DataBaseException("don't support db type,please confirm db is oracle or mysql");
	}
	
	private String buildOraclePageSql(String sql,int startRow,int pageSize){
		StringBuilder pageSql = new StringBuilder("SELECT * FROM  ");
		pageSql.append(" ( ");
		pageSql.append(" SELECT pageDataTable.*, ROWNUM RNV ");
		pageSql.append(" FROM ("+sql+" ) pageDataTable ");
		pageSql.append(" WHERE ROWNUM <= " +(startRow+pageSize) );
		pageSql.append(" )  WHERE RNV >= " +(startRow+1));
		return pageSql.toString();
	}
	
	private String buildMysqlPageSql(String sql,int startRow,int pageSize){
		sql = sql+" limit " + startRow +", " +pageSize;
		return sql;
	}
	
	private Integer  getValidPage(Integer pageNo, int totalRows, Integer pageSize){
        if (!isValidPage(pageNo, totalRows, pageSize)) {
            return getValidPage(--pageNo, totalRows, pageSize);
        }
        int pageCount = (totalRows+(pageSize-(totalRows%pageSize==0?pageSize:totalRows%pageSize)))/pageSize ;
        return pageCount;	
	}
	
	public static int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}
	
    private boolean isValidPage(Integer pageNo, Integer totalRows, Integer pageSize) {
        if (pageNo == 1) {
            return true;
        }
        int rowStart = (pageNo - 1) * pageSize;
        int rowEnd = rowStart + pageSize;
        if (rowEnd > totalRows) {
            rowEnd = totalRows;
        }
        return rowEnd > rowStart;
    }
    
	/**
	 * 查询记录数
	 * @param sql
	 * @param columnNameForCount
	 * @param praValuesMap
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public int getResultCountWithValuesMap( String sql,String columnNameForCount,  Map<String, Object> praValuesMap) {
		String countQuerySql = " select count(" + columnNameForCount + ") " + removeSelect(removeOrders(sql));
		return namedParameterJdbcTemplate.queryForInt(countQuerySql, praValuesMap);
	}
	
	public int getResultCount( String sql, Map<String, Object> praValuesMap) {
		String countQuerySql = " select count(*)  from ( " + sql+") b ";
		return namedParameterJdbcTemplate.queryForObject(countQuerySql, praValuesMap, Integer.class);
	}
	
	public static String getSqlFromQueryData(String sql, Map<String,Object> paramMap) {
		if(StringUtils.isEmpty(sql)) {
			return "";
		}
		StringBuffer sqlExp = new StringBuffer(sql);
		for(Entry<String,Object> entry : paramMap.entrySet()){
			int start = sqlExp.indexOf(entry.getKey());
			if(entry.getValue()!=null){
				sqlExp.replace(start-1, start+entry.getKey().length(), "'"+entry.getValue().toString()+"'");
			}
		}
		return sqlExp.toString();
	}
	
	private static String removeSelect(String sql) {
		int beginPos = sql.toLowerCase().indexOf("from");
		return sql.substring(beginPos);
	}
	
	/** 
	 * 去除sql的orderby 用于页查果询 
	 * @param sql
	 * @return
	 */
	private static String removeOrders(String sql) {
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(sql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}

}
