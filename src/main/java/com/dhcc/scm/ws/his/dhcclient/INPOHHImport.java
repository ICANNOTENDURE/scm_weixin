
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
 *         &lt;element name="Input" type="{http://tempuri.org}SCIInpoUmInfoRtMain" minOccurs="0"/>
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
    "input"
})
@XmlRootElement(name = "INPOHHImport")
public class INPOHHImport {

    @XmlElement(name = "Input")
    protected SCIInpoUmInfoRtMain input;

    /**
     * 获取input属性的值。
     * 
     * @return
     *     possible object is
     *     {@link SCIInpoUmInfoRtMain }
     *     
     */
    public SCIInpoUmInfoRtMain getInput() {
        return input;
    }

    /**
     * 设置input属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link SCIInpoUmInfoRtMain }
     *     
     */
    public void setInput(SCIInpoUmInfoRtMain value) {
        this.input = value;
    }

}
