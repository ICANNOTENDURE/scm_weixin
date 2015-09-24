
package com.dhcc.scm.ws.his.dhcclient;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="GetSCIInPoImInfo" type="{http://tempuri.org}GetSCIInPoImInfoRt" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt", propOrder = {
    "getSCIInPoImInfo"
})
public class ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt {

    @XmlElement(name = "GetSCIInPoImInfo", nillable = true)
    protected List<GetSCIInPoImInfoRt> getSCIInPoImInfo;

    /**
     * Gets the value of the getSCIInPoImInfo property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the getSCIInPoImInfo property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getGetSCIInPoImInfo().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link GetSCIInPoImInfoRt }
     * 
     * 
     */
    public List<GetSCIInPoImInfoRt> getGetSCIInPoImInfo() {
        if (getSCIInPoImInfo == null) {
            getSCIInPoImInfo = new ArrayList<GetSCIInPoImInfoRt>();
        }
        return this.getSCIInPoImInfo;
    }

}
