
package com.dhcc.scm.ws.his.dhcclient;

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
 *         &lt;element name="INPOHHImportResult" type="{http://tempuri.org}OperateResult"/>
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
    "inpohhImportResult"
})
@XmlRootElement(name = "INPOHHImportResponse")
public class INPOHHImportResponse {

    @XmlElement(name = "INPOHHImportResult", required = true)
    protected OperateResult inpohhImportResult;

    /**
     * 获取inpohhImportResult属性的值。
     * 
     * @return
     *     possible object is
     *     {@link OperateResult }
     *     
     */
    public OperateResult getINPOHHImportResult() {
        return inpohhImportResult;
    }

    /**
     * 设置inpohhImportResult属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link OperateResult }
     *     
     */
    public void setINPOHHImportResult(OperateResult value) {
        this.inpohhImportResult = value;
    }

}
