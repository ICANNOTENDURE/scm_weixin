
package com.dhcc.scm.ws.ven.client;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;


/**
 * <p>venDeliveritm complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="venDeliveritm">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="deliveritmBatno" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="deliveritmExpdate" type="{http://www.w3.org/2001/XMLSchema}dateTime" minOccurs="0"/>
 *         &lt;element name="deliveritmFac" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="deliveritmHisQty" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="deliveritmHisRp" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="deliveritmHisUom" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="deliveritmHopincid" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="deliveritmId" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="deliveritmInvnoe" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="deliveritmOrderitmid" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="deliveritmParentid" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="deliveritmQty" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="deliveritmRp" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="deliveritmRpamt" type="{http://www.w3.org/2001/XMLSchema}float" minOccurs="0"/>
 *         &lt;element name="deliveritmUom" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="deliveritmVenincid" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="deliveritmWpsId" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "venDeliveritm", propOrder = {
    "deliveritmBatno",
    "deliveritmExpdate",
    "deliveritmFac",
    "deliveritmHisQty",
    "deliveritmHisRp",
    "deliveritmHisUom",
    "deliveritmHopincid",
    "deliveritmId",
    "deliveritmInvnoe",
    "deliveritmOrderitmid",
    "deliveritmParentid",
    "deliveritmQty",
    "deliveritmRp",
    "deliveritmRpamt",
    "deliveritmUom",
    "deliveritmVenincid",
    "deliveritmWpsId"
})
public class VenDeliveritm {

    protected String deliveritmBatno;
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar deliveritmExpdate;
    protected Float deliveritmFac;
    protected Float deliveritmHisQty;
    protected Float deliveritmHisRp;
    protected String deliveritmHisUom;
    protected Long deliveritmHopincid;
    protected Long deliveritmId;
    protected String deliveritmInvnoe;
    protected Long deliveritmOrderitmid;
    protected Long deliveritmParentid;
    protected Float deliveritmQty;
    protected Float deliveritmRp;
    protected Float deliveritmRpamt;
    protected String deliveritmUom;
    protected Long deliveritmVenincid;
    protected String deliveritmWpsId;

    /**
     * 获取deliveritmBatno属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDeliveritmBatno() {
        return deliveritmBatno;
    }

    /**
     * 设置deliveritmBatno属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDeliveritmBatno(String value) {
        this.deliveritmBatno = value;
    }

    /**
     * 获取deliveritmExpdate属性的值。
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getDeliveritmExpdate() {
        return deliveritmExpdate;
    }

    /**
     * 设置deliveritmExpdate属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setDeliveritmExpdate(XMLGregorianCalendar value) {
        this.deliveritmExpdate = value;
    }

    /**
     * 获取deliveritmFac属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getDeliveritmFac() {
        return deliveritmFac;
    }

    /**
     * 设置deliveritmFac属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setDeliveritmFac(Float value) {
        this.deliveritmFac = value;
    }

    /**
     * 获取deliveritmHisQty属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getDeliveritmHisQty() {
        return deliveritmHisQty;
    }

    /**
     * 设置deliveritmHisQty属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setDeliveritmHisQty(Float value) {
        this.deliveritmHisQty = value;
    }

    /**
     * 获取deliveritmHisRp属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getDeliveritmHisRp() {
        return deliveritmHisRp;
    }

    /**
     * 设置deliveritmHisRp属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setDeliveritmHisRp(Float value) {
        this.deliveritmHisRp = value;
    }

    /**
     * 获取deliveritmHisUom属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDeliveritmHisUom() {
        return deliveritmHisUom;
    }

    /**
     * 设置deliveritmHisUom属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDeliveritmHisUom(String value) {
        this.deliveritmHisUom = value;
    }

    /**
     * 获取deliveritmHopincid属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getDeliveritmHopincid() {
        return deliveritmHopincid;
    }

    /**
     * 设置deliveritmHopincid属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setDeliveritmHopincid(Long value) {
        this.deliveritmHopincid = value;
    }

    /**
     * 获取deliveritmId属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getDeliveritmId() {
        return deliveritmId;
    }

    /**
     * 设置deliveritmId属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setDeliveritmId(Long value) {
        this.deliveritmId = value;
    }

    /**
     * 获取deliveritmInvnoe属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDeliveritmInvnoe() {
        return deliveritmInvnoe;
    }

    /**
     * 设置deliveritmInvnoe属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDeliveritmInvnoe(String value) {
        this.deliveritmInvnoe = value;
    }

    /**
     * 获取deliveritmOrderitmid属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getDeliveritmOrderitmid() {
        return deliveritmOrderitmid;
    }

    /**
     * 设置deliveritmOrderitmid属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setDeliveritmOrderitmid(Long value) {
        this.deliveritmOrderitmid = value;
    }

    /**
     * 获取deliveritmParentid属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getDeliveritmParentid() {
        return deliveritmParentid;
    }

    /**
     * 设置deliveritmParentid属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setDeliveritmParentid(Long value) {
        this.deliveritmParentid = value;
    }

    /**
     * 获取deliveritmQty属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getDeliveritmQty() {
        return deliveritmQty;
    }

    /**
     * 设置deliveritmQty属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setDeliveritmQty(Float value) {
        this.deliveritmQty = value;
    }

    /**
     * 获取deliveritmRp属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getDeliveritmRp() {
        return deliveritmRp;
    }

    /**
     * 设置deliveritmRp属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setDeliveritmRp(Float value) {
        this.deliveritmRp = value;
    }

    /**
     * 获取deliveritmRpamt属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Float }
     *     
     */
    public Float getDeliveritmRpamt() {
        return deliveritmRpamt;
    }

    /**
     * 设置deliveritmRpamt属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Float }
     *     
     */
    public void setDeliveritmRpamt(Float value) {
        this.deliveritmRpamt = value;
    }

    /**
     * 获取deliveritmUom属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDeliveritmUom() {
        return deliveritmUom;
    }

    /**
     * 设置deliveritmUom属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDeliveritmUom(String value) {
        this.deliveritmUom = value;
    }

    /**
     * 获取deliveritmVenincid属性的值。
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getDeliveritmVenincid() {
        return deliveritmVenincid;
    }

    /**
     * 设置deliveritmVenincid属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setDeliveritmVenincid(Long value) {
        this.deliveritmVenincid = value;
    }

    /**
     * 获取deliveritmWpsId属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDeliveritmWpsId() {
        return deliveritmWpsId;
    }

    /**
     * 设置deliveritmWpsId属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDeliveritmWpsId(String value) {
        this.deliveritmWpsId = value;
    }

}
