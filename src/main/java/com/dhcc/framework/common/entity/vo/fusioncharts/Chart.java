package com.dhcc.framework.common.entity.vo.fusioncharts;
import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;



/**
 * <p>
 * 标题: Chart.java
 * </p>
 * <p>
 * 业务描述:封装fusionCharts Chart属性对象
 * </p>
 * <p>
 * 公司:东华软件股份公司
 * </p>
 * <p>
 * 版权:dhcc2013
 * </p>
 * 
 * @author 林则鹏
 * @date 2013年8月3日
 * @version V1.0
 */
// 如有些属性任情况下都不要toJson在属性上加@JsonIgnor就行
@JsonInclude(Include.NON_NULL)
public class Chart implements Serializable {
	/**
	 * 字段: 字段名称
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	private String caption;
	private String numbersuffix;
	private String xaxisname;
	private String yaxisname;
	private String showvalues;
	private String unescapeLinks = "0";
	private String bgAlpha = "100";
	private String bgColor = "#f7f7eb";
	private String borderColor = "#EFE7D3";
	private String borderAlpha = "100";
	private String showAboutMenuItem="0";
	private String baseFont="微软雅黑";
	private String baseFontSize="11";
	
	private String pyaxisname;
	private String syaxisname;
	private String numberprefix;
	private String snumbersuffix;
	private String setadaptivesymin;
	private String decimals;
	private String showplotborder;
	private String palette;
	private String  font;
	private String  fontsize;
	private String  fontcolor;
	private List<DataSet> dataset;
	private String color;
	private String  numdivlines;
	private String yaxisminvalue;
	private String stack100percent;
	private String showpercentvalues;
	
	private String upperlimit;
	private String lowerlimit;
	private String majortmnumber;
	private String majortmheight;
	private String showgaugeborder;
	private String gaugeouterradius;
	private String gaugeoriginx;
	private String gaugeoriginy;
	private String gaugeinnerradius;
	private String pivotradius;
	private String showpivotborder;
	private String pivotbordercolor;
	private String pivotborderthickness;
	private String pivotfillmix;
	private String tickvaluedistance;
	
	
	private String subCaption;
	
	
	private String formatnumberscale;
	
	private String formatNumber;
	
	private String showLegend;
	private String legendposition;
	
	private String showlabels;
	private String labelDisplay;
	private String slantLabels;
	
	private String chartTopMargin;
	
	
	private String captionPadding;
	private String chartBottomMargin;
	
	/**
	 * @return the borderColor
	 */
	public String getBorderColor() {
		return borderColor;
	}

