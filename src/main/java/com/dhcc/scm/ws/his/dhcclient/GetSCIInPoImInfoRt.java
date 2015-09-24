
package com.dhcc.scm.ws.his.dhcclient;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>GetSCIInPoImInfoRt complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="GetSCIInPoImInfoRt">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="InciDr" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="BatNo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="InvNo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ExpDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="Realqty" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="CTUOMDR" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="RealPrice" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="RealTotal" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="VendorDR" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="PhmnfDR" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ReCTLOCDR" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="PmsInPoID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="IngdReced" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ReceiveDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ReceiveTime" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="OrderQty" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetSCIInPoImInfoRt", propOrder = {
    "inciDr",
    "batNo",
    "invNo",
    "expDate",
    "realqty",
    "ctuomdr",
    "realPrice",
    "realTotal",
    "vendorDR",
    "phmnfDR",
    "reCTLOCDR",
    "pmsInPoID",
    "ingdReced",
    "receiveDate",
    "receiveTime",
    "orderQty"
})
public class GetSCIInPoImInfoRt {

    @XmlElement(name = "InciDr")
    protected String inciDr;
    @XmlElement(name = "BatNo")
    protected String batNo;
    @XmlElement(name = "InvNo")
    protected String invNo;
    @XmlElement(name = "ExpDate")
    protected String expDate;
    @XmlElement(name = "Realqty")
    protected String realqty;
    @XmlElement(name = "CTUOMDR")
    protected String ctuomdr;
    @XmlElement(name = "RealPrice")
    protected String realPrice;
    @XmlElement(name = "RealTotal")
    protected String realTotal;
    @XmlElement(name = "VendorDR")
    protected String vendorDR;
    @XmlElement(name = "PhmnfDR")
    protected String phmnfDR;
    @XmlElement(name = "ReCTLOCDR")
    protected String reCTLOCDR;
    @XmlElement(name = "PmsInPoID")
    protected String pmsInPoID;
    @XmlElement(name = "IngdReced")
    protected String ingdReced;
    @XmlElement(name = "ReceiveDate")
    protected String receiveDate;
    @XmlElement(name = "ReceiveTime")
    protected String receiveTime;
    @XmlElement(name = "OrderQty")
    protected String orderQty;

    /**
     * 获取inciDr属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInciDr() {
        return inciDr;
    }

    /**
     * 设置inciDr属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInciDr(String value) {
        this.inciDr = value;
    }

    /**
     * 获取batNo属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBatNo() {
        return batNo;
    }

    /**
     * 设置batNo属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBatNo(String value) {
        this.batNo = value;
    }

    /**
     * 获取invNo属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInvNo() {
        return invNo;
    }

    /**
     * 设置invNo属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInvNo(String value) {
        this.invNo = value;
    }

    /**
     * 获取expDate属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExpDate() {
        return expDate;
    }

    /**
     * 设置expDate属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExpDate(String value) {
        this.expDate = value;
    }

    /**
     * 获取realqty属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRealqty() {
        return realqty;
    }

    /**
     * 设置realqty属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRealqty(String value) {
        this.realqty = value;
    }

    /**
     * 获取ctuomdr属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCTUOMDR() {
        return ctuomdr;
    }

    /**
     * 设置ctuomdr属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCTUOMDR(String value) {
        this.ctuomdr = value;
    }

    /**
     * 获取realPrice属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRealPrice() {
        return realPrice;
    }

    /**
     * 设置realPrice属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRealPrice(String value) {
        this.realPrice = value;
    }

    /**
     * 获取realTotal属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRealTotal() {
        return realTotal;
    }

    /**
     * 设置realTotal属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRealTotal(String value) {
        this.realTotal = value;
    }

    /**
     * 获取vendorDR属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVendorDR() {
        return vendorDR;
    }

    /**
     * 设置vendorDR属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVendorDR(String value) {
        this.vendorDR = value;
    }

    /**
     * 获取phmnfDR属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPhmnfDR() {
        return phmnfDR;
    }

    /**
     * 设置phmnfDR属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPhmnfDR(String value) {
        this.phmnfDR = value;
    }

    /**
     * 获取reCTLOCDR属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReCTLOCDR() {
        return reCTLOCDR;
    }

    /**
     * 设置reCTLOCDR属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReCTLOCDR(String value) {
        this.reCTLOCDR = value;
    }

    /**
     * 获取pmsInPoID属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPmsInPoID() {
        return pmsInPoID;
    }

    /**
     * 设置pmsInPoID属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPmsInPoID(String value) {
        this.pmsInPoID = value;
    }

    /**
     * 获取ingdReced属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIngdReced() {
        return ingdReced;
    }

    /**
     * 设置ingdReced属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIngdReced(String value) {
        this.ingdReced = value;
    }

    /**
     * 获取receiveDate属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReceiveDate() {
        return receiveDate;
    }

    /**
     * 设置receiveDate属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReceiveDate(String value) {
        this.receiveDate = value;
    }

    /**
     * 获取receiveTime属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReceiveTime() {
        return receiveTime;
    }

    /**
     * 设置receiveTime属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReceiveTime(String value) {
        this.receiveTime = value;
    }

    /**
     * 获取orderQty属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getOrderQty() {
        return orderQty;
    }

    /**
     * 设置orderQty属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setOrderQty(String value) {
        this.orderQty = value;
    }

}
