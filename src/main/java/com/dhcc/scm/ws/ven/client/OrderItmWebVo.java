
package com.dhcc.scm.ws.ven.client;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>orderItmWebVo complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="orderItmWebVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="fac" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="hisqty" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="hisrp" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="hisuom" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="orderid" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="orderitmid" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="veninccode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="venincname" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="venqty" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="venrp" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="venuom" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "orderItmWebVo", propOrder = {
    "fac",
    "hisqty",
    "hisrp",
    "hisuom",
    "orderid",
    "orderitmid",
    "veninccode",
    "venincname",
    "venqty",
    "venrp",
    "venuom"
})
public class OrderItmWebVo {

    protected Float fac;
    protected Float hisqty;
    protected Float hisrp;
    protected String hisuom;
    protected Long orderid;
    protected Long orderitmid;
    protected String veninccode;
    protected String venincname;
    protected Float venqty;
    protected Float venrp;
    protected String venuom;

    /**
     * 获取fac属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getFac() {
        return fac;
    }

    /**
     * 设置fac属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setFac(Float value) {
        this.fac = value;
    }

    /**
     * 获取hisqty属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getHisqty() {
        return hisqty;
    }

    /**
     * 设置hisqty属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setHisqty(Float value) {
        this.hisqty = value;
    }

    /**
     * 获取hisrp属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getHisrp() {
        return hisrp;
    }

    /**
     * 设置hisrp属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setHisrp(Float value) {
        this.hisrp = value;
    }

    /**
     * 获取hisuom属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHisuom() {
        return hisuom;
    }

    /**
     * 设置hisuom属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHisuom(String value) {
        this.hisuom = value;
    }

    /**
     * 获取orderid属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getOrderid() {
        return orderid;
    }

    /**
     * 设置orderid属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setOrderid(Long value) {
        this.orderid = value;
    }

    /**
     * 获取orderitmid属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getOrderitmid() {
        return orderitmid;
    }

    /**
     * 设置orderitmid属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setOrderitmid(Long value) {
        this.orderitmid = value;
    }

    /**
     * 获取veninccode属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVeninccode() {
        return veninccode;
    }

    /**
     * 设置veninccode属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVeninccode(String value) {
        this.veninccode = value;
    }

    /**
     * 获取venincname属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVenincname() {
        return venincname;
    }

    /**
     * 设置venincname属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVenincname(String value) {
        this.venincname = value;
    }

    /**
     * 获取venqty属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getVenqty() {
        return venqty;
    }

    /**
     * 设置venqty属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setVenqty(Float value) {
        this.venqty = value;
    }

    /**
     * 获取venrp属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getVenrp() {
        return venrp;
    }

    /**
     * 设置venrp属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setVenrp(Float value) {
        this.venrp = value;
    }

    /**
     * 获取venuom属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVenuom() {
        return venuom;
    }

    /**
     * 设置venuom属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVenuom(String value) {
        this.venuom = value;
    }

}
