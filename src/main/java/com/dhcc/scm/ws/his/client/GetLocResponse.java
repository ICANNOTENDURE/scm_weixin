
package com.dhcc.scm.ws.his.client;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="GetLocResult" type="{http://www.dhcc.com}HisCtlocList"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "getLocResult"
})
@XmlRootElement(name = "GetLocResponse")
public class GetLocResponse {

    @XmlElement(name = "GetLocResult", required = true)
    protected HisCtlocList getLocResult;

    /**
     * 获取getLocResult属性的值。
     * 
     * @return
     *     possible object is
     *     {@link HisCtlocList }
     *     
     */
    public HisCtlocList getGetLocResult() {
        return getLocResult;
    }

    /**
     * 设置getLocResult属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link HisCtlocList }
     *     
     */
    public void setGetLocResult(HisCtlocList value) {
        this.getLocResult = value;
    }

}
