
package com.dhcc.scm.ws.ven.client;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>orderWebVo complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="orderWebVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="desction" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="emflag" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="hopname" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="orderItmWSVos" type="{http://ven.ws.pms.dhcc.com/}orderItmWebVo" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="orderid" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="orderno" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="purloc" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="recloc" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="remark" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "orderWebVo", propOrder = {
    "desction",
    "emflag",
    "hopname",
    "orderItmWSVos",
    "orderid",
    "orderno",
    "purloc",
    "recloc",
    "remark"
})
public class OrderWebVo {

    protected String desction;
    protected String emflag;
    protected String hopname;
    @XmlElement(nillable = true)
    protected List<OrderItmWebVo> orderItmWSVos;
    protected Long orderid;
    protected String orderno;
    protected String purloc;
    protected String recloc;
    protected String remark;

    /**
     * 获取desction属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDesction() {
        return desction;
    }

    /**
     * 设置desction属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDesction(String value) {
        this.desction = value;
    }

    /**
     * 获取emflag属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEmflag() {
        return emflag;
    }

    /**
     * 设置emflag属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEmflag(String value) {
        this.emflag = value;
    }

    /**
     * 获取hopname属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHopname() {
        return hopname;
    }

    /**
     * 设置hopname属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHopname(String value) {
        this.hopname = value;
    }

    /**
     * Gets the value of the orderItmWSVos property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the orderItmWSVos property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getOrderItmWSVos().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link OrderItmWebVo }
     * 
     * 
     */
    public List<OrderItmWebVo> getOrderItmWSVos() {
        if (orderItmWSVos == null) {
            orderItmWSVos = new ArrayList<OrderItmWebVo>();
        }
        return this.orderItmWSVos;
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
     * 获取orderno属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getOrderno() {
        return orderno;
    }

    /**
     * 设置orderno属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setOrderno(String value) {
        this.orderno = value;
    }

    /**
     * 获取purloc属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPurloc() {
        return purloc;
    }

    /**
     * 设置purloc属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPurloc(String value) {
        this.purloc = value;
    }

    /**
     * 获取recloc属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRecloc() {
        return recloc;
    }

    /**
     * 设置recloc属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRecloc(String value) {
        this.recloc = value;
    }

    /**
     * 获取remark属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置remark属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRemark(String value) {
        this.remark = value;
    }

}