	/**
	 * @param borderColor
	 *            the borderColor to set
	 */
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}

	/**
	 * @return the borderAlpha
	 */
	public String getBorderAlpha() {
		return borderAlpha;
	}

	/**
	 * @param borderAlpha
	 *            the borderAlpha to set
	 */
	public void setBorderAlpha(String borderAlpha) {
		this.borderAlpha = borderAlpha;
	}

	/**
	 * @return caption
	 */
	public String getCaption() {
		return caption;
	}

	/**
	 * @param caption
	 *            caption
	 */
	public void setCaption(String caption) {
		this.caption = caption;
	}

	/**
	 * @return numbersuffix
	 */
	public String getNumbersuffix() {
		return numbersuffix;
	}

	/**
	 * @param numbersuffix
	 *            numbersuffix
	 */
	public void setNumbersuffix(String numbersuffix) {
		this.numbersuffix = numbersuffix;
	}

	/**
	 * @return xaxisname
	 */
	public String getXaxisname() {
		return xaxisname;
	}

	/**
	 * @param xaxisname
	 *            xaxisname
	 */
	public void setXaxisname(String xaxisname) {
		this.xaxisname = xaxisname;
	}

	/**
	 * @return yaxisname
	 */
	public String getYaxisname() {
		return yaxisname;
	}

	/**
	 * @param yaxisname
	 *            yaxisname
	 */
	public void setYaxisname(String yaxisname) {
		this.yaxisname = yaxisname;
	}

	/**
	 * @return showvalues
	 */
	public String getShowvalues() {
		return showvalues;
	}

	/**
	 * @param showvalues
	 *            showvalues
	 */
	public void setShowvalues(String showvalues) {
		this.showvalues = showvalues;
	}

	/**
	 * @return bgAlpha
	 */
	public String getBgAlpha() {
		return bgAlpha;
	}

	/**
	 * @param bgAlpha
	 *            bgAlpha
	 */
	public void setBgAlpha(String bgAlpha) {
		this.bgAlpha = bgAlpha;
	}

	/**
	 * @return bgColor
	 */
	public String getBgColor() {
		return bgColor;
	}

	/**
	 * @param bgColor
	 *            bgColor
	 */
	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	/**
	 * @return unescapeLinks
	 */
	public String getUnescapeLinks() {
		return unescapeLinks;
	}

	/**
	 * @param unescapeLinks
	 *            unescapeLinks
	 */
	public void setUnescapeLinks(String unescapeLinks) {
		this.unescapeLinks = unescapeLinks;
	}

	public String getPyaxisname() {
		return pyaxisname;
	}

	public void setPyaxisname(String pyaxisname) {
		this.pyaxisname = pyaxisname;
	}

	public String getSyaxisname() {
		return syaxisname;
	}

	public void setSyaxisname(String syaxisname) {
		this.syaxisname = syaxisname;
	}

	public String getNumberprefix() {
		return numberprefix;
	}

	public void setNumberprefix(String numberprefix) {
		this.numberprefix = numberprefix;
	}

	public String getSnumbersuffix() {
		return snumbersuffix;
	}

	public void setSnumbersuffix(String snumbersuffix) {
		this.snumbersuffix = snumbersuffix;
	}

	public String getSetadaptivesymin() {
		return setadaptivesymin;
	}

	public void setSetadaptivesymin(String setadaptivesymin) {
		this.setadaptivesymin = setadaptivesymin;
	}

	public String getDecimals() {
		return decimals;
	}

	public void setDecimals(String decimals) {
		this.decimals = decimals;
	}

	public String getShowplotborder() {
		return showplotborder;
	}

	public void setShowplotborder(String showplotborder) {
		this.showplotborder = showplotborder;
	}

	public String getPalette() {
		return palette;
	}

	public void setPalette(String palette) {
		this.palette = palette;
	}

	public String getFont() {
		return font;
	}

	public void setFont(String font) {
		this.font = font;
	}

	public String getFontsize() {
		return fontsize;
	}

	public void setFontsize(String fontsize) {
		this.fontsize = fontsize;
	}

	public String getFontcolor() {
		return fontcolor;
	}

	public void setFontcolor(String fontcolor) {
		this.fontcolor = fontcolor;
	}

	public List<DataSet> getDataset() {
		return dataset;
	}

	public void setDataset(List<DataSet> dataset) {
		this.dataset = dataset;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getNumdivlines() {
		return numdivlines;
	}

	public void setNumdivlines(String numdivlines) {
		this.numdivlines = numdivlines;
	}

	public String getYaxisminvalue() {
		return yaxisminvalue;
	}

	public void setYaxisminvalue(String yaxisminvalue) {
		this.yaxisminvalue = yaxisminvalue;
	}

	public String getStack100percent() {
		return stack100percent;
	}

	public void setStack100percent(String stack100percent) {
		this.stack100percent = stack100percent;
	}

	public String getShowpercentvalues() {
		return showpercentvalues;
	}

	public void setShowpercentvalues(String showpercentvalues) {
		this.showpercentvalues = showpercentvalues;
	}

	public String getUpperlimit() {
		return upperlimit;
	}

	public void setUpperlimit(String upperlimit) {
		this.upperlimit = upperlimit;
	}

	public String getLowerlimit() {
		return lowerlimit;
	}

	public void setLowerlimit(String lowerlimit) {
		this.lowerlimit = lowerlimit;
	}

	public String getMajortmnumber() {
		return majortmnumber;
	}

	public void setMajortmnumber(String majortmnumber) {
		this.majortmnumber = majortmnumber;
	}

	public String getMajortmheight() {
		return majortmheight;
	}

	public void setMajortmheight(String majortmheight) {
		this.majortmheight = majortmheight;
	}

	public String getShowgaugeborder() {
		return showgaugeborder;
	}

	public void setShowgaugeborder(String showgaugeborder) {
		this.showgaugeborder = showgaugeborder;
	}

	public String getGaugeouterradius() {
		return gaugeouterradius;
	}

	public void setGaugeouterradius(String gaugeouterradius) {
		this.gaugeouterradius = gaugeouterradius;
	}

	public String getGaugeoriginx() {
		return gaugeoriginx;
	}

	public void setGaugeoriginx(String gaugeoriginx) {
		this.gaugeoriginx = gaugeoriginx;
	}

	public String getGaugeoriginy() {
		return gaugeoriginy;
	}

	public void setGaugeoriginy(String gaugeoriginy) {
		this.gaugeoriginy = gaugeoriginy;
	}

	public String getGaugeinnerradius() {
		return gaugeinnerradius;
	}

	public void setGaugeinnerradius(String gaugeinnerradius) {
		this.gaugeinnerradius = gaugeinnerradius;
	}

	public String getPivotradius() {
		return pivotradius;
	}

	public void setPivotradius(String pivotradius) {
		this.pivotradius = pivotradius;
	}

	public String getShowpivotborder() {
		return showpivotborder;
	}

	public void setShowpivotborder(String showpivotborder) {
		this.showpivotborder = showpivotborder;
	}

	public String getPivotbordercolor() {
		return pivotbordercolor;
	}

	public void setPivotbordercolor(String pivotbordercolor) {
		this.pivotbordercolor = pivotbordercolor;
	}

	public String getPivotborderthickness() {
		return pivotborderthickness;
	}

	public void setPivotborderthickness(String pivotborderthickness) {
		this.pivotborderthickness = pivotborderthickness;
	}

	public String getPivotfillmix() {
		return pivotfillmix;
	}

	public void setPivotfillmix(String pivotfillmix) {
		this.pivotfillmix = pivotfillmix;
	}

	public String getTickvaluedistance() {
		return tickvaluedistance;
	}

	public void setTickvaluedistance(String tickvaluedistance) {
		this.tickvaluedistance = tickvaluedistance;
	}

	public String getSubCaption() {
		return subCaption;
	}

	public void setSubCaption(String subCaption) {
		this.subCaption = subCaption;
	}

	public String getFormatnumberscale() {
		return formatnumberscale;
	}

	public void setFormatnumberscale(String formatnumberscale) {
		this.formatnumberscale = formatnumberscale;
	}

	public String getFormatNumber() {
		return formatNumber;
	}

	public void setFormatNumber(String formatNumber) {
		this.formatNumber = formatNumber;
	}

	public String getShowLegend() {
		return showLegend;
	}

	public void setShowLegend(String showLegend) {
		this.showLegend = showLegend;
	}

	public String getLegendposition() {
		return legendposition;
	}

	public void setLegendposition(String legendposition) {
		this.legendposition = legendposition;
	}

	public String getShowlabels() {
		return showlabels;
	}

	public void setShowlabels(String showlabels) {
		this.showlabels = showlabels;
	}

	public String getLabelDisplay() {
		return labelDisplay;
	}

	public void setLabelDisplay(String labelDisplay) {
		this.labelDisplay = labelDisplay;
	}

	public String getSlantLabels() {
		return slantLabels;
	}

	public void setSlantLabels(String slantLabels) {
		this.slantLabels = slantLabels;
	}

	public String getChartTopMargin() {
		return chartTopMargin;
	}

	public void setChartTopMargin(String chartTopMargin) {
		this.chartTopMargin = chartTopMargin;
	}

	/**  
	 * @return showAboutMenuItem 
	 */
	public String getShowAboutMenuItem() {
		return showAboutMenuItem;
	}

	/**  
	 * @param showAboutMenuItem showAboutMenuItem 
	 */
	public void setShowAboutMenuItem(String showAboutMenuItem) {
		this.showAboutMenuItem = showAboutMenuItem;
	}

	/**  
	 * @return baseFont 
	 */
	public String getBaseFont() {
		return baseFont;
	}

	/**  
	 * @param baseFont baseFont 
	 */
	public void setBaseFont(String baseFont) {
		this.baseFont = baseFont;
	}

	/**  
	 * @return baseFontSize 
	 */
	public String getBaseFontSize() {
		return baseFontSize;
	}

	/**  
	 * @param baseFontSize baseFontSize 
	 */
	public void setBaseFontSize(String baseFontSize) {
		this.baseFontSize = baseFontSize;
	}

	public String getCaptionPadding() {
		return captionPadding;
	}

	public void setCaptionPadding(String captionPadding) {
		this.captionPadding = captionPadding;
	}

	public String getChartBottomMargin() {
		return chartBottomMargin;
	}

	public void setChartBottomMargin(String chartBottomMargin) {
		this.chartBottomMargin = chartBottomMargin;
	}
}
