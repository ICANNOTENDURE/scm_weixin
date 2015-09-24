
package com.dhcc.scm.ws.his.dhcclient;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>SCIInpoUmInfoRtMain complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="SCIInpoUmInfoRtMain">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="InPoImInfos" type="{http://tempuri.org}ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SCIInpoUmInfoRtMain", propOrder = {
    "inPoImInfos"
})
public class SCIInpoUmInfoRtMain {

    @XmlElement(name = "InPoImInfos")
    protected ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt inPoImInfos;

    /**
     * 获取inPoImInfos属性的值。
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt }
     *     
     */
    public ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt getInPoImInfos() {
        return inPoImInfos;
    }

    /**
     * 设置inPoImInfos属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt }
     *     
     */
    public void setInPoImInfos(ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt value) {
        this.inPoImInfos = value;
    }

}
